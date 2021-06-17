// Copyright 2021 Datum Technology Corporation
// 
// SPDX-License-Identifier: Apache-2.0 WITH SHL-2.1
// Licensed under the Solderpad Hardware License v 2.1 (the "License"); you may not use this file except in compliance
// with the License, or, at your option, the Apache License version 2.0.  You may obtain a copy of the License at
//                                        https://solderpad.org/licenses/SHL-2.1/
// Unless required by applicable law or agreed to in writing, any work distributed under the License is distributed on
// an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.  See the License for the
// specific language governing permissions and limitations under the License.


`ifndef __UVMA_SPI_IF_SV__
`define __UVMA_SPI_IF_SV__


/**
 * Encapsulates all signals and clocking of Serial Peripheral Interface interface. Used by monitor (uvma_spi_mon_c) and
 * driver (uvma_spi_drv_c).
 */
interface uvma_spi_if #(
   parameter SS_WIDTH = `UVMA_SPI_DEFAULT_SS_WIDTH
) (
   input logic clk    ,
   input logic reset_n
);
   
   // Signals
   wire                   sck ;
   wire                   mosi;
   wire                   miso;
   wire [(SS_WIDTH-1):0]  ss  ;
   
   
   /**
    * Used by DUT in 'mstr' mode.
    */
   clocking dut_mstr_cb @(posedge clk or reset_n);
      input   miso;
      output  sck ,
              mosi,
              ss  ;
   endclocking : dut_mstr_cb
   
   /**
    * Used by DUT in 'slv' mode.
    */
   clocking dut_slv_cb @(posedge clk or reset_n);
      input   sck ,
              mosi,
              ss  ;
      output  miso;
   endclocking : dut_slv_cb
   
   /**
    * Used by uvma_spi_drv_c.
    */
   clocking drv_mstr_cb @(posedge clk or reset_n);
      input   miso;
      output  sck ,
              mosi,
              ss  ;
   endclocking : drv_mstr_cb
   
   /**
    * Used by uvma_spi_drv_c.
    */
   clocking drv_slv_cb @(posedge clk or reset_n);
      input   sck ,
              mosi,
              ss  ;
      output  miso;
   endclocking : drv_slv_cb
   
   /**
    * Used by uvma_spi_mon_c.
    */
   clocking mon_cb @(posedge clk or reset_n);
      input   sck ,
              mosi,
              miso,
              ss  ;
   endclocking : mon_cb
   
   
   modport dut_mstr_mp   (clocking dut_mstr_cb);
   modport dut_slv_mp    (clocking dut_slv_cb );
   modport active_mstr_mp(clocking drv_mstr_cb);
   modport active_slv_mp (clocking drv_slv_cb );
   modport passive_mp    (clocking mon_cb     );
   
endinterface : uvma_spi_if


`endif // __UVMA_SPI_IF_SV__
