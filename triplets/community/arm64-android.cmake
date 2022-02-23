# Note CH: in vcpkg head the linkage is static instead of dymamic, but generating the triplet from the docs uses dynamic https://vcpkg.readthedocs.io/en/latest/users/android/
set(VCPKG_TARGET_ARCHITECTURE arm64)
set(VCPKG_CRT_LINKAGE dynamic)
set(VCPKG_LIBRARY_LINKAGE dynamic)
set(VCPKG_CMAKE_SYSTEM_NAME Android)

