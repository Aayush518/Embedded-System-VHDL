## Write a VHDL code for a D  flipflop.(2079 back)
 
 # D Flip-Flop

This repository contains VHDL code for a D flip-flop (`D_FlipFlop`) and its testbench (`tb_d_flipflop`). 

## Files

- `D_FlipFlop.vhdl`: VHDL code for the D flip-flop entity and architecture.
- `tb_d_flipflop.vhdl`: VHDL code for the testbench entity and architecture.

## `D_FlipFlop` Entity

The `D_FlipFlop` entity represents a D flip-flop with asynchronous reset, with the following ports:

- `D`: Data input.
- `CLK`: Clock input.
- `RST`: Reset input (active-high).
- `Q`: Output representing the state of the flip-flop.
- `Q_n`: Complementary output of `Q`.

## Testbench (`tb_d_flipflop`)

The testbench (`tb_d_flipflop`) is used to verify the functionality of the `D_FlipFlop` entity. It generates clock, reset, and data input signals and observes the flip-flop outputs.

## Running the Testbench

To run the testbench:

1. Compile the VHDL files (`D_FlipFlop.vhdl` and `tb_d_flipflop.vhdl`) using a VHDL compiler (e.g., GHDL).
2. Simulate the compiled design using a simulator (e.g., GHDL or ModelSim).

## Test Cases

The testbench includes the following test cases:

1. Apply a sequence of D input values (`'0'` and `'1'`) while the clock and reset signals are active.
2. Observe the outputs (`Q` and `Q_n`) of the flip-flop.

## Observing Output

The testbench monitors the `Q` and `Q_n` signals and reports their values during simulation.

## Simulation Duration

The simulation duration is set to 1000 ns (1 us) to allow for sufficient observation of the flip-flop behavior.

![Simulation Results](https://github.com/Aayush518/Embedded-System-VHDL/blob/main/src/Lab_D_flipflop/Screenshot%202024-02-10%20at%2017.47.27.png "Simulation Results")
