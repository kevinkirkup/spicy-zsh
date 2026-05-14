#!/usr/bin/env zsh

# Get the IP of the Node for Kubernetes under MacOSX
#export KAFKA_NODEPORT_IP=$(kubectl get nodes -o jsonpath='{.items[*].status.addresses[?(@.type=="InternalIP")].address}')
export KAFKA_BOOTSTRAP_SERVER=localhost:10092


# --------------------------------------------------
# Function to tail the the specified topic
# --------------------------------------------------
tail_topic() {
  local TOPIC=$1
  local EXTRA_ARGS=$2
  local BROKER=${3:-127.0.2.1:9092}
  local SCHEMA_REGISTRY=${3:-localhost:10081}

  if [[ -z $TOPIC ]]; then
    echo Must specify topic to tail!
    echo tail_topic TOPIC [EXTRA_ARGS] [BROKER]
    return
  fi

  unbuffer kcat \
    -b ${BROKER} \
    -t ${TOPIC} \
    -r ${SCHEMA_REGISTRY} \
    -C ${EXTRA_ARGS} \
    -f "\nOffset %o [%p] %k\n%s" \
    | jq -S --unbuffered -R -r '. as $line | try fromjson catch $line'
}

# --------------------------------------------------
# Dump contents of the topic to the specified file
# --------------------------------------------------
dump_topic() {
  local TOPIC=$1
  local BROKER=${2:-127.0.2.1:9092}
  local SCHEMA_REGISTRY=${3:-localhost:10081}

  if [[ -z $TOPIC ]]; then
    echo Must specify topic to tail!
    echo tail_topic TOPIC [BROKER]
    return
  fi

  unbuffer kcat \
    -b ${BROKER} \
    -t ${TOPIC} \
    -r ${SCHEMA_REGISTRY} \
    -e -q -C \
    -o beginning \
    -f "\nOffset %o [%p] %k\t%s" 2>/dev/null
}

# --------------------------------------------------
# Print the list of Topics
# --------------------------------------------------
list_topics() {
  local BROKER=${1:-127.0.2.1:9092}

  kcat -b ${BROKER} -L \
    | grep "topic" \
    | awk -F' ' 'BEGIN{ print "\033[34m\033[1m--------------" } { if (FNR>2){ print $2 } else if (FNR==2){ print $0 "\n--------------\033[0m" } else { print $0 }}' \
    | tr -d '"'
}

kafka_topics() {
  local KAFKA_REST=${1:-localhost:10082}

  curl "http://${KAFKA_REST}/topics" \
    | jq -S --unbuffered -R -r '. as $line | try fromjson catch $line'
}

# --------------------------------------------------
# Print the list of Kafka Connect Connectors
# --------------------------------------------------
kafka_connectors() {
  local KAFKA_CONNECT=${1:-localhost:10083}

  curl -k "https://${KAFKA_CONNECT}/connectors" \
    | jq -S --unbuffered -R -r '. as $line | try fromjson catch $line'
}

list_connector() {
  local KAFKA_CONNECTOR=$1
  local KAFKA_CONNECT=${2:-localhost:10083}

  curl -k "https://${KAFKA_CONNECT}/connectors/${KAFKA_CONNECTOR}" | jq '.'
}

# --------------------------------------------------
# Print the list of Kafka Schema Registry Subjects
# --------------------------------------------------
list_subjects() {
  local KAFKA_SCHEMA_REGISTRY=${1:-localhost:10081}

  curl -k "https://${KAFKA_SCHEMA_REGISTRY}/subjects" \
    | jq -S --unbuffered -R -r '. as $line | try fromjson catch $line'
}

# --------------------------------------------------
# Print the partitions and their current offsets and timestamp
# --------------------------------------------------
list_partition_offsets() {
  local TOPIC=$1
  local BROKER=${2:-127.0.2.1:9092}
  local PARITION_COUNT=$(kcat -b ${BROKER} -t ${TOPIC} -L -J | jq '.topics[0].partitions | length')

  for i in {0..${PARITION_COUNT}}; do

    local DATA=$(kcat -b ${BROKER} -t ${TOPIC} -C -o -1 -p${i} -e -f '%p:%o:%T\n' 2>/dev/null)

    if [[ -n $DATA ]]; then
      local DATE_MS=$(echo ${DATA} | awk -F: '{print $3}')
      local TIMESTAMP=`/bin/date -r $(( ${DATE_MS} / 1000 )) +"%Y-%m-%dT%H:%M:%S"`
      echo $DATA | awk -F: '{printf "Parition: %02i - Offset: %i", $1, $2}'
      echo " - Timestamp: ${TIMESTAMP}.$(( ${DATE_MS} % 1000 ))"
    else
      echo Partition ${i} is empty
    fi
  done
}
