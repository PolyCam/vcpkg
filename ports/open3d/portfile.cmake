# Header-only library
vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO polycam/open3d
    REF 7ed80f06f03b367d1e16134ffa6f430787f4bfff
    SHA512 b7554481e70985c5d04838f37cb9611da487ac24cf4cb7b526122fc6c929b0478da96971a45568eefc6cc303ad6e92d3b35c98f3d5c9afdd37ced6b53cbf4e81
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
