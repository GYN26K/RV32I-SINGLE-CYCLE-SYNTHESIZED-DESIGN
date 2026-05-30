# RV32I Single-Cycle Synthesized Design

## Overview

This project implements a 32-bit Single-Cycle RISC-V (RV32I) Processor in Verilog HDL and demonstrates a complete front-end ASIC flow including RTL design, functional verification, synthesis, and post-synthesis validation.

The processor supports core RV32I instructions and includes major datapath and control components such as:

* Program Counter (PC)
* Instruction Decoder
* Control Unit
* Register File
* Immediate Extender
* ALU Control Unit
* Arithmetic Logic Unit (ALU)
* Data Memory Interface
* PC Update Logic
* Result Selection Logic

---

## Project Objectives

* Design a functional RV32I Single-Cycle Processor.
* Verify RTL functionality using simulation.
* Synthesize the design using Cadence Genus.
* Perform post-synthesis gate-level simulation.
* Compare RTL and synthesized results to verify functional equivalence.
* Prepare the design for further physical implementation using Cadence Innovus.

---

## Design Modification for Synthesis

Initially, the processor used an internal instruction memory module.

For synthesis, the instruction memory was removed and the instruction bus was exposed as an external input:

```verilog
input [31:0] instr;
```

This modification prevents excessive constant propagation and optimization by the synthesis tool, allowing the processor datapath and control logic to be synthesized and analyzed realistically.

---

## Verification Flow

### 1. RTL Simulation

The RTL design was simulated using a custom testbench.

Sample instructions verified:

* NOP
* ADDI
* ADD

Simulation confirmed:

* Correct PC progression
* Correct ALU operation
* Correct register write-back behavior

---

### 2. Synthesis

The design was synthesized using Cadence Genus with a 90nm standard cell library.

Technology Library:

* typical.lib

Synthesis generated:

* Gate-level netlist
* Area reports
* Timing reports

---

### 3. Post-Synthesis Gate-Level Simulation

The synthesized netlist was simulated using the corresponding standard-cell Verilog models.

The gate-level simulation outputs were compared against RTL simulation outputs.

Result:

* RTL outputs matched synthesized outputs.
* Functional equivalence between RTL and synthesized netlist was verified.

---

## Directory Structure

```text
RV32I-SINGLE-CYCLE-SYNTHESIZED-DESIGN/
│
├── source_files/
│   ├── alu.v
│   ├── alu_control.v
│   ├── control_unit.v
│   ├── data_memory.v
│   ├── immediate_extender.v
│   ├── instr_decoder.v
│   ├── mux_for_alu.v
│   ├── mux_for_pc.v
│   ├── mux_for_result.v
│   ├── pcadder.v
│   ├── pctarget.v
│   ├── program_counter.v
│   ├── register_file.v
│   └── top_module.v
│
├── testbench/
│   └── tb.v
│
├── scripts/
│   └── genus.tcl
│
├── reports/
│   ├── area_report.rpt
│   ├── timing_report.rpt
│   └── simulation_comparison.txt
│
└── README.md
```

---

## Tools Used

* Verilog HDL
* Cadence Genus
* Icarus Verilog (iverilog)
* GTKWave (optional)

---

## Author

Yashmith Gali

B.Tech Electronics and Communication Engineering

Indian Institute of Technology Bhubaneswar
