# Header-only library
vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO polycam/open3d
    REF 9dc82f0690ce39ca5bc9a43255a77fbd3308515c
    SHA512 094897ca989175b27e1ac0d60e0cbb7f04b0b383b6e6fca48a282142218b56504b2c32030d8798dad1a04ef5d3b6dd37712434789e2f4bdc616e9ec2913a0a7b
    HEAD_REF main
)

vcpkg_cmake_configure(
    SOURCE_PATH "${SOURCE_PATH}"
)

vcpkg_cmake_install()
vcpkg_cmake_config_fixup()
vcpkg_copy_pdbs()

file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include")

# Handle copyright
file(INSTALL "${SOURCE_PATH}/LICENSE" DESTINATION "${CURRENT_PACKAGES_DIR}/share/${PORT}" RENAME copyright)
