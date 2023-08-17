# Header-only library
vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO polycam/open3d
    REF e961750e9c325f23579d32a1412f268c6ad67cc8
    SHA512 50db1a785d6f5645fc5a14415abc07959bbf97725686d00136054e287674578dd71ecbe9f50e53c7642fa94bf33bf0b2cca072525f7b8a75b0ce0b403c3f3419
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
