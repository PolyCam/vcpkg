# Header-only library
vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO polycam/open3d
    REF 47fda40ff52afbae3f8a4543466040843ef65d1f
    SHA512 bd24bf53f625eb124e6d36c708d6b35f5252ca80ca478f2786665654e1f672f143d3b4067ceddefc4b909a2a4e2977d429efd5c3bfd0bf3b11e5d38b4fa27fb6
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
