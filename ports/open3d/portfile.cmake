# Header-only library
vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO polycam/open3d
    REF f93e18661398b8c36253b4f8b95afb34ad66041d
    SHA512 12e7776e093bee73367607c5be9fb4cc4902bdaf53f227368a75d781cf3323920c7c2304a08f90ba2f0146c46093d5e9b7ed2b03641b6fe4a725fb3e5cd917c8
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
