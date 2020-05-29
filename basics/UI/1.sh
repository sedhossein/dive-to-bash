#!/bin/bash

# printing a message in the center of the screen.

cols=$( tput cols )
rows=$( tput lines )
message="sedhossein"

input_length=${#message}

half_input_length=$(( $input_length / 2 ))
middle_row=$(( $rows / 2 ))
middle_col=$(( ($cols / 2) - $half_input_length ))

tput clear
tput cup $middle_row $middle_col
tput bold
echo $message
tput sgr0
tput cup $( tput lines ) 0
# =================================
