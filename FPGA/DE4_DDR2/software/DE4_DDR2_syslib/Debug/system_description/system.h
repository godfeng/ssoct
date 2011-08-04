/* system.h
 *
 * Machine generated for a CPU named "cpu" as defined in:
 * c:\Terasic\DE4_Install\demonstrations\DE4_230\DE4_DDR2\software\DE4_DDR2_syslib\..\..\DE4_SOPC.ptf
 *
 * Generated: 2011-07-04 17:46:11.219
 *
 */

#ifndef __SYSTEM_H_
#define __SYSTEM_H_

/*

DO NOT MODIFY THIS FILE

   Changing this file will have subtle consequences
   which will almost certainly lead to a nonfunctioning
   system. If you do modify this file, be aware that your
   changes will be overwritten and lost when this file
   is generated again.

DO NOT MODIFY THIS FILE

*/

/******************************************************************************
*                                                                             *
* License Agreement                                                           *
*                                                                             *
* Copyright (c) 2003 Altera Corporation, San Jose, California, USA.           *
* All rights reserved.                                                        *
*                                                                             *
* Permission is hereby granted, free of charge, to any person obtaining a     *
* copy of this software and associated documentation files (the "Software"),  *
* to deal in the Software without restriction, including without limitation   *
* the rights to use, copy, modify, merge, publish, distribute, sublicense,    *
* and/or sell copies of the Software, and to permit persons to whom the       *
* Software is furnished to do so, subject to the following conditions:        *
*                                                                             *
* The above copyright notice and this permission notice shall be included in  *
* all copies or substantial portions of the Software.                         *
*                                                                             *
* THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR  *
* IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,    *
* FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE *
* AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER      *
* LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING     *
* FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER         *
* DEALINGS IN THE SOFTWARE.                                                   *
*                                                                             *
* This agreement shall be governed in all respects by the laws of the State   *
* of California and by the laws of the United States of America.              *
*                                                                             *
******************************************************************************/

/*
 * system configuration
 *
 */

#define ALT_SYSTEM_NAME "DE4_SOPC"
#define ALT_CPU_NAME "cpu"
#define ALT_CPU_ARCHITECTURE "altera_nios2"
#define ALT_DEVICE_FAMILY "STRATIXIV"
#define ALT_STDIN "/dev/jtag_uart"
#define ALT_STDIN_TYPE "altera_avalon_jtag_uart"
#define ALT_STDIN_BASE 0x41041000
#define ALT_STDIN_DEV jtag_uart
#define ALT_STDIN_PRESENT
#define ALT_STDOUT "/dev/jtag_uart"
#define ALT_STDOUT_TYPE "altera_avalon_jtag_uart"
#define ALT_STDOUT_BASE 0x41041000
#define ALT_STDOUT_DEV jtag_uart
#define ALT_STDOUT_PRESENT
#define ALT_STDERR "/dev/jtag_uart"
#define ALT_STDERR_TYPE "altera_avalon_jtag_uart"
#define ALT_STDERR_BASE 0x41041000
#define ALT_STDERR_DEV jtag_uart
#define ALT_STDERR_PRESENT
#define ALT_CPU_FREQ 200000000
#define ALT_IRQ_BASE NULL
#define ALT_LEGACY_INTERRUPT_API_PRESENT

/*
 * processor configuration
 *
 */

#define NIOS2_CPU_IMPLEMENTATION "fast"
#define NIOS2_BIG_ENDIAN 0
#define NIOS2_INTERRUPT_CONTROLLER_ID 0

#define NIOS2_ICACHE_SIZE 4096
#define NIOS2_DCACHE_SIZE 2048
#define NIOS2_ICACHE_LINE_SIZE 32
#define NIOS2_ICACHE_LINE_SIZE_LOG2 5
#define NIOS2_DCACHE_LINE_SIZE 32
#define NIOS2_DCACHE_LINE_SIZE_LOG2 5
#define NIOS2_FLUSHDA_SUPPORTED

