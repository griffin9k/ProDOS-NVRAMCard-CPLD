# ProDOS-NVRAMCard-CPLD
ProDOS Flash Disk for Apple II  
CPLD revision of Ralle Palaveev's ProDOS NVRAM Drive 512K, based on the hardware version 2.0, it should be flashed with firmware 2.0 as well. The card boots directly into ProDOS and it has a DOS 3.3 system image file which can be loaded into memory by users, of course the DOS3.3 commands do not apply to the card but you can operate under ProDOS and can SAVE/BSAVE programs/data back into the 512KB flash on the card, great design!  
The schematic is provided, you can make your own with any EDA software you like, or send the GERBER files to PCB service directly, and also Xilinx ISE needed to synthesis the verilog source code and program the CPLD by a JTAG Programmer.  
![ProDOS NVRAM Card](https://github.com/griffin9k/ProDOS-NVRAMCard-CPLD/blob/main/nvramcard%20photos/pcb_nvramcard_top.png)  
Here is the BOM listing:  
|Item No.|Type No.|Description|Qty|  
|---|---|---|---|  
|U1|Xilinx XC9572XL-VQ44|CPLD|1|    
|U2|SST 39SF040|Flash ROM|1|  
|U3|AMS1117-3.3|Voltage Regulator|1|  
|U4|74HC133/74LS133| 13-Input NAND Gate|1|    
|C1,C2,C3,C5|SMD 104 0805|Ceramic Capacitor|4|  
|C4|SMD 10uF 3216|Tantalum Capacitor|1|  
|C6|SMD 33uF 3528|Tantalum Capacitor|1|  
|U2|DIP32 Socket|(optional)|1|  
|U4|DIP16 Socket|(optional)|1|  

Tools:  
Xilinx JTAG Programmer  
Universal Programmer  

The firmware can be downloaded from the designer's github:  
https://github.com/rallepalaveev/Prodos-512kB-NVRAM-Drive

Copyright (c) 2021 Ralle Palaveev All rights reserved.
