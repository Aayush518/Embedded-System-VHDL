## Write code for a custom processor that calculates Least Common Multiple (LCM) of two numbers as a finite state machine.(2074,2072 regular)

# LCM (Least Common Multiple)

This repository contains VHDL code for computing the Least Common Multiple (LCM) of two input integers (`LCM`) and its corresponding testbench (`LCM_TB`).

## Files

- `LCM.vhdl`: VHDL code for the LCM entity and architecture.
- `tb_lcm.vhdl`: VHDL code for the testbench entity and architecture.

## LCM (`LCM`)

The `LCM` entity represents a module to compute the LCM of two input integers. It has the following ports:

- `RESET`: Reset input.
- `CLK`: Clock input.
- `NUM1`: First input integer.
- `NUM2`: Second input integer.
- `LCM_Result`: Output for the computed LCM.

## Testbench (`LCM_TB`)

The testbench (`LCM_TB`) is used to verify the functionality of the `LCM` entity. It provides stimulus to the LCM module and verifies the correctness of the computed LCM.

## Running the Testbench

To run the testbench:

1. Compile the VHDL files (`LCM.vhdl` and `tb_lcm.vhdl`) using a VHDL compiler (e.g., GHDL).
2. Simulate the compiled design using a simulator (e.g., GHDL or ModelSim).

## Test Cases

The testbench includes various test cases to verify the behavior of the LCM module:

1. **Test Case 1**: Inputs `NUM1 = 6`, `NUM2 = 9`.
2. **Test Case 2**: Inputs `NUM1 = 15`, `NUM2 = 25`.
3. **Test Case 3**: Inputs `NUM1 = 8`, `NUM2 = 12`.
4. *(Add more test cases as needed)*

## Simulation Duration

Each test case is simulated for a duration sufficient to allow the LCM computation to complete and the result to be observed.

![Simulation Results](https://github.com/Aayush518/Embedded-System-VHDL/blob/main/src/Lab_LCM/Screenshot%202024-02-10%20at%2015.12.06.png "Simulation Results")