#define NIOS2_EXCEPTION_ADDR 0x41020020
#define NIOS2_RESET_ADDR 0x41020000
#define NIOS2_BREAK_ADDR 0x41040820

#define NIOS2_HAS_DEBUG_STUB

#define NIOS2_CPU_ID_SIZE 1
#define NIOS2_CPU_ID_VALUE 0

/*
 * A define for each class of peripheral
 *
 */

#define __ALTERA_AVALON_SYSID
#define __ALTERA_AVALON_JTAG_UART
#define __ALTERA_AVALON_TIMER
#define __ALTERA_AVALON_PIO
#define __ALTERA_AVALON_ONCHIP_MEMORY2
#define __DDR2_HIGH_PERF
#define __ALTERA_AVALON_CLOCK_CROSSING
#define __ALTERA_AVALON_PIPELINE_BRIDGE

/*
 * sysid configuration
 *
 */

#define SYSID_NAME "/dev/sysid"
#define SYSID_TYPE "altera_avalon_sysid"
#define SYSID_BASE 0x40000070
#define SYSID_SPAN 8
#define SYSID_ID 651202559u
#define SYSID_TIMESTAMP 1277427864u
#define SYSID_REGENERATE_VALUES 0
#define ALT_MODULE_CLASS_sysid altera_avalon_sysid

/*
 * jtag_uart configuration
 *
 */

#define JTAG_UART_NAME "/dev/jtag_uart"
#define JTAG_UART_TYPE "altera_avalon_jtag_uart"
#define JTAG_UART_BASE 0x41041000
#define JTAG_UART_SPAN 8
#define JTAG_UART_IRQ 0
#define JTAG_UART_IRQ_INTERRUPT_CONTROLLER_ID 0
#define JTAG_UART_WRITE_DEPTH 64
#define JTAG_UART_READ_DEPTH 64
#define JTAG_UART_WRITE_THRESHOLD 8
#define JTAG_UART_READ_THRESHOLD 8
#define JTAG_UART_READ_CHAR_STREAM ""
#define JTAG_UART_SHOWASCII 1
#define JTAG_UART_RELATIVEPATH 0
#define JTAG_UART_READ_LE 0
#define JTAG_UART_WRITE_LE 0
#define JTAG_UART_ALTERA_SHOW_UNRELEASED_JTAG_UART_FEATURES 0
#define ALT_MODULE_CLASS_jtag_uart altera_avalon_jtag_uart

/*
 * timer configuration
 *
 */

#define TIMER_NAME "/dev/timer"
#define TIMER_TYPE "altera_avalon_timer"
#define TIMER_BASE 0x40000000
#define TIMER_SPAN 32
#define TIMER_IRQ 1
#define TIMER_IRQ_INTERRUPT_CONTROLLER_ID 0
#define TIMER_ALWAYS_RUN 0
#define TIMER_FIXED_PERIOD 0
#define TIMER_SNAPSHOT 1
#define TIMER_PERIOD 1
#define TIMER_PERIOD_UNITS "ms"
#define TIMER_RESET_OUTPUT 0
#define TIMER_TIMEOUT_PULSE_OUTPUT 0
#define TIMER_LOAD_VALUE 49999
#define TIMER_COUNTER_SIZE 32
#define TIMER_MULT 0.0010
#define TIMER_TICKS_PER_SEC 1000
#define TIMER_FREQ 50000000
#define ALT_MODULE_CLASS_timer altera_avalon_timer

/*
 * led configuration
 *
 */

#define LED_NAME "/dev/led"
#define LED_TYPE "altera_avalon_pio"
#define LED_BASE 0x40000030
#define LED_SPAN 16
#define LED_DO_TEST_BENCH_WIRING 0
#define LED_DRIVEN_SIM_VALUE 0
#define LED_HAS_TRI 0
#define LED_HAS_OUT 1
#define LED_HAS_IN 0
#define LED_CAPTURE 0
#define LED_DATA_WIDTH 8
#define LED_RESET_VALUE 0
#define LED_EDGE_TYPE "NONE"
#define LED_IRQ_TYPE "NONE"
#define LED_BIT_CLEARING_EDGE_REGISTER 0
#define LED_BIT_MODIFYING_OUTPUT_REGISTER 0
#define LED_FREQ 50000000
#define ALT_MODULE_CLASS_led altera_avalon_pio

