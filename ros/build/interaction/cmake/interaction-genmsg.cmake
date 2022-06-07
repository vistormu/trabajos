# generated from genmsg/cmake/pkg-genmsg.cmake.em

message(STATUS "interaction: 3 messages, 1 services")

set(MSG_I_FLAGS "-Iinteraction:/home/vistor/catkin_ws/src/interaction/msg;-Istd_msgs:/opt/ros/noetic/share/std_msgs/cmake/../msg")

# Find all generators
find_package(gencpp REQUIRED)
find_package(geneus REQUIRED)
find_package(genlisp REQUIRED)
find_package(gennodejs REQUIRED)
find_package(genpy REQUIRED)

add_custom_target(interaction_generate_messages ALL)

# verify that message/service dependencies have not changed since configure



get_filename_component(_filename "/home/vistor/catkin_ws/src/interaction/msg/position_msg.msg" NAME_WE)
add_custom_target(_interaction_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "interaction" "/home/vistor/catkin_ws/src/interaction/msg/position_msg.msg" ""
)

get_filename_component(_filename "/home/vistor/catkin_ws/src/interaction/msg/information_msg.msg" NAME_WE)
add_custom_target(_interaction_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "interaction" "/home/vistor/catkin_ws/src/interaction/msg/information_msg.msg" ""
)

get_filename_component(_filename "/home/vistor/catkin_ws/src/interaction/msg/user_msg.msg" NAME_WE)
add_custom_target(_interaction_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "interaction" "/home/vistor/catkin_ws/src/interaction/msg/user_msg.msg" "interaction/information_msg:interaction/position_msg"
)

get_filename_component(_filename "/home/vistor/catkin_ws/src/interaction/srv/product_srv.srv" NAME_WE)
add_custom_target(_interaction_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "interaction" "/home/vistor/catkin_ws/src/interaction/srv/product_srv.srv" ""
)

#
#  langs = gencpp;geneus;genlisp;gennodejs;genpy
#

### Section generating for lang: gencpp
### Generating Messages
_generate_msg_cpp(interaction
  "/home/vistor/catkin_ws/src/interaction/msg/position_msg.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/interaction
)
_generate_msg_cpp(interaction
  "/home/vistor/catkin_ws/src/interaction/msg/information_msg.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/interaction
)
_generate_msg_cpp(interaction
  "/home/vistor/catkin_ws/src/interaction/msg/user_msg.msg"
  "${MSG_I_FLAGS}"
  "/home/vistor/catkin_ws/src/interaction/msg/information_msg.msg;/home/vistor/catkin_ws/src/interaction/msg/position_msg.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/interaction
)

### Generating Services
_generate_srv_cpp(interaction
  "/home/vistor/catkin_ws/src/interaction/srv/product_srv.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/interaction
)

### Generating Module File
_generate_module_cpp(interaction
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/interaction
  "${ALL_GEN_OUTPUT_FILES_cpp}"
)

