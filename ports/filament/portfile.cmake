vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO Polycam/filament
    REF a4797a631eb51fc51ec38e503c0a10965624a2ae
    SHA512 ef99b652775d122665834e6d526496793fb61621bea724ec2b3d6558526864fed22eb9ec385ec8a75ae4377a902314751dceb11de5ad7044666e60fcfbf53380
    HEAD_REF release
    PATCHES
        image-sampler.patch
        gltfio.patch
        cmake-build.patch
)

file(REMOVE_RECURSE "${SOURCE_PATH}/third-party/draco")
file(REMOVE_RECURSE "${SOURCE_PATH}/third-party/libassimp")
file(REMOVE_RECURSE "${SOURCE_PATH}/third-party/libpng")
file(REMOVE_RECURSE "${SOURCE_PATH}/third-party/libz")
file(REMOVE_RECURSE "${SOURCE_PATH}/third-party/sdl2")
file(REMOVE_RECURSE "${SOURCE_PATH}/third-party/stb")

set(CXX_STANDARD "-std=c++17")
set(VCPKG_C_FLAGS "${VCPKG_C_FLAGS} -fvisibility=hidden")
set(VCPKG_CXX_FLAGS "${VCPKG_CXX_FLAGS} ${CXX_STANDARD} -fstrict-aliasing -Wno-unknown-pragmas -Wno-unused-function -Wno-deprecated-declarations -fvisibility=hidden")

vcpkg_cmake_configure(
    SOURCE_PATH "${SOURCE_PATH}"
    OPTIONS
        -DFILAMENT_SUPPORTS_VULKAN=OFF
        -DFILAMENT_USE_SWIFTSHADER=OFF
        -DFILAMENT_SKIP_SDL2=ON
        -DFILAMENT_SKIP_SAMPLES=ON
        -DFILAMENT_ENABLE_MATDBG=OFF
        -DFILAMENT_SUPPORTS_OPENGL=OFF
)

vcpkg_cmake_install()
vcpkg_cmake_config_fixup()
vcpkg_copy_pdbs()

file(REMOVE "${CURRENT_PACKAGES_DIR}/LICENSE")
file(REMOVE "${CURRENT_PACKAGES_DIR}/README.md")
file(REMOVE "${CURRENT_PACKAGES_DIR}//debug/LICENSE")
file(REMOVE "${CURRENT_PACKAGES_DIR}//debug/README.md")
file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/bin")
file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include")
file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/share")

file(INSTALL "${SOURCE_PATH}/LICENSE" DESTINATION "${CURRENT_PACKAGES_DIR}/share/${PORT}" RENAME copyright)