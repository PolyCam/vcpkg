# Header-only library
vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO polycam/tinygltf
    REF d9d5f2031642818079aa44b5fc734ce295722eb0
    SHA512 eb56558b4a737ba54a83041a80ce01b70edeba2af00357a65c3226a2891c3d00563767b776f25bf84da772f9a450a927862c3ee341f2136879d903dd1073f0e7
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
