#
#  Copyright (c) 2023, The OpenThread Authors.
#  All rights reserved.
#
#  Redistribution and use in source and binary forms, with or without
#  modification, are permitted provided that the following conditions are met:
#  1. Redistributions of source code must retain the above copyright
#     notice, this list of conditions and the following disclaimer.
#  2. Redistributions in binary form must reproduce the above copyright
#     notice, this list of conditions and the following disclaimer in the
#     documentation and/or other materials provided with the distribution.
#  3. Neither the name of the copyright holder nor the
#     names of its contributors may be used to endorse or promote products
#     derived from this software without specific prior written permission.
#
#  THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
#  AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
#  IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
#  ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE
#  LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
#  CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
#  SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS
#  INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN
#  CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)
#  ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE
#  POSSIBILITY OF SUCH DAMAGE.
#

set(OT_DIR ${CMAKE_CURRENT_LIST_DIR}/../..)

set(POSIX_SRC_DIR ${OT_DIR}/platform-abstraction/posix)
set(PAL_INC_DIR   ${OT_DIR}/platform-abstraction/include)
set(CLI_SRC_DIR   ${OT_DIR}/src/cli)
set(CLI_INC_DIR   ${OT_DIR}/include)
set(UTIL_SRC_DIR  ${OT_DIR}/src/util)
set(UTIL_INC_DIR  ${OT_DIR}/include/util)

add_library(ot-vendor-posix-api
    ${POSIX_SRC_DIR}/posix_vendor_spinel_interface.cpp
    ${POSIX_SRC_DIR}/radio_vendor.cpp
)

target_link_libraries(ot-vendor-posix-api
    PUBLIC
        openthread-ftd
        openthread-posix
        ot-posix-config
        ot-config
)

target_compile_definitions(ot-vendor-posix-api
    PRIVATE
        OPENTHREAD_FTD=1
)

target_include_directories(ot-vendor-posix-api
    PUBLIC
        ${POSIX_SRC_DIR}
    PRIVATE
        ${PAL_INC_DIR}
)