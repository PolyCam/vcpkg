# Header-only library
vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO polycam/open3d
    REF 3397a53cb66b2edbf5bd4ed1506dadaf17009ff9
    SHA512 4ec33a31e28a6167808776c548dccd92a5d72e2fe1fc1cb6276afbfb9d9eba4f24407e5730689fc6e894f6771478923b1e78e237ab464183b7bb88f079c38846
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
