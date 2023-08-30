# Header-only library
vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO polycam/open3d
    REF 129df467d340ae9835badf8ab4f1af3fd1b22304
    SHA512 30a448d39b5ff59c7c3e7af3fb1196b2c77ec970d16c7a62484ca1bd62c5f3689994049100d5ae5ae961ac9fd71fab4f9e9ce6f2baece56376aaf2f46767fa2f
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
