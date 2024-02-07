# Embedded System VHDL Assignment

This repository contains VHDL code and test cases for  embedded system assignment. The code is compiled using GHDL and the waveforms is visualized using GTKWave. The development environment used is Visual Studio Code (VSCode).

## Table of Contents

- [Introduction](#introduction)
- [Prerequisites](#prerequisites)
- [Getting Started](#getting-started)
  - [Cloning the Repository](#cloning-the-repository)
  - [Installing GHDL](#installing-ghdl)
  - [Installing GTKWave](#installing-gtkwave)
  - [Setting up VSCode](#setting-up-vscode)
- [Running Test Cases](#running-test-cases)
- [Project Structure](#project-structure)

## Introduction


## Prerequisites

Ensure you have the following software installed on your system:

- GHDL
- GTKWave
- Visual Studio Code

## Getting Started

### Cloning the Repository

```bash
git clone https://github.com/Aayush518/Embedded-System-VHDL.git
cd Embedded-System-VHDL
```

### Installing GHDL

Follow the instructions on the [GHDL GitHub repository](https://github.com/ghdl/ghdl) to install GHDL on your system.

### Installing GTKWave

Follow the instructions on the [GTKWave website](http://gtkwave.sourceforge.net/) to install GTKWave on your system.

### Setting up VSCode

1. Install the "GHDL Language Server" extension from the Visual Studio Code marketplace.

2. Open your project folder in VSCode.

3. Create a `.vscode` folder in your project and add a `settings.json` file with the following content:

```json
{
  "files.associations": {
    "*.vhd": "vhdl"
  },
  "ghdlLS.trace.server": "verbose",
  "ghdlLS.trace.transport": "verbose"
}
```

This ensures proper VHDL language support and configuration for GHDL in VSCode.

## Running Test Cases

Describe how to run the test cases using GHDL and how to visualize waveforms with GTKWave.

```bash
# Example command for running GHDL
ghdl -a your_test_bench.vhd
ghdl -e your_test_bench
ghdl -r your_test_bench --wave=wave.ghw
```

```bash
# Example command for GTKWave
gtkwave wave.ghw
```

## Project Structure


```
├── src/                    # VHDL source files
│   ├── module1.vhd
│   ├── module2.vhd
│   └── ...
├── test/                   # Testbench files
│   ├── testbench1.vhd
│   ├── testbench2.vhd
│   └── ...
└── README.md               # Project documentation
```
