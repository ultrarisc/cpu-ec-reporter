#!/bin/bash
UART_PORT=1
Msg_Type=04
Msg_len=01
Chip_temp=`sensors -j corepvt_ultrarisc-isa-0000|jq '."corepvt_ultrarisc-isa-0000"."Core temp0"."temp1_input"'|cut -d'.' -f1`
temp_16=`printf "%x\n" $Chip_temp`
Temp_flag=$?
if [ "$Temp_flag" -eq 0 ] && [ -c /dev/tty$UART_PORT ];then
	echo "$Msg_Type$Msg_len$temp_16"|xxd -r -p  >/dev/ttyS$UART_PORT
fi
