# Traffic Light Controller

This repository contains VHDL code for a traffic light controller (`traffic_light_controller`) and its corresponding testbench (`tb_traffic_light_controller`).

## Files

- `traffic_light_controller.vhdl`: VHDL code for the traffic light controller entity and architecture.
- `tb_traffic_light_controller.vhdl`: VHDL code for the testbench entity and architecture.

## Traffic Light Controller (`traffic_light_controller`)

The `traffic_light_controller` entity represents a traffic light controller module. It controls the operation of the traffic lights based on the input signals `reset`, `clk`, and `start`, and generates the output signals `red`, `yellow`, and `green`.

### Ports

- `reset`: Input signal to reset the controller.
- `clk`: Clock signal.
- `start`: Input signal to start the traffic light sequence.
- `red`: Output signal for the red traffic light.
- `yellow`: Output signal for the yellow traffic light.
- `green`: Output signal for the green traffic light.

## Testbench (`tb_traffic_light_controller`)

The testbench (`tb_traffic_light_controller`) is used to verify the functionality of the `traffic_light_controller` module. It applies stimuli to the input ports and observes the output signals to ensure they behave as expected.

### Test Cases

The testbench includes the following test cases:

1. **Test Case 1**: Applying a reset signal, starting the traffic light sequence, and observing the behavior of the traffic lights.

## Running the Testbench

To run the testbench:

1. Compile the VHDL files (`traffic_light_controller.vhdl` and `tb_traffic_light_controller.vhdl`) using a VHDL compiler (e.g., GHDL).
2. Simulate the compiled design using a simulator (e.g., GHDL or ModelSim).

## Simulation Duration

The testbench simulates the traffic light controller for a specific duration to observe its behavior under different conditions.

