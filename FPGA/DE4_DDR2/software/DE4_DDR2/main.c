// ============================================================================
// Copyright (c) 2010 by Terasic Technologies Inc. 
// ============================================================================
//
// Permission:
//
//   Terasic grants permission to use and modify this code for use
//   in synthesis for all Terasic Development Boards and Altera Development 
//   Kits made by Terasic.  Other use of this code, including the selling 
//   ,duplication, or modification of any portion is strictly prohibited.
//
// Disclaimer:
//
//   This VHDL/Verilog or C/C++ source code is intended as a design reference
//   which illustrates how these types of functions can be implemented.
//   It is the user's responsibility to verify their design for
//   consistency and functionality through the use of formal
//   verification methods.  Terasic provides no warranty regarding the use 
//   or functionality of this code.
//
// ============================================================================
//           
//                     Terasic Technologies Inc
//                     356 Fu-Shin E. Rd Sec. 1. JhuBei City,
//                     HsinChu County, Taiwan
//                     302
//
//                     web: http://www.terasic.com/
//                     email: support@terasic.com
//
// ============================================================================
// Major Functions/Design Description:
//
//   Please refer to DE4_UserManual.pdf in DE4 system CD.
//
// ============================================================================
// Revision History:
// ============================================================================
//   Ver.: |Author:   |Mod. Date:    |Changes Made:
//   V1.0  |Richard   |10/06/30      |
// ============================================================================

#include <stdio.h>
#include <system.h>
#include "terasic_includes.h"
#include "i2c.h"
#include "mem_test.h"
#include "system.h"
#include <io.h>

#define SHOW_PROGRESS
#define xTEST_I2C

bool DDR2_RepeatRead(int Addr, int nNum){
    bool bSuccess = TRUE;
    int i, Value, FirstValue;
    FirstValue = IORD(DDR2_BASE, Addr);
    for(i=0;i<nNum;i++){
        Value = IORD(DDR2_BASE, Addr);
        if (Value != FirstValue){
            printf("Data mismatch at try=%d/%d, Read=%08Xh, Expected=%08Xh\n", i, nNum, Value, FirstValue);
            bSuccess = FALSE;
        }            
    }
    
    if (bSuccess)
        printf("Repeat read  success, addr=%d, repeat=%d, value=%08Xh\n", Addr, nNum, FirstValue); 
    return bSuccess;
}

bool DDR2_I2C_Read(void){
    const alt_u8 DeviceAddr = 0xA0; // 1010-000x
    bool bSuccess;
    int i;
   
#if 1
    alt_u8 szData[256];
    bSuccess = I2C_MultipleRead(DDR2_I2C_SCL_BASE, DDR2_I2C_SDA_BASE, DeviceAddr, szData, sizeof(szData));
    if (bSuccess){
        for(i=0;i<256 && bSuccess;i++){
            printf("EEPROM[%03d]=%02Xh ", i, szData[i]);
            //
            if (i == 0)
                printf("(Number of SPD Bytes Used)\n");
            else if (i == 1)
                printf("(Total Number of Bytes in SPD Device, Log2(N))\n");
            else if (i == 2)
                printf("(Basic Memory Type[08h:DDR2])\n");
            else if (i == 3)
                printf("(Number of Row Addresses on Assembly)\n");
            else if (i == 4)
                printf("(Number of Column Addresses on Assembly)\n");
            else if (i == 5)
                printf("(DIMM Height and Module Rank Number[b2b1b0+1])\n");
            else if (i == 6)
                printf("(Module Data Width)\n");
            else if (i == 7)
                printf("(Module Data Width, Coninued)\n");
            else if (i == 16)
                printf("(Burst Lengths Supported[bitmap: x x x x 8 4 x x])\n");
            else if (i == 13)
                printf("(Primary SDRAM width)\n");
            else if (i == 14)
                printf("(ECC SDRAM width)\n");
            else if (i == 17)
                printf("(Banks per SDRAM device)\n");
            else if (i == 18)
                printf("(CAS lantencies supported[bitmap: x x 5 4 3 2 x x])\n");
            else if (i == 20)
                printf("(DIMM Type: x x Mini-UDIMM Mini-RDIMM Micro-DIMM SO-DIMM UDIMMM RDIMM)\n");
            else if (i == 22)
                printf("(Memory Chip feature bitmap)\n");
            else if (i == 27)
                printf("(Minimun row precharge time[tRP;nsx4])\n");
            else if (i == 28)
                printf("(Minimun row active-row activce delay[tRRD;nsx4])\n");
            else if (i == 29)
                printf("(Minimun RAS to CAS delay[tRCD;nsx4])\n");
            else if (i == 30)
                printf("(Minimun acive to precharge time[tRAS;ns])\n");
            else if (i == 31)
                printf("(Size of each rank[bitmap:512MB,256MB,128MB,16GB,8GB,4GB,2GB,1GB)\n");
            else if (i == 36)
                printf("(Minimun write receovery time[tWR;nsx4])\n");
            else if (i == 37)
                printf("(Internal write to read command delay[tWTR;nsx4])\n");
            else if (i == 38)
                printf("(Internal read to precharge command delay[tRTP;nsx4])\n");
            else if (i == 41)
                printf("(Minimun activce to active/refresh time[tRC;ns])\n");
            else if (i == 42)
                printf("(Minimun refresh to active/refresh time[tRFC;ns])\n");
            else if (i == 62)
                printf("(SPD Revision)\n");
            else if (i == 63)
                printf("(Checksum)\n");
            else if (i == 64)
                printf("(64~71: Manufacturer JEDEC ID)\n");
            else if (i == 72)
                printf("(Module manufacturing location[Vendor-specific code])\n");
            else if (i == 73)
                printf("(73~90: Moduloe part number)\n");
            else if (i == 91)
                printf("(91~92: Moduloe revision code)\n");
            else if (i == 93)
                printf("(Manufacture Years since 2000[0-255])\n");
            else if (i == 94)
                printf("(Manufacture Weeks[1-52])\n");
            else if (i == 95)
                printf("(95~98[4-bytes]: Module serial number)\n");
            else if (i == 99)
                printf("(99~128: Manufacturer-specific data)\n");
            else
                printf("\n");
        }
    }else{
        printf("Failed to read EEPROM\n"); 
    }
    
#else    
    alt_u8 ControlAddr, Value;
    printf("DDR2 EEPROM Dump\n");
    bSuccess = TRUE;
    usleep(20*1000);
    for(i=0;i<256 && bSuccess;i++){
        ControlAddr = i;
        bSuccess = I2C_Read(DDR2_I2C_SCL_BASE, DDR2_I2C_SDA_BASE, DeviceAddr, ControlAddr, &Value);
        if (bSuccess){
            printf("EEPROM[%03d]=%02Xh\n", ControlAddr, Value);
        }else{
            printf("Failed to read EEPROM\n");
        }
    }
#endif    

    // test write
    if (bSuccess){
        alt_u8 WriteData = 0x12, TestAddr = 128;
        alt_u8 ReadData;
        usleep(20*1000);
        bSuccess = I2C_Write(DDR2_I2C_SCL_BASE, DDR2_I2C_SDA_BASE, DeviceAddr, TestAddr, WriteData);
        if (!bSuccess){
            printf("Failed to write EEPROM\n");            
        }else{
            bSuccess = I2C_Read(DDR2_I2C_SCL_BASE, DDR2_I2C_SDA_BASE, DeviceAddr, TestAddr, &ReadData);
            if (!bSuccess){
                printf("Failed to read EEPROM for verify\n");            
            }else{
                if (ReadData != WriteData){
                    bSuccess = FALSE;
                    printf("Verify EEPROM write fail, ReadData=%02Xh, WriteData=%02Xh\n", ReadData, WriteData);            
                }
            }                                        
        }    
        if (bSuccess)
            printf("Success to write EEPROM\n");
        else
            printf("Failed to write EEPROM\n");            
    }            

    return bSuccess;
}


