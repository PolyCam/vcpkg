# Header-only library
vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO polycam/tinygltf
    REF d672805a92c7725ebfac7a75898b7f21bddbe1c6
    SHA512 aced90bfea1398a6ccdfd63896c7570ea553fe6904409e7b51a2f1bee7241d74d5d293833cfbf53ac589346a84141e2c14448f093d55c9c3e8db7f3eb1ec76e8
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
