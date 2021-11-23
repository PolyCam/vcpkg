vcpkg_fail_port_install(ON_ARCH "x86")

# Don't file if the bin folder exists. We need exe and custom files.
SET(VCPKG_POLICY_EMPTY_PACKAGE enabled)

vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO PixarAnimationStudios/USD
    REF faed18ce62c8736b02413635b584a2f637156bad # v21.11
    SHA512 13b3da047df6b6be00b4c74ab8691420bb321253459a845dcf1850c17d0f27e548f08f99e21e48b2e20672243e1db6ad74ff61e290f532f1c75addf929de284c
    HEAD_REF master
)

vcpkg_find_acquire_program(PYTHON3)
get_filename_component(PYTHON3_DIR "${PYTHON3}" DIRECTORY)
vcpkg_add_to_path("${PYTHON3_DIR}")

IF (VCPKG_TARGET_IS_WINDOWS)
ELSE()
file(REMOVE ${SOURCE_PATH}/cmake/modules/FindTBB.cmake)
ENDIF()

vcpkg_configure_cmake(
    SOURCE_PATH ${SOURCE_PATH}
    PREFER_NINJA
    OPTIONS
    	-DCMAKE_PREFIX_PATH=${CURRENT_INSTALLED_DIR}
    	-DBOOST_ROOT=${CURRENT_INSTALLED_DIR}
    	-DPXR_ENABLE_PTEX_SUPPORT=OFF
        -DPXR_BUILD_ALEMBIC_PLUGIN=OFF
        -DPXR_BUILD_EMBREE_PLUGIN=OFF
        -DPXR_BUILD_IMAGING=OFF
        -DPXR_BUILD_MONOLITHIC=OFF
        -DPXR_BUILD_TESTS=OFF
        -DPXR_BUILD_USD_IMAGING=OFF
        -DPXR_ENABLE_PYTHON_SUPPORT=OFF
        -DPXR_BUILD_EXAMPLES=OFF
        -DPXR_BUILD_TUTORIALS=OFF
        -DPXR_BUILD_USD_TOOLS=OFF
        -DPXR_BUILD_USDVIEW=OFF
        -DPXR_ENABLE_HDF5_SUPPORT=OFF
        -DPXR_ENABLE_PTEX_SUPPORT=OFF
        -DBUILD_SHARED_LIBS=ON
        
)

vcpkg_install_cmake()

file(
    RENAME
        "${CURRENT_PACKAGES_DIR}/pxrConfig.cmake"
        "${CURRENT_PACKAGES_DIR}/cmake/pxrConfig.cmake")

vcpkg_fixup_cmake_targets(CONFIG_PATH cmake TARGET_PATH share/pxr)

vcpkg_copy_pdbs()

# Remove duplicates in debug folder
file(REMOVE_RECURSE ${CURRENT_PACKAGES_DIR}/debug/include)

# Handle copyright
file(INSTALL ${SOURCE_PATH}/LICENSE.txt DESTINATION ${CURRENT_PACKAGES_DIR}/share/${PORT} RENAME copyright)

# Move all dlls to bin
file(GLOB RELEASE_DLL ${CURRENT_PACKAGES_DIR}/lib/*.dll)
file(MAKE_DIRECTORY ${CURRENT_PACKAGES_DIR}/bin)
file(GLOB DEBUG_DLL ${CURRENT_PACKAGES_DIR}/debug/lib/*.dll)
file(MAKE_DIRECTORY ${CURRENT_PACKAGES_DIR}/debug/bin)
foreach(CURRENT_FROM ${RELEASE_DLL} ${DEBUG_DLL})
    string(REPLACE "/lib/" "/bin/" CURRENT_TO ${CURRENT_FROM})
    file(RENAME ${CURRENT_FROM} ${CURRENT_TO})
endforeach()

function(file_replace_regex filename match_string replace_string)
    file(READ ${filename} _contents)
    string(REGEX REPLACE "${match_string}" "${replace_string}" _contents "${_contents}")
    file(WRITE ${filename} "${_contents}")
endfunction()

# fix dll path for cmake
file_replace_regex(${CURRENT_PACKAGES_DIR}/share/pxr/pxrConfig.cmake "/cmake/pxrTargets.cmake" "/pxrTargets.cmake")
file_replace_regex(${CURRENT_PACKAGES_DIR}/share/pxr/pxrTargets-debug.cmake "debug/lib/([a-zA-Z0-9_]+)\\.dll" "debug/bin/\\1.dll")
file_replace_regex(${CURRENT_PACKAGES_DIR}/share/pxr/pxrTargets-release.cmake "lib/([a-zA-Z0-9_]+)\\.dll" "bin/\\1.dll")

# fix plugInfo.json for runtime
file(GLOB_RECURSE PLUGINFO_FILES ${CURRENT_PACKAGES_DIR}/lib/usd/*/resources/plugInfo.json)
file(GLOB_RECURSE PLUGINFO_FILES_DEBUG ${CURRENT_PACKAGES_DIR}/debug/lib/usd/*/resources/plugInfo.json)
foreach(PLUGINFO ${PLUGINFO_FILES} ${PLUGINFO_FILES_DEBUG})
    file_replace_regex(${PLUGINFO} [=["LibraryPath": "../../([a-zA-Z0-9_]+).dll"]=] [=["LibraryPath": "../../../bin/\1.dll"]=])
endforeach()
