`ifndef _constants_uartvh_
`define _constants_uart_vh_

// FSM States for UART Low Level Driver
`define FSM_IDLE 		 0
`define FSM_B0   		 1
`define FSM_B1   		 2
`define FSM_B2   		 3
`define FSM_B3   		 4
`define FSM_B4   		 5
`define FSM_B5   		 6
`define FSM_B6   		 7
`define FSM_B7   		 8
`define FSM_STOP 		 9
`define FSM_W0   		 10
`define FSM_W1   		 11
`define FSM_W2   		 12
`define FSM_W3   		 13
`define FSM_W4   		 14
`define FSM_W5   		 15
`define FSM_W6   		 16
`define FSM_W7   		 17
`define FSM_WI   		 18
`define FSM_STOP2 		 19





/********* UART CONTROLLER *********/
`define START_BYTE      8'hEE
`define STOP_BYTE       8'hDD


`define SELECT_FFT8								 2'd1
`define SELECT_FFT16							 2'd2
`define SELECT_FFT32							 2'd3




// FSM States for UART Controller
`define FSM_IDLE 		             0
`define FSM_RX_FFT_SELECT         1
`define FSM_RX_SAMPLE_R_INT       2
`define FSM_RX_SAMPLE_R_FRAC      3
`define FSM_RX_SAMPLE_I_INT       4
`define FSM_RX_SAMPLE_I_FRAC      5
`define FSM_RX_STOP               6
`define FSM_TX_START              7
`define FSM_TX_COEFF_R_INT        8
`define FSM_TX_COEFF_R_FRAC       9
`define FSM_TX_COEFF_I_INT        10
`define FSM_TX_COEFF_I_FRAC       11
`define FSM_TX_STOP 					 12



// FSM States 

// `define FSM_IDLE 		          0
`define FSM_SAMPLE_0              1
`define FSM_SAMPLE_1              2
`define FSM_SAMPLE_2              3
`define FSM_SAMPLE_3              4
`define FSM_SAMPLE_4              5
`define FSM_SAMPLE_5              6
`define FSM_SAMPLE_6              7
`define FSM_SAMPLE_7              8
`define FSM_SAMPLE_8              9
`define FSM_SAMPLE_9              10
`define FSM_SAMPLE_10             11
`define FSM_SAMPLE_11             12
`define FSM_SAMPLE_12             13
`define FSM_SAMPLE_13             14
`define FSM_SAMPLE_14             15
`define FSM_SAMPLE_15             16
`define FSM_SAMPLE_16             17
`define FSM_SAMPLE_17             18
`define FSM_SAMPLE_18             19
`define FSM_SAMPLE_19             20
`define FSM_SAMPLE_20             21
`define FSM_SAMPLE_21             22
`define FSM_SAMPLE_22             23
`define FSM_SAMPLE_23             24
`define FSM_SAMPLE_24             25
`define FSM_SAMPLE_25             26
`define FSM_SAMPLE_26             27
`define FSM_SAMPLE_27             28
`define FSM_SAMPLE_28             29
`define FSM_SAMPLE_29             30
`define FSM_SAMPLE_30             31
`define FSM_SAMPLE_31             32




`define LOW_1      = 1'b0;
`define HIGH_1     = 1'b1;




`endif






