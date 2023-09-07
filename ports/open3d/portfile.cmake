# Header-only library
vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO polycam/open3d
    REF ed68525ee0f2ee88c13c993be0e39a1fcdf20f6a
    SHA512 19f33cada4f00f6671e68f32a4312dfc83a51950cbb2f7d5e2b85b974e89e07c6384f1dcdc4dbe72064d251710f44ab3faa87a34dc5630191b871763a5b717f4
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
