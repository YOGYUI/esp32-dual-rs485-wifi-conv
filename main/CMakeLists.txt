set(PRIV_INCLUDE_DIRS_LIST
     "${CMAKE_CURRENT_LIST_DIR}/include"
     "${CMAKE_CURRENT_LIST_DIR}/include/peripheral"
     "${CMAKE_CURRENT_LIST_DIR}/include/network"
     "${CMAKE_CURRENT_LIST_DIR}/include/system"
)

set(SRC_DIRS_LIST
     "${CMAKE_CURRENT_LIST_DIR}"
     "${CMAKE_CURRENT_LIST_DIR}/src/network"
     "${CMAKE_CURRENT_LIST_DIR}/src/peripheral"
     "${CMAKE_CURRENT_LIST_DIR}/src/system"
)

set(EXCLUDE_SRCS_LIST "")
set(PRIV_REQUIRES_LIST "")
list(APPEND PRIV_REQUIRES_LIST  
     esp_http_server
     json
     spiffs
)

idf_component_register(
     PRIV_INCLUDE_DIRS   ${PRIV_INCLUDE_DIRS_LIST}
     SRC_DIRS            ${SRC_DIRS_LIST}
     EXCLUDE_SRCS        ${EXCLUDE_SRCS_LIST}
     PRIV_REQUIRES       ${PRIV_REQUIRES_LIST}
)

set_property(TARGET ${COMPONENT_LIB} PROPERTY CXX_STANDARD 14)
