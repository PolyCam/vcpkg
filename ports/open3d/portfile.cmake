# Header-only library
vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO polycam/open3d
    REF 76a8d43dd50cd18d40e8c25226dcd347c5909ba8
    SHA512 511f22e17b91a5f9795f8fd9178a8cf990f11dfd6271f699e4031ab63023678dca9ac6c8b7fcb0839b22f518fec59020c89d122bc5911bef7458bacaf2bb4953
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
