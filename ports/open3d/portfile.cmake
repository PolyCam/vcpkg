# Header-only library
vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO polycam/open3d
    REF 6489f87e5e71f0a893ce75c15e2e348092fe7b22
    SHA512 8e9d4303e03ca23ca0ad884cb8df66cf4b66e736a6e9aae0f7c564cad677c85c0d8d83777f6e484dc015bcc1c95497853ca4a58636ae69f4c4a8a3afa922ea28
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
