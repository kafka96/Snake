# Clock signal 
set_property PACKAGE_PIN W5 [get_ports CLK]  	 	 	 	  
 	set_property IOSTANDARD LVCMOS33 [get_ports CLK] 
    create_clock -add -name sys_clk_pin -period 10.00 -waveform {0 5} [get_ports CLK] 
    
##Pmod Header JB 
#Sch name = row1 
set_property PACKAGE_PIN A14 [get_ports {row[0]}]                      
     set_property IOSTANDARD LVCMOS33 [get_ports {row[0]}] 
##Sch name = row2 
set_property PACKAGE_PIN A16 [get_ports {row[1]}]                      
     set_property IOSTANDARD LVCMOS33 [get_ports {row[1]}] 
##Sch name = row3 
set_property PACKAGE_PIN B15 [get_ports {row[2]}]                      
     set_property IOSTANDARD LVCMOS33 [get_ports {row[2]}] 
set_property PACKAGE_PIN B16 [get_ports {row[3]}]                      
     set_property IOSTANDARD LVCMOS33 [get_ports {row[3]}] 
##Sch name = row7 
set_property PACKAGE_PIN A15 [get_ports {row[4]}]                      
     set_property IOSTANDARD LVCMOS33 [get_ports {row[4]}] 
##Sch name = row8 
set_property PACKAGE_PIN A17 [get_ports {row[5]}]                      
     set_property IOSTANDARD LVCMOS33 [get_ports {row[5]}] 
##Sch name = row9 
set_property PACKAGE_PIN C15 [get_ports {row[6]}]                      
     set_property IOSTANDARD LVCMOS33 [get_ports {row[6]}] 
##Sch name = row10  
set_property PACKAGE_PIN C16 [get_ports {row[7]}]                      
     set_property IOSTANDARD LVCMOS33 [get_ports {row[7]}] 
  
##Pmod Header JC 
##Sch name = JC1 
set_property PACKAGE_PIN K17 [get_ports data]                      
     set_property IOSTANDARD LVCMOS33 [get_ports data] 
##Sch name = JC2 
set_property PACKAGE_PIN M18 [get_ports OE]                      
     set_property IOSTANDARD LVCMOS33 [get_ports OE] 
##Sch name = JC3 
set_property PACKAGE_PIN N17 [get_ports ST_CP]                      
     set_property IOSTANDARD LVCMOS33 [get_ports ST_CP] 
##Sch name = JC4 
set_property PACKAGE_PIN P18 [get_ports SH_CP]                      
     set_property IOSTANDARD LVCMOS33 [get_ports SH_CP] 
##Sch name = JC7 
set_property PACKAGE_PIN L17 [get_ports MR]                      
     set_property IOSTANDARD LVCMOS33 [get_ports MR] 


####Apple Enable
#set_property PACKAGE_PIN R2 [get_ports apple_en] 	 	 	 	 	 
 	#set_property IOSTANDARD LVCMOS33 [get_ports apple_en] 
 	
set_property PACKAGE_PIN U16 [get_ports {out_[0]}]  	 	 	 	 
      set_property IOSTANDARD LVCMOS33 [get_ports {out_[0]}] 
 set_property PACKAGE_PIN E19 [get_ports {out_[1]}]                      
      set_property IOSTANDARD LVCMOS33 [get_ports {out_[1]}] 
 set_property PACKAGE_PIN U19 [get_ports {out_[2]}]                      
      set_property IOSTANDARD LVCMOS33 [get_ports {out_[2]}] 
 set_property PACKAGE_PIN V19 [get_ports {out_[3]}]                      
      set_property IOSTANDARD LVCMOS33 [get_ports {out_[3]}] 
 set_property PACKAGE_PIN W18 [get_ports {out_[4]}]                      
      set_property IOSTANDARD LVCMOS33 [get_ports {out_[4]}] 
 set_property PACKAGE_PIN U15 [get_ports {out_[5]}]                      
      set_property IOSTANDARD LVCMOS33 [get_ports {out_[5]}]  
      
      
#####Keyboard
set_property PACKAGE_PIN C17 [get_ports key_clk] 	 	 	 	 
 	set_property IOSTANDARD LVCMOS33 [get_ports key_clk] 
 	set_property PULLUP true [get_ports key_clk] 
set_property PACKAGE_PIN B17 [get_ports datain]  	 	 	 	 
 	set_property IOSTANDARD LVCMOS33 [get_ports datain] 	 
 	set_property PULLUP true [get_ports datain]
 	
 	
set_property PACKAGE_PIN W7 [get_ports {C[6]}]
         set_property IOSTANDARD LVCMOS33 [get_ports {C[6]}]
     
     set_property PACKAGE_PIN W6 [get_ports {C[5]}]
         set_property IOSTANDARD LVCMOS33 [get_ports {C[5]}]
     
     set_property PACKAGE_PIN U8 [get_ports {C[4]}]
         set_property IOSTANDARD LVCMOS33 [get_ports {C[4]}]
     
     set_property PACKAGE_PIN V8 [get_ports {C[3]}]
         set_property IOSTANDARD LVCMOS33 [get_ports {C[3]}]
     
     set_property PACKAGE_PIN U5 [get_ports {C[2]}]
         set_property IOSTANDARD LVCMOS33 [get_ports {C[2]}]
     
     set_property PACKAGE_PIN V5 [get_ports {C[1]}]
         set_property IOSTANDARD LVCMOS33 [get_ports {C[1]}]
     
     set_property PACKAGE_PIN U7 [get_ports {C[0]}]
         set_property IOSTANDARD LVCMOS33 [get_ports {C[0]}]
     
     set_property PACKAGE_PIN V7 [get_ports DP]
         set_property IOSTANDARD LVCMOS33 [get_ports DP]
     
     set_property PACKAGE_PIN U2 [get_ports {AN[0]}]
         set_property IOSTANDARD LVCMOS33 [get_ports {AN[0]}]
     
     set_property PACKAGE_PIN U4 [get_ports {AN[1]}]
         set_property IOSTANDARD LVCMOS33 [get_ports {AN[1]}]
     
     set_property PACKAGE_PIN V4 [get_ports {AN[2]}]
         set_property IOSTANDARD LVCMOS33 [get_ports {AN[2]}]
     
     set_property PACKAGE_PIN W4 [get_ports {AN[3]}]
         set_property IOSTANDARD LVCMOS33 [get_ports {AN[3]}]

set_property PACKAGE_PIN R2 [get_ports switch] 	 	 	 	 	 
 	set_property IOSTANDARD LVCMOS33 [get_ports switch] 