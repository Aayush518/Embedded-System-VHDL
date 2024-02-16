## WRITE THE CODE FOR BCD COUNTER TO DISPLAY 0 TO 9999 IN SEVEN SEGMENT USING VHDL.(2070 regular)
# BCD Counter

This repository contains VHDL code for a Binary Coded Decimal (BCD) counter (`BCD_Counter`) and its testbench (`tb_bcd_counter`). The BCD counter counts from 0 to 9999 and outputs the BCD representation of the count on a 7-segment display.

## Files

- `BCD_Counter.vhdl`: VHDL code for the BCD counter entity and architecture.
- `tb_bcd_counter.vhdl`: VHDL code for the testbench entity and architecture.

## `BCD_Counter` Entity

The `BCD_Counter` entity represents a BCD counter with the following ports:

- `clk`: Clock signal.
- `reset`: Reset signal (active-high).
- `seg_out`: Output representing the segments of the 7-segment display.
- `anode`: Anode signals for controlling multiplexing of the 7-segment display.

## Testbench (`tb_bcd_counter`)

The testbench (`tb_bcd_counter`) is used to verify the functionality of the `BCD_Counter` entity. It generates clock and reset signals and monitors the output to ensure correct behavior.

## Running the Testbench

To run the testbench:

1. Compile the VHDL files (`BCD_Counter.vhdl` and `tb_bcd_counter.vhdl`) using a VHDL compiler (e.g., GHDL).
2. Simulate the compiled design using a simulator (e.g., GHDL or ModelSim).

## Test Cases

The testbench includes the following test cases:

1. Reset the counter, then observe it counting from 0 to 9999.
2. Reset the counter again to observe it repeating the counting sequence.

Each test case includes stimulus to activate and deactivate the reset signal and observes the counter output.

## Observing Output

The testbench monitors the `seg_out` signal and reports the current segment displayed on the 7-segment display during simulation.

## Simulation Duration

The simulation duration is set to 100,000 ns (100 us) to allow for sufficient observation of the counter behavior.

![Simulation Results](https://github.com/Aayush518/Embedded-System-VHDL/blob/main/src/Lab_BCD_counter/Screenshot%202024-02-10%20at%2017.46.09.png "Simulation Results")