/*
 * button configuration
 *
 */

#define BUTTON_NAME "/dev/button"
#define BUTTON_TYPE "altera_avalon_pio"
#define BUTTON_BASE 0x40000020
#define BUTTON_SPAN 16
#define BUTTON_DO_TEST_BENCH_WIRING 0
#define BUTTON_DRIVEN_SIM_VALUE 0
#define BUTTON_HAS_TRI 0
#define BUTTON_HAS_OUT 0
#define BUTTON_HAS_IN 1
#define BUTTON_CAPTURE 0
#define BUTTON_DATA_WIDTH 4
#define BUTTON_RESET_VALUE 0
#define BUTTON_EDGE_TYPE "NONE"
#define BUTTON_IRQ_TYPE "NONE"
#define BUTTON_BIT_CLEARING_EDGE_REGISTER 0
#define BUTTON_BIT_MODIFYING_OUTPUT_REGISTER 0
#define BUTTON_FREQ 50000000
#define ALT_MODULE_CLASS_button altera_avalon_pio

/*
 * onchip_memory2 configuration
 *
 */

#define ONCHIP_MEMORY2_NAME "/dev/onchip_memory2"
#define ONCHIP_MEMORY2_TYPE "altera_avalon_onchip_memory2"
#define ONCHIP_MEMORY2_BASE 0x41020000
#define ONCHIP_MEMORY2_SPAN 131072
#define ONCHIP_MEMORY2_ALLOW_MRAM_SIM_CONTENTS_ONLY_FILE 0
#define ONCHIP_MEMORY2_RAM_BLOCK_TYPE "AUTO"
#define ONCHIP_MEMORY2_INIT_CONTENTS_FILE "onchip_memory2"
#define ONCHIP_MEMORY2_NON_DEFAULT_INIT_FILE_ENABLED 0
#define ONCHIP_MEMORY2_GUI_RAM_BLOCK_TYPE "Automatic"
#define ONCHIP_MEMORY2_WRITEABLE 1
#define ONCHIP_MEMORY2_DUAL_PORT 0
#define ONCHIP_MEMORY2_SIZE_VALUE 131072
#define ONCHIP_MEMORY2_SIZE_MULTIPLE 1
#define ONCHIP_MEMORY2_USE_SHALLOW_MEM_BLOCKS 0
#define ONCHIP_MEMORY2_INIT_MEM_CONTENT 1
#define ONCHIP_MEMORY2_ALLOW_IN_SYSTEM_MEMORY_CONTENT_EDITOR 0
#define ONCHIP_MEMORY2_INSTANCE_ID "NONE"
#define ONCHIP_MEMORY2_READ_DURING_WRITE_MODE "DONT_CARE"
#define ONCHIP_MEMORY2_IGNORE_AUTO_BLOCK_TYPE_ASSIGNMENT 1
#define ONCHIP_MEMORY2_CONTENTS_INFO ""
#define ALT_MODULE_CLASS_onchip_memory2 altera_avalon_onchip_memory2

/*
 * ddr2 configuration
 *
 */

#define DDR2_NAME "/dev/ddr2"
#define DDR2_TYPE "ddr2_high_perf"
#define DDR2_BASE 0x00000000
#define DDR2_SPAN 1073741824
#define DDR2_DEVICE_FAMILY "Stratix IV"
#define DDR2_DATAWIDTH 64
#define DDR2_MEMTYPE "DDR2 SDRAM"
#define DDR2_LOCAL_BURST_LENGTH 4
#define DDR2_NUM_CHIPSELECTS 1
#define DDR2_CAS_LATENCY 6.0
#define DDR2_ADDR_WIDTH 14
#define DDR2_BA_WIDTH 3
#define DDR2_ROW_WIDTH 14
#define DDR2_COL_WIDTH 10
#define DDR2_CLOCKSPEED 2500
#define DDR2_DATA_WIDTH_RATIO 4
#define DDR2_REG_DIMM "false"
#define DDR2_DQ_PER_DQS 8
#define DDR2_PHY_IF_TYPE_AFI "true"
#define DDR2_DDRX "true"
#define ALT_MODULE_CLASS_ddr2 ddr2_high_perf

