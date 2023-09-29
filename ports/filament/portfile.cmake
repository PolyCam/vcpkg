vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO google/filament
    REF v1.43.1
    SHA512 a2f73fae003f7d595c2c7dadaaae305063fab896905e728408d8d52672121233ee474c72344a76573009d14619ffb2e37fd96b6cc16a1a8ba85d9efe550907c2
    HEAD_REF release
    PATCHES
        image-sampler.patch
        gltfio.patch
        cmake-build.patch
        cmgen.patch
        deprecation.patch
)

file(REMOVE_RECURSE "${SOURCE_PATH}/third-party/draco")
file(REMOVE_RECURSE "${SOURCE_PATH}/third-party/libassimp")
file(REMOVE_RECURSE "${SOURCE_PATH}/third-party/libpng")
file(REMOVE_RECURSE "${SOURCE_PATH}/third-party/libz")
file(REMOVE_RECURSE "${SOURCE_PATH}/third-party/sdl2")
file(REMOVE_RECURSE "${SOURCE_PATH}/third-party/stb")

set(PLATFORM_OPTION "")
set(METAL_OPTION "-DFILAMENT_SUPPORTS_METAL=OFF")
set(OPENGL_OPTION "-DFILAMENT_SUPPORTS_OPENGL=OFF")
set(EGL_OPTION "")

if (${VCPKG_CMAKE_SYSTEM_NAME} MATCHES "Android")
    set(PLATFORM_OPTION "-DANDROID=1")
    set(OPENGL_OPTION "-DFILAMENT_SUPPORTS_OPENGL=ON")
    set(EGL_OPTION "-DEGL=TRUE")
elseif (${VCPKG_CMAKE_SYSTEM_NAME} MATCHES "iOS")
    set(PLATFORM_OPTION "-DIOS=1")
    set(METAL_OPTION "-DFILAMENT_SUPPORTS_METAL=ON")
elseif (${VCPKG_CMAKE_SYSTEM_NAME} MATCHES "Emscripten")
    set(PLATFORM_OPTION "-DWEBGL=1")
    set(OPENGL_OPTION "-DFILAMENT_SUPPORTS_OPENGL=ON")
else ()
    set(METAL_OPTION "-DFILAMENT_SUPPORTS_METAL=ON")
endif()

if(VCPKG_CROSSCOMPILING)
    vcpkg_add_to_path(${CURRENT_HOST_INSTALLED_DIR}/bin)
endif()

vcpkg_cmake_configure(
    SOURCE_PATH "${SOURCE_PATH}"
    OPTIONS
        -DFILAMENT_SUPPORTS_VULKAN=OFF
        -DFILAMENT_USE_SWIFTSHADER=OFF
        -DFILAMENT_SKIP_SDL2=ON
        -DFILAMENT_SKIP_SAMPLES=ON
        -DFILAMENT_ENABLE_MATDBG=OFF
        ${PLATFORM_OPTION}
        ${METAL_OPTION}
        ${OPENGL_OPTION}
        ${EGL_OPTION}
)

vcpkg_cmake_install()
vcpkg_cmake_config_fixup()
vcpkg_copy_pdbs()

file(REMOVE "${CURRENT_PACKAGES_DIR}/LICENSE")
file(REMOVE "${CURRENT_PACKAGES_DIR}/README.md")
file(REMOVE "${CURRENT_PACKAGES_DIR}/debug/LICENSE")
file(REMOVE "${CURRENT_PACKAGES_DIR}/debug/README.md")
file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/bin")
file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include")
file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/share")

file(INSTALL "${CMAKE_CURRENT_LIST_DIR}/filamentConfig.cmake" DESTINATION "${CURRENT_PACKAGES_DIR}/share/${PORT}")
file(INSTALL "${SOURCE_PATH}/LICENSE" DESTINATION "${CURRENT_PACKAGES_DIR}/share/${PORT}" RENAME copyright)