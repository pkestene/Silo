cmake_minimum_required(VERSION 3.12 FATAL_ERROR)

# Executes a test and prints failure/success.
# May need more args as other tests (fortran, python, special, json) are added
function(silo_add_make_check_runner)
    # NAME: name of test
    # ARGS: list of arguments to pass to test, optional

    set(options)
    set(oneValueArgs NAME)
    set(multiValueArgs ARGS)
    cmake_parse_arguments(samcr "${options}" "${oneValueArgs}"
        "${multiValueArgs}" ${ARGN})
    if("NAME" IN_LIST samcr_KEYWORDS_MISSING_VALUES)
        message(WARNING "silo_add_make_check_runner: NAME argument provided without a value.")
        return()
    elseif(NOT DEFINED samcr_NAME)
        message(WARNING "silo_add_make_check_runner: NAME argument is required.")
        return()
    endif()
    set(test_cmd ${samcr_NAME})
    if("ARGS" IN_LIST samcr_KEYWORDS_MISSING_VALUES)
        message(WARNING "silo_add_make_check_runner: ARGS argument provided without a value.")
        return()
    elseif(DEFINED samcr_ARGS)
        # Replace ';' in the args for printing the message
        string(REPLACE ";" " " test_args "${samcr_ARGS}")
        # append the args to the test command
        list(APPEND test_cmd ${samcr_ARGS})
    else()
        set(test_args " ")
    endif()
    execute_process(COMMAND ${test_cmd}
                        WORKING_DIRECTORY ${WD}
                        OUTPUT_QUIET
                        ERROR_QUIET
                        RESULT_VARIABLE check_RESULTS)
    if(check_RESULTS EQUAL 0)
        message("${samcr_NAME} ${test_args} \t\t\t\t okay") 
    else()
        message("${samcr_NAME} ${test_args} \t\t\t\t fail") 
    endif()
endfunction()


foreach(driver DB_PDB DB_HDF5)
    silo_add_make_check_runner(NAME namescheme ARGS ${driver})
    silo_add_make_check_runner(NAME realloc_obj_and_opts ARGS ${driver})
    silo_add_make_check_runner(NAME point ARGS ${driver})
    silo_add_make_check_runner(NAME extface ARGS ${driver})
    silo_add_make_check_runner(NAME testall ARGS -small ${driver})
    silo_add_make_check_runner(NAME TestReadMask ARGS ${driver})
    silo_add_make_check_runner(NAME array ARGS ${driver})
    if(NOT WIN32)
        silo_add_make_check_runner(NAME multi_test ARGS testread ${driver})
        silo_add_make_check_runner(NAME multi_test ARGS testflush ${driver})
        silo_add_make_check_runner(NAME multi_test ARGS earlyclose ${driver})
    endif()
    silo_add_make_check_runner(NAME partial_io ARGS ${driver})
    silo_add_make_check_runner(NAME simple ARGS ${driver})
    silo_add_make_check_runner(NAME ucd ARGS ${driver})
    silo_add_make_check_runner(NAME ucdsamp3 ARGS ${driver})
    silo_add_make_check_runner(NAME testall ARGS -small -fortran ${driver})
    silo_add_make_check_runner(NAME obj ARGS ${driver})
    silo_add_make_check_runner(NAME onehex ARGS ${driver})
    silo_add_make_check_runner(NAME oneprism ARGS ${driver})
    silo_add_make_check_runner(NAME onepyramid ARGS ${driver})
    silo_add_make_check_runner(NAME onetet ARGS ${driver})
    silo_add_make_check_runner(NAME subhex ARGS ${driver})
    silo_add_make_check_runner(NAME twohex ARGS ${driver})
    silo_add_make_check_runner(NAME multispec ARGS ${driver})
    silo_add_make_check_runner(NAME sami ARGS ${driver})
    silo_add_make_check_runner(NAME newsami ARGS ${driver})
    silo_add_make_check_runner(NAME specmix ARGS ${driver})
    silo_add_make_check_runner(NAME spec ARGS ${driver})
    silo_add_make_check_runner(NAME group_test ARGS 0 0 0 ${driver})
    if("${driver}" STREQUAL "DB_PDB")
        silo_add_make_check_runner(NAME listtypes ARGS ucd.pdb ${driver})
    else()
        silo_add_make_check_runner(NAME listtypes ARGS ucd.h5 ${driver})
    endif()
    silo_add_make_check_runner(NAME alltypes ARGS ${driver})
    silo_add_make_check_runner(NAME wave ARGS ${driver})
    silo_add_make_check_runner(NAME polyzl ARGS ${driver})
    silo_add_make_check_runner(NAME csg ARGS ${driver})

    if(NOT WIN32)
        silo_add_make_check_runner(NAME rocket ARGS ${driver})
    endif()

    silo_add_make_check_runner(NAME mmadjacency ARGS ${driver})
    silo_add_make_check_runner(NAME mat3d_3across ARGS ${driver})
    silo_add_make_check_runner(NAME ucd1d ARGS ${driver})
    silo_add_make_check_runner(NAME sdir ARGS ${driver})
    silo_add_make_check_runner(NAME quad ARGS ${driver})
    silo_add_make_check_runner(NAME arbpoly ARGS ${driver})
    silo_add_make_check_runner(NAME arbpoly2d ARGS ${driver})
    silo_add_make_check_runner(NAME arbpoly3d ARGS ${driver})
    silo_add_make_check_runner(NAME multi_test ARGS ${driver})
    silo_add_make_check_runner(NAME readstuff ARGS ${driver})
    silo_add_make_check_runner(NAME testfs ARGS ${driver})
    silo_add_make_check_runner(NAME empty ARGS ${driver})
    silo_add_make_check_runner(NAME efcentering ARGS ${driver})
    silo_add_make_check_runner(NAME misc ARGS ${driver})
    silo_add_make_check_runner(NAME multi_file ARGS ${driver})
    silo_add_make_check_runner(NAME multi_file ARGS use-ns ${driver})

    silo_add_make_check_runner(NAME testall ARGS -small -fortran ${driver})
    silo_add_make_check_runner(NAME testall ARGS -medium ${driver})
    silo_add_make_check_runner(NAME testall ARGS -large ${driver})
endforeach()

##
# Python tests
##
if(EXISTS ${PY})
    set(ENV{PYTHONPATH} ${LD})
    execute_process(COMMAND multi_test hdf-friendly
                    WORKING_DIRECTORY ${WD}
                    OUTPUT_QUIET
                    ERROR_QUIET
                    RESULT_VARIABLE check_RESULTS)

    foreach(t test_read.py test_write.py test_error.py)

        execute_process(COMMAND ${PY} ${t}
                        WORKING_DIRECTORY ${WD}
                        OUTPUT_QUIET
                        ERROR_QUIET
                        RESULT_VARIABLE check_RESULTS)
        if(check_RESULTS EQUAL 0)
            message("${t} \t\t\t\t okay")
        else()
            message("${t} \t\t\t\t fail")
        endif()
    endforeach()
endif()
