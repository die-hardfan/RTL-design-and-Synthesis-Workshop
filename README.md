## RTL-design-and-Synthesis-Workshop
Workshop documentation 

## Overview:

The semiconductor industry is undergoing a major shift towards open-source toolchains and PDKs like SKY130 for chip prototyping and tapeout.
This workshop empowers one to master Register Transfer Level (RTL) design, simulation, and synthesis using industry-aligned open-source tools.
In short, this workshop intends to teach the Verilog coding guidelines that result in predictable logic in Silicon.

Over 10 days, I have:
Learnt Verilog RTL from scratch
Simulated designs using Iverilog and GTKWave
Performed logic synthesis with Yosys
Understood how RTL gets mapped to logic gates in real silicon
Gained exposure to ASIC design flows using the SKY130 PDK

## Modulewise Content
Module 1: Intro to Verilog and HDL simulation with iverilog and GTKWave
Module 2: RTL coding styles, module design, and simulation debugging
Module 3: RTL design labs and testbenches for digital blocks
Module 4: Introduction to Yosys and Synthesis Concepts
Module 5: RTL to gate-level netlist using Yosys with SKY130 standard cells


** NOTE: Image names
.._stat --> screenshot of the statistics that's printed after 'synth' command in yosys
.._abcstat --> screenshot of the statistics that's printed after 'abc' command in yosys
.._flatbefsynth_.. --> the circuit has been flattened before 'synth' command 
.._gls --> screenshot of the gate level simulation result
.._show --> screenshot of the schematic when 'show' command is used in yosys
.._sim --> screenshot of the rtl code simulation result
.._net --> netlist file
.._show_flat_optclean --> screenshot of the schematic after 'synth' command, following 'flatten' and 'opt_clean -purge' command in yosys
.._show_optclean_flat --> first 'optclean' command executed then 'flatten' command
..stat1 and ..stat2 --> statistics content spread out in two screenshots
.._zoom --> screenshot of waveform that shows an interesting area/ place to be focused
.._zoom1 --> zoomed in screenshot of another area on the waveform that needs to be focused upon
.._abcerror --> the error msg when 'abc' command is executed but there's nothing to map (no cells in the circuit)
.._stat_abcerror --> screenshot of both statistics and 'abc' command's error message
.._before_... --> the screenshot before some command has been executed
.._after_... --> the screenshot after some command has been executed
.._dfflibstat --> the screenshot showing how many DFFs have been mapped, it is printed after the 'dfflibmap' command is executed


