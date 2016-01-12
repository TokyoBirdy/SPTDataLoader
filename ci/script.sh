#!/usr/bin/env bash

set -euo pipefail

xcrun xcodebuild build test \
    -project SPTDataLoader.xcodeproj \
    -scheme SPTDataLoader \
    -sdk $TEST_SDK \
    -destination "platform=iOS Simulator,OS=$OS,name=$NAME" \
    ONLY_ACTIVE_ARCH=YES \
    -enableCodeCoverage YES \
         | xcpretty -c -f `xcpretty-travis-formatter`

pod spec lint SPTDataLoader.podspec
