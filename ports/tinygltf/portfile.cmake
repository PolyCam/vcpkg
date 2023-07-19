# Header-only library
vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO polycam/tinygltf
    REF 02bf4b492306cf11f77ce56e2471e8fbbf35ce78
    SHA512 f46aae1a25456c297997bcff96254c1015f29b1b3e927550aef3f61bfd8de9a70840fce2791c99a21cea4ac70714e392fde433307be5c112eae43caa3e8fcaaf
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
