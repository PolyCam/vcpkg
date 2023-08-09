# Header-only library
vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO polycam/open3d
    REF 4a2c7666032896ac99a30767c0bd325bd991e9a7
    SHA512 f7589a5b4691c4737bcdc33b5d10cdc6d34b0216192d47c1d44205e9669b9f9b859e217d4cc0309d8ffce1ae66107c5fcc289534aee97f2c9f75eeaadb41182b
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
