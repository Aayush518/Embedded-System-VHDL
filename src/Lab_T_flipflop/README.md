## Write a VHDL code for a T flipflop.(2071 back)

# T Flip-Flop

This repository contains VHDL code for a T flip-flop (`T_FF`) and its corresponding testbench (`tb_T_FF`).

## Files

- `T_FF.vhdl`: VHDL code for the T flip-flop entity and architecture.
- `tb_T_FF.vhdl`: VHDL code for the testbench entity and architecture.

## T Flip-Flop (`T_FF`)

The `T_FF` entity represents a T flip-flop module. It has the following ports:

- `T`: T input.
- `CLK`: Clock input.
- `RST`: Reset input.
- `Q`: Output representing the state of the flip-flop.
- `Q_bar`: Output representing the complement of the state of the flip-flop.

## Testbench (`tb_T_FF`)

The testbench (`tb_T_FF`) is used to verify the functionality of the `T_FF` flip-flop. It applies stimuli to the T input and observes the outputs `Q` and `Q_bar` to ensure they behave as expected.

## Running the Testbench

To run the testbench:

1. Compile the VHDL files (`T_FF.vhdl` and `tb_T_FF.vhdl`) using a VHDL compiler (e.g., GHDL).
2. Simulate the compiled design using a simulator (e.g., GHDL or ModelSim).

## Test Cases

The testbench includes test cases to verify the behavior of the T flip-flop under different conditions:

1. **Test Case 1**: Applying T input high (`T = '1'`) and observing the output.

## Simulation Duration

Each test case is simulated for a duration sufficient to allow the flip-flop to react and for the outputs to be observed.

![Simulation Results](https://github.com/Aayush518/Embedded-System-VHDL/blob/main/src/Lab_T_flipflop/Screenshot%202024-02-10%20at%2018.58.30.png "Simulation Results")
