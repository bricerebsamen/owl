# ======================================================================== #
# Copyright 2018-2020 Ingo Wald                                            #
#                                                                          #
# Licensed under the Apache License, Version 2.0 (the "License");          #
# you may not use this file except in compliance with the License.         #
# You may obtain a copy of the License at                                  #
#                                                                          #
#     http://www.apache.org/licenses/LICENSE-2.0                           #
#                                                                          #
# Unless required by applicable law or agreed to in writing, software      #
# distributed under the License is distributed on an "AS IS" BASIS,        #
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. #
# See the License for the specific language governing permissions and      #
# limitations under the License.                                           #
# ======================================================================== #

# this helper script sets the following variables:
#
# OWL_INCLUDES - list of directories required to compile progs using owl
#
# OWL_LIBRARIES - list of libraries to link against when building owl programs

if(NOT OWL_INTERMEDIATE_CMAKE AND NOT OWL_MODERN_CMAKE)
  message(FATAL_ERROR "Please modify your parent project not to include "
    "configure_owl.cmake or any other internal CMake files from OWL. "
    "The one exception is embed_ptx.cmake which you can include. "
    "Please see that file for info on how to specify the architecture."
  )
endif()

set(OWL_INCLUDES
  # owl needs optix:
  ${OptiX_INCLUDE}
  # public API
  ${PROJECT_SOURCE_DIR}/owl/include
  # device API and common currently still include non-public header files
  ${PROJECT_SOURCE_DIR}/
  )

set(OWL_LIBRARIES
  owl_static
  )
