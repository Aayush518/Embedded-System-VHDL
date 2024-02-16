# 2-to-1 Multiplexer

This repository contains VHDL code for a 2-to-1 multiplexer (`mux2to1`) and its testbench (`tb_mux`). The multiplexer selects between two input signals (`a` and `b`) based on the value of the select signal (`sel`) and outputs the selected signal (`y`).

## Files

- `Multiplexer.vhdl`: VHDL code for the 2-to-1 multiplexer entity and architecture.
- `tb_mux.vhdl`: VHDL code for the testbench entity and architecture.

## `mux2to1` Entity

The `mux2to1` entity represents a 2-to-1 multiplexer with the following ports:

- `a`, `b`: Input signals to be multiplexed.
- `sel`: Select signal to choose between `a` and `b`.
- `y`: Output signal representing the selected input (`a` if `sel` is '0', `b` if `sel` is '1').

## Testbench (`tb_mux`)

The testbench (`tb_mux`) is used to verify the functionality of the `mux2to1` entity. It provides stimulus to the multiplexer and observes its output.

## Running the Testbench

To run the testbench:

1. Compile the VHDL files (`mux2to1.vhdl` and `tb_mux.vhdl`) using a VHDL compiler (e.g., GHDL).
2. Simulate the compiled design using a simulator (e.g., GHDL or ModelSim).

## Test Cases

The testbench includes the following test cases:

1. `sel = '0', a = '0', b = '0'`
2. `sel = '0', a = '1', b = '0'`
3. `sel = '1', a = '0', b = '1'`
4. `sel = '1', a = '1', b = '1'`

Each test case is applied for a duration of 10 ns.

## Observing Output

The testbench observes the output (`y`) of the multiplexer and reports it when the select signal (`sel`) transitions on a rising edge.


This `README.md` file provides an overview of the provided VHDL code, its purpose, and instructions for running the testbench to verify its functionality.

![Simulation Results](https://github.com/Aayush518/Embedded-System-VHDL/blob/ec4bc47be019a16cb51d0cc6a08aab0eea2b633a/src/Lab_2_input_MUX/Screenshot%202024-02-10%20at%2017.44.33.png "Simulation Results")
