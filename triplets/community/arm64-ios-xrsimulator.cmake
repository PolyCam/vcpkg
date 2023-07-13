set(VCPKG_TARGET_ARCHITECTURE arm64)
set(VCPKG_CRT_LINKAGE dynamic)
set(VCPKG_LIBRARY_LINKAGE static)
set(VCPKG_CMAKE_SYSTEM_NAME visionOS)
# set(VCPKG_OSX_DEPLOYMENT_TARGET 1.0)  # Setting this breaks simulator builds due to a bug in CMake
set(VCPKG_BUILD_TYPE release)
execute_process(COMMAND xcodebuild -version -sdk xrsimulator Path
  OUTPUT_VARIABLE VCPKG_OSX_SYSROOT
  ERROR_QUIET
  OUTPUT_STRIP_TRAILING_WHITESPACE)
set(VCPKG_CHAINLOAD_TOOLCHAIN_FILE ${CMAKE_CURRENT_SOURCE_DIR}/scripts/toolchains/ios.cmake)
