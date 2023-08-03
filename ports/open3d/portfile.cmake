# Header-only library
vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO polycam/open3d
    REF e1e750f721f403b57eff9a6fa6c2dc4f3cf88303
    SHA512 60b00b97e0320b9ed499647c0df39b2c7a19dd694631edc07002eac0aab76179c26ad1d0df9d37d2fbeb2dd96a934568bed8b271533213ea256f080f88cdc3c8
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
