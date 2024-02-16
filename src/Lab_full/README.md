## Using structural model,write a code in VHDL to implement full adder.(2077 ,2075 regular , 2073 back)

# Full Adder

This repository contains VHDL code for a full adder (`Full_Adder`) and its corresponding testbench (`tb_full_adder`). 

## Files

- `Full_Adder.vhdl`: VHDL code for the full adder entity and architecture.
- `tb_full_adder.vhdl`: VHDL code for the testbench entity and architecture.

## Full Adder (`Full_Adder`)

The `Full_Adder` entity represents a full adder with the following ports:

- `A`: First input.
- `B`: Second input.
- `CIN`: Carry-in input.
- `S`: Sum output.
- `COUT`: Carry-out output.

## Testbench (`tb_full_adder`)

The testbench (`tb_full_adder`) is used to verify the functionality of the `Full_Adder` entity. It provides stimulus to the full adder and observes its outputs.

## Running the Testbench

To run the testbench:

1. Compile the VHDL files (`Full_Adder.vhdl` and `tb_full_adder.vhdl`) using a VHDL compiler (e.g., GHDL).
2. Simulate the compiled design using a simulator (e.g., GHDL or ModelSim).

## Test Cases

The testbench includes various test cases to verify the behavior of the full adder:

1. **Test Case 1**: Inputs `A = '0'`, `B = '0'`, `CIN = '0'`.
2. **Test Case 2**: Inputs `A = '0'`, `B = '1'`, `CIN = '0'`.
3. **Test Case 3**: Inputs `A = '1'`, `B = '1'`, `CIN = '1'`.
4. **Test Case 4**: Inputs `A = '1'`, `B = '0'`, `CIN = '0'`.
5. **Test Case 5**: Inputs `A = '0'`, `B = '1'`, `CIN = '1'`.
6. **Test Case 6**: Inputs `A = '1'`, `B = '0'`, `CIN = '1'`.
7. **Test Case 7**: Inputs `A = '1'`, `B = '1'`, `CIN = '0'`.
8. **Test Case 8**: Inputs `A = '1'`, `B = '1'`, `CIN = '1'`.

## Observing Output

The testbench observes the `S` (sum) and `COUT` (carry-out) signals of the full adder for each test case to ensure correct functionality.

## Simulation Duration

Each test case is simulated for a duration to allow sufficient observation of the full adder behavior.

![Simulation Results](https://github.com/Aayush518/Embedded-System-VHDL/blob/main/src/Lab_full/Screenshot%202024-02-10%20at%2015.19.54.png "Simulation Results")