/*
 * clock_crossing_io configuration
 *
 */

#define CLOCK_CROSSING_IO_NAME "/dev/clock_crossing_io"
#define CLOCK_CROSSING_IO_TYPE "altera_avalon_clock_crossing"
#define CLOCK_CROSSING_IO_BASE 0x40000000
#define CLOCK_CROSSING_IO_SPAN 128
#define CLOCK_CROSSING_IO_UPSTREAM_FIFO_DEPTH 256
#define CLOCK_CROSSING_IO_DOWNSTREAM_FIFO_DEPTH 32
#define CLOCK_CROSSING_IO_DATA_WIDTH 32
#define CLOCK_CROSSING_IO_NATIVE_ADDRESS_WIDTH 5
#define CLOCK_CROSSING_IO_USE_BYTE_ENABLE 1
#define CLOCK_CROSSING_IO_USE_BURST_COUNT 0
#define CLOCK_CROSSING_IO_MAXIMUM_BURST_SIZE 8
#define CLOCK_CROSSING_IO_UPSTREAM_USE_REGISTER 0
#define CLOCK_CROSSING_IO_DOWNSTREAM_USE_REGISTER 0
#define CLOCK_CROSSING_IO_SLAVE_SYNCHRONIZER_DEPTH 3
#define CLOCK_CROSSING_IO_MASTER_SYNCHRONIZER_DEPTH 3
#define CLOCK_CROSSING_IO_DEVICE_FAMILY "STRATIXIV"
#define ALT_MODULE_CLASS_clock_crossing_io altera_avalon_clock_crossing

/*
 * ddr2_i2c_sa configuration
 *
 */

#define DDR2_I2C_SA_NAME "/dev/ddr2_i2c_sa"
#define DDR2_I2C_SA_TYPE "altera_avalon_pio"
#define DDR2_I2C_SA_BASE 0x40000040
#define DDR2_I2C_SA_SPAN 16
#define DDR2_I2C_SA_DO_TEST_BENCH_WIRING 0
#define DDR2_I2C_SA_DRIVEN_SIM_VALUE 0
#define DDR2_I2C_SA_HAS_TRI 0
#define DDR2_I2C_SA_HAS_OUT 1
#define DDR2_I2C_SA_HAS_IN 0
#define DDR2_I2C_SA_CAPTURE 0
#define DDR2_I2C_SA_DATA_WIDTH 2
#define DDR2_I2C_SA_RESET_VALUE 0
#define DDR2_I2C_SA_EDGE_TYPE "NONE"
#define DDR2_I2C_SA_IRQ_TYPE "NONE"
#define DDR2_I2C_SA_BIT_CLEARING_EDGE_REGISTER 0
#define DDR2_I2C_SA_BIT_MODIFYING_OUTPUT_REGISTER 0
#define DDR2_I2C_SA_FREQ 50000000
#define ALT_MODULE_CLASS_ddr2_i2c_sa altera_avalon_pio

/*
 * ddr2_i2c_scl configuration
 *
 */

