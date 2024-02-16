# Decoder

This repository contains VHDL code for a 2-to-4 decoder (`decoder`) and its testbench (`decoder_tb`). 

## Files

- `decoder.vhdl`: VHDL code for the decoder entity and architecture.
- `decoder_tb.vhdl`: VHDL code for the testbench entity and architecture.

## `decoder` Entity

The `decoder` entity represents a 2-to-4 decoder with the following ports:

- `input`: 2-bit input vector.
- `output`: 4-bit output vector representing the decoded output.

## Testbench (`decoder_tb`)

The testbench (`decoder_tb`) is used to verify the functionality of the `decoder` entity. It provides stimulus to the decoder and observes its output.

## Running the Testbench

To run the testbench:

1. Compile the VHDL files (`decoder.vhdl` and `decoder_tb.vhdl`) using a VHDL compiler (e.g., GHDL).
2. Simulate the compiled design using a simulator (e.g., GHDL or ModelSim).

## Test Cases

The testbench includes the following test cases:

1. Apply input `"00"` and observe the output `"0001"`.
2. Apply input `"01"` and observe the output `"0010"`.
3. Apply input `"10"` and observe the output `"0100"`.
4. Apply input `"11"` and observe the output `"1000"`.

Each test case applies the input for a duration of 10 ns.

## Observing Output

The testbench observes the output of the decoder and verifies that it matches the expected output for each input.

## Simulation Duration

The simulation duration is set to allow for sufficient observation of the decoder behavior.

![Simulation Results](https://github.com/Aayush518/Embedded-System-VHDL/blob/main/src/Lab_decoder/Screenshot%202024-02-10%20at%2018.45.35.png "Simulation Results")

