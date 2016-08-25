if (BUILDING_LEATHERMAN)
    set(include_dir "${PROJECT_SOURCE_DIR}/vendor/rapidjson/include")
    set(${include_var} ${include_dir} PARENT_SCOPE)

    if(LEATHERMAN_INSTALL)
        install(DIRECTORY "${include_dir}" DESTINATION "include/leatherman/vendor/rapidjson")
    endif()
else()
    set(${include_var} "${LEATHERMAN_PREFIX}/include/leatherman/vendor/rapidjson/include")
endif()