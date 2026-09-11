workflows:
  ios-device-build:
    name: iOS Device Build
    max_build_duration: 30
    instance_type: mac_mini_m2
    environment:
      xcode: latest
      cocoapods: default
    scripts:
      - name: Install Metal Toolchain
        script: |
          xcodebuild -downloadComponent MetalToolchain
      - name: Build and Clean Package App
        script: |
          # 1. Compile clean release archive build
          xcodebuild archive \
            -project DuoLikeAnimation.xcodeproj \
            -scheme DuoLikeAnimation \
            -destination 'generic/platform=iOS' \
            -archivePath $CM_BUILD_DIR/DuoLikeAnimation.xcarchive \
            CODE_SIGNING_ALLOWED=NO \
            CODE_SIGNING_REQUIRED=NO \
            COMPILER_INDEX_STORE_ENABLE=NO

          # 2. Build explicit standard Payload folder structure
          rm -rf $CM_BUILD_DIR/Payload
          mkdir -p $CM_BUILD_DIR/Payload
          
          # 3. Copy the compiled application bundle into the Payload folder
          cp -r $CM_BUILD_DIR/DuoLikeAnimation.xcarchive/Products/Applications/DuoLikeAnimation.app $CM_BUILD_DIR/Payload/
          
          # 4. Zip the Payload folder directly into a pristine IPA package
          cd $CM_BUILD_DIR
          zip -q -r DuoLikeAnimation.ipa Payload
    artifacts:
      - $CM_BUILD_DIR/DuoLikeAnimation.ipa
