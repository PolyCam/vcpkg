# Header-only library
vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO polycam/open3d
    REF 7d094c210c6f15cc2dd9f9bd0b49a88c5c630b3b
    SHA512 1ab8fe96ae14cdf44b3efd5e7b81bbc0b5ab35186715268917d23d30d27e5e8b3393b778ce219acd89c2c7e7c19c9c8dbfb17365f42e8d332fe2e97add761588
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
