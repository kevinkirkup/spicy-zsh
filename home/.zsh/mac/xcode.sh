#!/usr/bin/env zsh

############################################################
# Function to generate localizations for XCode
function localize_project() {
  find . -name \*.m | xargs genstrings -o en.lproj
  find . -name \*.xib | xargs -t -I '{}' ibtool --generate-strings '{}'.strings '{}'
}

############################################################
# Show workspace settings
function build_settings() {

  local PROJECT_NAME=$1
  local TARGET=$2

  if [ -z "$TARGET" ]; then
    TARGET=$PROJECT_NAME
  fi

  xcodebuild -project ${PROJECT_NAME}.xcodeproj -target "${TARGET}" -showBuildSettings
}

############################################################
# Show workspace settings
function build_fat_framework() {

  local FRAMEWORK_NAME=$1

  # Combine the target binaries in to a single object
  lipo -output ${FRAMEWORK_NAME} -create "Debug-iphonesimulator/${FRAMEWORK_NAME}.framework/${FRAMEWORK_NAME}" "Debug-iphoneos/${FRAMEWORK_NAME}.framework/${FRAMEWORK_NAME}"

  # Re-create the frameworks
  cp -R Debug-iphonesimulator/${FRAMEWORK_NAME}.framework .
  mv ${FRAMEWORK_NAME} ${FRAMEWORK_NAME}.framework/
}

############################################################
# Show workspace settings
function extract_arch_framework() {

  local FRAMEWORK_EXECUTABLE_PATH=$1
  local ARCHS=$2

  for ARCH in $ARCHS
  do
      echo "Extracting $ARCH..."
      # Combine the target binaries in to a single object
      lipo -extract "$ARCH" "$FRAMEWORK_EXECUTABLE_PATH" -o "$FRAMEWORK_EXECUTABLE_PATH-$ARCH"
      EXTRACTED_ARCHS+=("$FRAMEWORK_EXECUTABLE_PATH-$ARCH")
  done

  echo "Merging binaries..."
  lipo -o "$FRAMEWORK_EXECUTABLE_PATH-merged" -create "${EXTRACTED_ARCHS[@]}"
  rm "${EXTRACTED_ARCHS[@]}"
}
