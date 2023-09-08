# Header-only library
vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO polycam/open3d
    REF 4f7cc34ba85d4acf9c9e3a9cdd1618378ea41e15
    SHA512 a32ba718decb21a6318d1605d179a5aece593b73d36fa69f5c1dcddd038196c7e217e8a6246a80ad087d3a0984f110aa3a595fef8faa7a978b582e7ba708d0f3
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
