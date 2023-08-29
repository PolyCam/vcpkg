# Header-only library
vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO polycam/open3d
    REF 6f1a185d266cd0682b39e385aa3018270c140a30
    SHA512 b23b84bd064b8873bcc91bb1cc3ebe513805e57af294ba9b71d1a238547e3b844edffc6f4ee5728ef602f1a7976ed631cccce3efc2082e37c6cdea78d7a6a153
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