#define DDR2_I2C_SCL_NAME "/dev/ddr2_i2c_scl"
#define DDR2_I2C_SCL_TYPE "altera_avalon_pio"
#define DDR2_I2C_SCL_BASE 0x40000050
#define DDR2_I2C_SCL_SPAN 16
#define DDR2_I2C_SCL_DO_TEST_BENCH_WIRING 0
#define DDR2_I2C_SCL_DRIVEN_SIM_VALUE 0
#define DDR2_I2C_SCL_HAS_TRI 0
#define DDR2_I2C_SCL_HAS_OUT 1
#define DDR2_I2C_SCL_HAS_IN 0
#define DDR2_I2C_SCL_CAPTURE 0
#define DDR2_I2C_SCL_DATA_WIDTH 1
#define DDR2_I2C_SCL_RESET_VALUE 0
#define DDR2_I2C_SCL_EDGE_TYPE "NONE"
#define DDR2_I2C_SCL_IRQ_TYPE "NONE"
#define DDR2_I2C_SCL_BIT_CLEARING_EDGE_REGISTER 0
#define DDR2_I2C_SCL_BIT_MODIFYING_OUTPUT_REGISTER 0
#define DDR2_I2C_SCL_FREQ 50000000
#define ALT_MODULE_CLASS_ddr2_i2c_scl altera_avalon_pio

/*
 * ddr2_i2c_sda configuration
 *
 */

#define DDR2_I2C_SDA_NAME "/dev/ddr2_i2c_sda"
#define DDR2_I2C_SDA_TYPE "altera_avalon_pio"
#define DDR2_I2C_SDA_BASE 0x40000060
#define DDR2_I2C_SDA_SPAN 16
#define DDR2_I2C_SDA_DO_TEST_BENCH_WIRING 0
#define DDR2_I2C_SDA_DRIVEN_SIM_VALUE 0
#define DDR2_I2C_SDA_HAS_TRI 1
#define DDR2_I2C_SDA_HAS_OUT 0
#define DDR2_I2C_SDA_HAS_IN 0
#define DDR2_I2C_SDA_CAPTURE 0
#define DDR2_I2C_SDA_DATA_WIDTH 1
#define DDR2_I2C_SDA_RESET_VALUE 0
#define DDR2_I2C_SDA_EDGE_TYPE "NONE"
#define DDR2_I2C_SDA_IRQ_TYPE "NONE"
#define DDR2_I2C_SDA_BIT_CLEARING_EDGE_REGISTER 0
#define DDR2_I2C_SDA_BIT_MODIFYING_OUTPUT_REGISTER 0
#define DDR2_I2C_SDA_FREQ 50000000
#define ALT_MODULE_CLASS_ddr2_i2c_sda altera_avalon_pio

/*
 * pipeline_bridge_ddr2 configuration
 *
 */

#define PIPELINE_BRIDGE_DDR2_NAME "/dev/pipeline_bridge_ddr2"
#define PIPELINE_BRIDGE_DDR2_TYPE "altera_avalon_pipeline_bridge"
#define PIPELINE_BRIDGE_DDR2_BASE 0x00000000
#define PIPELINE_BRIDGE_DDR2_SPAN 1073741824
#define PIPELINE_BRIDGE_DDR2_IS_DOWNSTREAM 1
#define PIPELINE_BRIDGE_DDR2_IS_UPSTREAM 1
#define PIPELINE_BRIDGE_DDR2_IS_WAITREQUEST 0
#define PIPELINE_BRIDGE_DDR2_ENABLE_ARBITERLOCK 0
#define ALT_MODULE_CLASS_pipeline_bridge_ddr2 altera_avalon_pipeline_bridge

/*
 * system library configuration
 *
 */

#define ALT_MAX_FD 32
#define ALT_SYS_CLK TIMER
#define ALT_TIMESTAMP_CLK none

/*
 * Devices associated with code sections.
 *
 */

#define ALT_TEXT_DEVICE       ONCHIP_MEMORY2
#define ALT_RODATA_DEVICE     ONCHIP_MEMORY2
#define ALT_RWDATA_DEVICE     ONCHIP_MEMORY2
#define ALT_EXCEPTIONS_DEVICE ONCHIP_MEMORY2
#define ALT_RESET_DEVICE      ONCHIP_MEMORY2

/*
 * The text section is initialised so no bootloader will be required.
 * Set a variable to tell crt0.S to provide code at the reset address and
 * to initialise rwdata if appropriate.
 */

#define ALT_NO_BOOTLOADER


#endif /* __SYSTEM_H_ */