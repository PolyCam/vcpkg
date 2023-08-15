# Header-only library
vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO polycam/open3d
    REF f5434d8ea2f728883c8160a82062f1b0b249a10c
    SHA512 52103685eb1e4ea42a90282371cc1766a4632e0dc3749cfcc2110cfd0fa61922c62dea5ccb99bb8e8c4f9ca01562940dca35b28692037695ace7c88d0a33dbcb
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