add_custom_target(interaction_generate_messages_cpp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_cpp}
)
add_dependencies(interaction_generate_messages interaction_generate_messages_cpp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/vistor/catkin_ws/src/interaction/msg/position_msg.msg" NAME_WE)
add_dependencies(interaction_generate_messages_cpp _interaction_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/vistor/catkin_ws/src/interaction/msg/information_msg.msg" NAME_WE)
add_dependencies(interaction_generate_messages_cpp _interaction_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/vistor/catkin_ws/src/interaction/msg/user_msg.msg" NAME_WE)
add_dependencies(interaction_generate_messages_cpp _interaction_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/vistor/catkin_ws/src/interaction/srv/product_srv.srv" NAME_WE)
add_dependencies(interaction_generate_messages_cpp _interaction_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(interaction_gencpp)
add_dependencies(interaction_gencpp interaction_generate_messages_cpp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS interaction_generate_messages_cpp)

### Section generating for lang: geneus
### Generating Messages
_generate_msg_eus(interaction
  "/home/vistor/catkin_ws/src/interaction/msg/position_msg.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/interaction
)
_generate_msg_eus(interaction
  "/home/vistor/catkin_ws/src/interaction/msg/information_msg.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/interaction
)
_generate_msg_eus(interaction
  "/home/vistor/catkin_ws/src/interaction/msg/user_msg.msg"
  "${MSG_I_FLAGS}"
  "/home/vistor/catkin_ws/src/interaction/msg/information_msg.msg;/home/vistor/catkin_ws/src/interaction/msg/position_msg.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/interaction
)

### Generating Services
_generate_srv_eus(interaction
  "/home/vistor/catkin_ws/src/interaction/srv/product_srv.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/interaction
)

### Generating Module File
_generate_module_eus(interaction
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/interaction
  "${ALL_GEN_OUTPUT_FILES_eus}"
)

add_custom_target(interaction_generate_messages_eus
  DEPENDS ${ALL_GEN_OUTPUT_FILES_eus}
)
add_dependencies(interaction_generate_messages interaction_generate_messages_eus)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/vistor/catkin_ws/src/interaction/msg/position_msg.msg" NAME_WE)
add_dependencies(interaction_generate_messages_eus _interaction_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/vistor/catkin_ws/src/interaction/msg/information_msg.msg" NAME_WE)
add_dependencies(interaction_generate_messages_eus _interaction_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/vistor/catkin_ws/src/interaction/msg/user_msg.msg" NAME_WE)
add_dependencies(interaction_generate_messages_eus _interaction_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/vistor/catkin_ws/src/interaction/srv/product_srv.srv" NAME_WE)
add_dependencies(interaction_generate_messages_eus _interaction_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(interaction_geneus)
add_dependencies(interaction_geneus interaction_generate_messages_eus)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS interaction_generate_messages_eus)

### Section generating for lang: genlisp
### Generating Messages
_generate_msg_lisp(interaction
  "/home/vistor/catkin_ws/src/interaction/msg/position_msg.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/interaction
)
_generate_msg_lisp(interaction
  "/home/vistor/catkin_ws/src/interaction/msg/information_msg.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/interaction
)
_generate_msg_lisp(interaction
  "/home/vistor/catkin_ws/src/interaction/msg/user_msg.msg"
  "${MSG_I_FLAGS}"
  "/home/vistor/catkin_ws/src/interaction/msg/information_msg.msg;/home/vistor/catkin_ws/src/interaction/msg/position_msg.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/interaction
)

### Generating Services
_generate_srv_lisp(interaction
  "/home/vistor/catkin_ws/src/interaction/srv/product_srv.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/interaction
)

### Generating Module File
_generate_module_lisp(interaction
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/interaction
  "${ALL_GEN_OUTPUT_FILES_lisp}"
)

add_custom_target(interaction_generate_messages_lisp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_lisp}
)
add_dependencies(interaction_generate_messages interaction_generate_messages_lisp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/vistor/catkin_ws/src/interaction/msg/position_msg.msg" NAME_WE)
add_dependencies(interaction_generate_messages_lisp _interaction_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/vistor/catkin_ws/src/interaction/msg/information_msg.msg" NAME_WE)
add_dependencies(interaction_generate_messages_lisp _interaction_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/vistor/catkin_ws/src/interaction/msg/user_msg.msg" NAME_WE)
add_dependencies(interaction_generate_messages_lisp _interaction_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/vistor/catkin_ws/src/interaction/srv/product_srv.srv" NAME_WE)
add_dependencies(interaction_generate_messages_lisp _interaction_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(interaction_genlisp)
add_dependencies(interaction_genlisp interaction_generate_messages_lisp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS interaction_generate_messages_lisp)

### Section generating for lang: gennodejs
### Generating Messages
_generate_msg_nodejs(interaction
  "/home/vistor/catkin_ws/src/interaction/msg/position_msg.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/interaction
)
_generate_msg_nodejs(interaction
  "/home/vistor/catkin_ws/src/interaction/msg/information_msg.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/interaction
)
_generate_msg_nodejs(interaction
  "/home/vistor/catkin_ws/src/interaction/msg/user_msg.msg"
  "${MSG_I_FLAGS}"
  "/home/vistor/catkin_ws/src/interaction/msg/information_msg.msg;/home/vistor/catkin_ws/src/interaction/msg/position_msg.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/interaction
)

### Generating Services
_generate_srv_nodejs(interaction
  "/home/vistor/catkin_ws/src/interaction/srv/product_srv.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/interaction
)

### Generating Module File
_generate_module_nodejs(interaction
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/interaction
  "${ALL_GEN_OUTPUT_FILES_nodejs}"
)

add_custom_target(interaction_generate_messages_nodejs
  DEPENDS ${ALL_GEN_OUTPUT_FILES_nodejs}
)
add_dependencies(interaction_generate_messages interaction_generate_messages_nodejs)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/vistor/catkin_ws/src/interaction/msg/position_msg.msg" NAME_WE)
add_dependencies(interaction_generate_messages_nodejs _interaction_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/vistor/catkin_ws/src/interaction/msg/information_msg.msg" NAME_WE)
add_dependencies(interaction_generate_messages_nodejs _interaction_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/vistor/catkin_ws/src/interaction/msg/user_msg.msg" NAME_WE)
add_dependencies(interaction_generate_messages_nodejs _interaction_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/vistor/catkin_ws/src/interaction/srv/product_srv.srv" NAME_WE)
add_dependencies(interaction_generate_messages_nodejs _interaction_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(interaction_gennodejs)
add_dependencies(interaction_gennodejs interaction_generate_messages_nodejs)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS interaction_generate_messages_nodejs)

### Section generating for lang: genpy
### Generating Messages
_generate_msg_py(interaction
  "/home/vistor/catkin_ws/src/interaction/msg/position_msg.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/interaction
)
_generate_msg_py(interaction
  "/home/vistor/catkin_ws/src/interaction/msg/information_msg.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/interaction
)
_generate_msg_py(interaction
  "/home/vistor/catkin_ws/src/interaction/msg/user_msg.msg"
  "${MSG_I_FLAGS}"
  "/home/vistor/catkin_ws/src/interaction/msg/information_msg.msg;/home/vistor/catkin_ws/src/interaction/msg/position_msg.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/interaction
)

### Generating Services
_generate_srv_py(interaction
  "/home/vistor/catkin_ws/src/interaction/srv/product_srv.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/interaction
)

### Generating Module File
_generate_module_py(interaction
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/interaction
  "${ALL_GEN_OUTPUT_FILES_py}"
)

add_custom_target(interaction_generate_messages_py
  DEPENDS ${ALL_GEN_OUTPUT_FILES_py}
)
add_dependencies(interaction_generate_messages interaction_generate_messages_py)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/vistor/catkin_ws/src/interaction/msg/position_msg.msg" NAME_WE)
add_dependencies(interaction_generate_messages_py _interaction_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/vistor/catkin_ws/src/interaction/msg/information_msg.msg" NAME_WE)
add_dependencies(interaction_generate_messages_py _interaction_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/vistor/catkin_ws/src/interaction/msg/user_msg.msg" NAME_WE)
add_dependencies(interaction_generate_messages_py _interaction_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/vistor/catkin_ws/src/interaction/srv/product_srv.srv" NAME_WE)
add_dependencies(interaction_generate_messages_py _interaction_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(interaction_genpy)
add_dependencies(interaction_genpy interaction_generate_messages_py)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS interaction_generate_messages_py)



if(gencpp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/interaction)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/interaction
    DESTINATION ${gencpp_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_cpp)
  add_dependencies(interaction_generate_messages_cpp std_msgs_generate_messages_cpp)
endif()

if(geneus_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/interaction)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/interaction
    DESTINATION ${geneus_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_eus)
  add_dependencies(interaction_generate_messages_eus std_msgs_generate_messages_eus)
endif()

if(genlisp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/interaction)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/interaction
    DESTINATION ${genlisp_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_lisp)
  add_dependencies(interaction_generate_messages_lisp std_msgs_generate_messages_lisp)
endif()

if(gennodejs_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/interaction)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/interaction
    DESTINATION ${gennodejs_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_nodejs)
  add_dependencies(interaction_generate_messages_nodejs std_msgs_generate_messages_nodejs)
endif()

if(genpy_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/interaction)
  install(CODE "execute_process(COMMAND \"/usr/bin/python3\" -m compileall \"${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/interaction\")")
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/interaction
    DESTINATION ${genpy_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_py)
  add_dependencies(interaction_generate_messages_py std_msgs_generate_messages_py)
endif()
