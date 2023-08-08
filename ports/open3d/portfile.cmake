# Header-only library
vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO polycam/open3d
    REF e2d6ba1def2e41e20f77c111859aa974fe20fd97
    SHA512 56f738892ce4aabd181bcbde933d5cefef209534d1b3bf2ba239fd7f688071c3f150475cdea5420399cc3a34c9ecc6e12d6983152e9a0fc1abfc2831d1c6e69b
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
