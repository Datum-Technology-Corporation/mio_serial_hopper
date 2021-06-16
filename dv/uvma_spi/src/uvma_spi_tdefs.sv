// Copyright 2021 Datum Technology Corporation
// 
// SPDX-License-Identifier: Apache-2.0 WITH SHL-2.1
// Licensed under the Solderpad Hardware License v 2.1 (the "License"); you may not use this file except in compliance
// with the License, or, at your option, the Apache License version 2.0. You may obtain a copy of the License at
//                                        https://solderpad.org/licenses/SHL-2.1/
// Unless required by applicable law or agreed to in writing, any work distributed under the License is distributed on
// an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. See the License for the
// specific language governing permissions and limitations under the License.


`ifndef __UVMA_SPI_TDEFS_SV__
`define __UVMA_SPI_TDEFS_SV__


typedef enum {
   UVMA_SPI_MODE_MSTR,
   UVMA_SPI_MODE_SLV
} uvma_spi_mode_enum;

typedef enum {
   UVMA_SPI_RESET_STATE_PRE_RESET ,
   UVMA_SPI_RESET_STATE_IN_RESET  ,
   UVMA_SPI_RESET_STATE_POST_RESET
} uvma_spi_reset_state_enum;

typedef enum {
   UVMA_SPI_DRV_IDLE_SAME  ,
   UVMA_SPI_DRV_IDLE_ZEROS ,
   UVMA_SPI_DRV_IDLE_RANDOM,
   UVMA_SPI_DRV_IDLE_X     ,
   UVMA_SPI_DRV_IDLE_Z
} uvma_spi_drv_idle_enum;

typedef enum {
   UVMA_SPI_RESET_MODE_SYNCHRONOUS ,
   UVMA_SPI_RESET_MODE_ASYNCHRONOUS
} uvma_spi_reset_mode_enum;


`endif // __UVMA_SPI_TDEFS_SV__
