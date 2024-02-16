
# Entity: sequence_detect 
- **File**: Sequence_1101.vhdl

## Diagram
![Diagram](sequence_detect.svg "Diagram")
## Ports

| Port name       | Direction | Type      | Description |
| --------------- | --------- | --------- | ----------- |
| clk             | in        | std_logic |             |
| reset           | in        | std_logic |             |
| input_bit       | in        | std_logic |             |
| output_detected | out       | std_logic |             |

## Signals

| Name          | Type       | Description |
| ------------- | ---------- | ----------- |
| current_state | state_type |             |
| next_state    | state_type |             |
| prev_input    | std_logic  |             |

## Types

| Name       | Type                                                                                                                                                                 | Description |
| ---------- | -------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ----------- |
| state_type | (S0,<br><span style="padding-left:20px"> S1,<br><span style="padding-left:20px"> S2,<br><span style="padding-left:20px"> S3,<br><span style="padding-left:20px"> S4) |             |

## Processes
- unnamed: ( clk, reset )
- unnamed: ( current_state, input_bit )

## State machines

![Diagram_state_machine_0]( fsm_sequence_detect_00.svg "Diagram")

![Simulation Results](https://github.com/Aayush518/Embedded-System-VHDL/blob/main/src/Lab_sequence_detect_1101/Screenshot%202024-02-10%20at%2018.49.19.png "Simulation Results")
