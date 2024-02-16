# JK Flip-Flop

This repository contains VHDL code for a JK flip-flop (`JK_FlipFlop`) and its corresponding testbench (`tb_jk_flipflop`).

## Files

- `JK_FlipFlop.vhdl`: VHDL code for the JK flip-flop entity and architecture.
- `tb_jk_flipflop.vhdl`: VHDL code for the testbench entity and architecture.

## JK Flip-Flop (`JK_FlipFlop`)

The `JK_FlipFlop` entity represents a JK flip-flop with the following ports:

- `J`: J input.
- `K`: K input.
- `CLK`: Clock input.
- `RST`: Reset input.
- `Q`: Output.

## Testbench (`tb_jk_flipflop`)

The testbench (`tb_jk_flipflop`) is used to verify the functionality of the `JK_FlipFlop` entity. It provides stimulus to the JK flip-flop and observes its output.

## Running the Testbench

To run the testbench:

1. Compile the VHDL files (`JK_FlipFlop.vhdl` and `tb_jk_flipflop.vhdl`) using a VHDL compiler (e.g., GHDL).
2. Simulate the compiled design using a simulator (e.g., GHDL or ModelSim).

## Test Cases

The testbench includes various test cases to verify the behavior of the JK flip-flop:

1. **Test Case 1**: Inputs `J = '0'`, `K = '0'`.
2. **Test Case 2**: Inputs `J = '1'`, `K = '0'`.
3. **Test Case 3**: Inputs `J = '0'`, `K = '1'`.
4. **Test Case 4**: Inputs `J = '1'`, `K = '1'`.
5. *(Add more test cases as needed)*

## Simulation Duration

Each test case is simulated for a duration to allow sufficient time for the flip-flop to stabilize and the output to be observed.

![SIMULATION RESULTS](src/Lab_JK_flipflop/Screenshot 2024-02-16 at 16.01.45.png)