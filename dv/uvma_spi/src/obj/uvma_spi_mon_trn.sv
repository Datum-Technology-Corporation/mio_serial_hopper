// Copyright 2021 Datum Technology Corporation
// 
// SPDX-License-Identifier: Apache-2.0 WITH SHL-2.1
// Licensed under the Solderpad Hardware License v 2.1 (the "License"); you may not use this file except in compliance
// with the License, or, at your option, the Apache License version 2.0.  You may obtain a copy of the License at
//                                        https://solderpad.org/licenses/SHL-2.1/
// Unless required by applicable law or agreed to in writing, any work distributed under the License is distributed on
// an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.  See the License for the
// specific language governing permissions and limitations under the License.


`ifndef __UVMA_SPI_MON_TRN_SV__
`define __UVMA_SPI_MON_TRN_SV__


/**
 * Object rebuilt from the Serial Peripheral Interface monitor Analog of
 * uvma_spi_seq_item_c.
 */
class uvma_spi_mon_trn_c extends uvml_trn_mon_trn_c;
   
   // Data
   uvma_spi_access_type_enum                  access_type;
   logic [(`UVMA_SPI_ADDR_MAX_SIZE-1):0]      address    ;
   logic [(`UVMA_SPI_DATA_MAX_SIZE-1):0]      data       ;
   logic [((`UVMA_SPI_DATA_MAX_SIZE/8)-1):0]  strobe     ;
   uvma_spi_response_enum                     response   ;
   
   // Metadata
   int unsigned  addr_bus_width; // Measured in bytes (B)
   int unsigned  data_bus_width; // Measured in bytes (B)
   int unsigned  latency       ; // Measured in clock cycles
   
   
   `uvm_object_utils_begin(uvma_spi_mon_trn_c)
      `uvm_field_enum(uvma_spi_access_type_enum, access_type, UVM_DEFAULT)
      `uvm_field_int (                            address    , UVM_DEFAULT)
      `uvm_field_int (                            data       , UVM_DEFAULT)
      `uvm_field_int (                            strobe     , UVM_DEFAULT)
      `uvm_field_enum(uvma_spi_response_enum,    response   , UVM_DEFAULT)
   `uvm_object_utils_end
   
   
   /**
    * Default constructor.
    */
   extern function new(string name="uvma_spi_mon_trn");
   
endclass : uvma_spi_mon_trn_c


function uvma_spi_mon_trn_c::new(string name="uvma_spi_mon_trn");
   
   super.new(name);
   
endfunction : new


`endif // __UVMA_SPI_MON_TRN_SV__
