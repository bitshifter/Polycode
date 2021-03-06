INCLUDE(PolycodeIncludes)

FIND_PACKAGE(Lua51 REQUIRED)

INCLUDE_DIRECTORIES(
    ${LUA_INCLUDE_DIR}
    ${BOX2D_INCLUDE_DIR}
    ${Polycode_SOURCE_DIR}/Modules/Contents/2DPhysics/Include
    Include
)

SET(polycode2DPhysics_SRCS
    Source/Physics2DLUA.cpp
)

SET(polycode2DPhysics_HDRS
    Include/Physics2DLUA.h
    Include/Physics2DLUAWrappers.h
)

ADD_LIBRARY(Physics2D ${polycode2DPhysics_SRCS} ${polycode2DPhysics_HDRS})
SET(CMAKE_DEBUG_POSTFIX "_d")

IF(POLYCODE_INSTALL_FRAMEWORK)
    
    # install headers
    INSTALL(FILES ${polycode2DPhysics_HDRS} 
        DESTINATION Bindings/Lua/Modules/2DPhysics/include)

    INSTALL(DIRECTORY API DESTINATION Bindings/Lua/Modules/2DPhysics)
	
    # install libraries
#    IF(POLYCODE_BUILD_SHARED)
#        INSTALL(TARGETS PolycodeLua_dynamic
#            DESTINATION ${POLYCODE_RELEASE_DIR}/Framework/Modules/lib)
#    ENDIF(POLYCODE_BUILD_SHARED)
    
#    IF(POLYCODE_BUILD_STATIC)
     INSTALL(TARGETS Physics2D
         DESTINATION Bindings/Lua/Modules/2DPhysics/lib)
#    ENDIF(POLYCODE_BUILD_STATIC)
    
ENDIF(POLYCODE_INSTALL_FRAMEWORK)
