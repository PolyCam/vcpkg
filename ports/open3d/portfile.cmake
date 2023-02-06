# Header-only library
vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO polycam/open3d
    REF e444457b6eea6b44c5330b4436e9b3d9854f4bd1
    SHA512 4fb663ce50921a7369ba9b77afbd770277ea4900cfb86539a124796b134004aac62bd0687d7262f67550dd33393c668a9e4e1d3cc44f21196a49eb7977a9eeb8
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
