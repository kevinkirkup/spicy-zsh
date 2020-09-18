#!/usr/bin/env zsh

# Get the IP of the Node for Kubernetes under MacOSX
#export KAFKA_NODEPORT_IP=$(kubectl get nodes -o jsonpath='{.items[*].status.addresses[?(@.type=="InternalIP")].address}')
export KAFKA_BOOTSTRAP_SERVER=kkirkup-openstack1:9092


# --------------------------------------------------
# Function to tail the the specified topic
# --------------------------------------------------
tail_topic() {
  local TOPIC=$1
  local EXTRA_ARGS=$2
  local BROKER=${3:-localhost:31090}

  if [[ -z $TOPIC ]]; then
    echo Must specify topic to tail!
    echo tail_topic TOPIC [EXTRA_ARGS] [BROKER]
    return
  fi

  unbuffer kafkacat -b ${BROKER} -t ${TOPIC} -C ${EXTRA_ARGS} -f "\nOffset %o [%p] %k\n%s" | jq -S --unbuffered -R -r '. as $line | try fromjson catch $line'
}

# --------------------------------------------------
# Dump contents of the topic to the specified file
# --------------------------------------------------
dump_topic() {
  local TOPIC=$1
  local BROKER=${2:-localhost:31090}

  if [[ -z $TOPIC ]]; then
    echo Must specify topic to tail!
    echo tail_topic TOPIC [BROKER]
    return
  fi

  unbuffer kafkacat -b ${BROKER} -t ${TOPIC} -q -C -o beginning -e -f "\nOffset %o [%p] %k\t%s" 2>/dev/null
}

# --------------------------------------------------
# Print the list of Topics
# --------------------------------------------------
list_topics() {

  local BROKER=${1:-localhost:31090}

  kafkacat -b ${BROKER} -L | grep "topic" | awk -F' ' 'BEGIN{ print "\033[34m\033[1m--------------" } { if (FNR>2){ print $2 } else if (FNR==2){ print $0 "\n--------------\033[0m" } else { print $0 }}' | tr -d '"'
}

# --------------------------------------------------
# Print the list of Kafka Connect Connectors
# --------------------------------------------------
kafka_connectors() {
  local BROKER=$1
  curl "http://${BROKER}:8083/connectors" | jq -S --unbuffered -R -r '. as $line | try fromjson catch $line'
}

# --------------------------------------------------
# Print the list of Kafka Connect Connectors
# --------------------------------------------------
kafka_topics() {
  local BROKER=$1
  curl "http://${BROKER}:8082/topics" | jq -S --unbuffered -R -r '. as $line | try fromjson catch $line'
}

# --------------------------------------------------
# Print the partitions and their current offsets and timestamp
# --------------------------------------------------
list_partition_offsets() {

  local TOPIC=$1
  local BROKER=${2:-localhost:31090}

  local PARITION_COUNT=$(kafkacat -b ${BROKER} -t ${TOPIC} -L -J | jq '.topics[0].partitions | length')

  for i in {0..${PARITION_COUNT}}; do

    local DATA=$(kafkacat -b ${BROKER} -t ${TOPIC} -C -o -1 -p${i} -e -f '%p:%o:%T\n' 2>/dev/null)
    local DATE_MS=$(echo ${DATA} | awk -F: '{print $3}')
    local TIMESTAMP=`date -r $(( ${DATE_MS} / 1000)) +"%Y-%m-%dT%H:%M:%S"`

    echo $DATA | awk -F: '{printf "Parition: %02i - Offset: %i", $1, $2}'
    echo " - Timestamp: ${TIMESTAMP}.$(( ${DATE_MS} % 1000))"
  done
}
