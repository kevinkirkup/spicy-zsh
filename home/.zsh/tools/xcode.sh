#!/usr/bin/env zsh
[[ $platform != mac ]] && return
function localize_project() {
  find . -name \*.m | xargs genstrings -o en.lproj
  find . -name \*.xib | xargs -t -I '{}' ibtool --generate-strings '{}'.strings '{}'
}
function build_settings() {
  local PROJECT_NAME=$1
  local TARGET=${2:-$PROJECT_NAME}
  xcodebuild -project ${PROJECT_NAME}.xcodeproj -target "${TARGET}" -showBuildSettings
}
function build_fat_framework() {
  local FRAMEWORK_NAME=$1
  lipo -output ${FRAMEWORK_NAME} -create \
    "Debug-iphonesimulator/${FRAMEWORK_NAME}.framework/${FRAMEWORK_NAME}" \
    "Debug-iphoneos/${FRAMEWORK_NAME}.framework/${FRAMEWORK_NAME}"
  cp -R Debug-iphonesimulator/${FRAMEWORK_NAME}.framework .
  mv ${FRAMEWORK_NAME} ${FRAMEWORK_NAME}.framework/
}
function extract_arch_framework() {
  local FRAMEWORK_EXECUTABLE_PATH=$1
  local ARCHS=$2
  local EXTRACTED_ARCHS=()
  for ARCH in $ARCHS; do
    lipo -extract "$ARCH" "$FRAMEWORK_EXECUTABLE_PATH" -o "$FRAMEWORK_EXECUTABLE_PATH-$ARCH"
    EXTRACTED_ARCHS+=("$FRAMEWORK_EXECUTABLE_PATH-$ARCH")
  done
  lipo -o "$FRAMEWORK_EXECUTABLE_PATH-merged" -create "${EXTRACTED_ARCHS[@]}"
  rm "${EXTRACTED_ARCHS[@]}"
}