int main(){

    bool bPass, bLoop = FALSE;
    int MemSize = DDR2_SPAN;
    int TimeStart, TimeElapsed, TestIndex = 0;
    void *ddr2_base = (void *)DDR2_BASE;
    alt_u32 InitValue;
    alt_u8 ButtonMask;
    
    
    printf("===== DE4 DDR2 Test Program =====\n");
    printf("DDR2 Clock: 400 MHZ\n");
    printf("DDR2  Size: %d MBytes\n", DDR2_SPAN/1024/1024);
    printf("DDR2  Rank: %d Rank(s)\n", DDR2_NUM_CHIPSELECTS);
    printf("DDR2  Bank: %d Bank(s)\n", DDR2_BA_WIDTH);
    printf("DDR2   Row: %d \n", DDR2_ROW_WIDTH);
    printf("DDR2   Col: %d \n", DDR2_COL_WIDTH);
#ifdef TEST_I2C    
    printf("DDR2 PSD Test: Yes\n");
#endif    
    
    while(1){
        printf("\n==========================================================\n");
        printf("Press any BUTTON to start test [BUTTON0 for continued test] \n");
        ButtonMask = 0x0F;
        while((ButtonMask & 0x0F) == 0x0F){
            ButtonMask = IORD(BUTTON_BASE, 0) & 0x0F;
        }
        
        if ((ButtonMask & 0x01) == 0x00){
            bLoop = TRUE;
        }else{
            bLoop = FALSE;
        }                    
        
        bPass = TRUE;
        TestIndex = 0;
        
        do{
        
            TimeStart = alt_nticks();
            TestIndex++;

#ifdef TEST_I2C        
            // i2c test
            printf("=====> I2C Testing, Iteration: %d\n", TestIndex);
            if (DDR2_I2C_Read())
                printf("I2C Pass\n");
            else        
                printf("I2C NG\n");
#endif                
    
            // memory test
            printf("=====> DDR2 Testing, Iteration: %d\n", TestIndex);
            InitValue = alt_nticks();
            bPass = TMEM_Verify((alt_u32)ddr2_base, MemSize, InitValue);
            TimeElapsed = alt_nticks()-TimeStart;
            if (bPass){
                printf("DDR2 test pass, size=%d bytes, %.3f sec\n", MemSize, (float)TimeElapsed/(float)alt_ticks_per_second());
            }else{
                printf("DDR2 test fail\n");
            }
        }while(bLoop && bPass);
    }        
    return 0;

}
