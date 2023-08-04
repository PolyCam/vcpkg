# Header-only library
vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO polycam/open3d
    REF bb33e418f8070c648434c6e5ffa802dffa72fb5f
    SHA512 f54baf9c73f492369d2cfbdf0af2400cec7ec57d54a36acd04f63bcaaaac1cc529fe0e54c22376a47a7391c10997d3a6190976ce88698b209bee58a1819d15b8
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
