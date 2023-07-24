# Header-only library
vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO polycam/open3d
    REF df5f4422264de04b98efbe5504b774bf6ccc57a0
    SHA512 74f4240b71b1d6ec75fbdfee4cfa63f35a2fcb20887160fb8ad9ed3a27852daf7666c802857742a62974c459b0701fc5b5893205b36a923c0f5eb06e7d1197ec
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
