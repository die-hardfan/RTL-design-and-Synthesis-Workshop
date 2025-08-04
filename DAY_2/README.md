# DAY 2

## Aim

- Learn more about `.lib` file and PVT conditions  
- Hierarchical vs Flat synthesis  
- Labs on various DFF versions  
- Interesting optimizations in hardware  

---

## FRONT END LIBRARY (.lib) FILE

**Name:** `sky130_fd_sc_hd__tt_025C_1v80.lib`

This library contains 130nm (smallest feature size, or commonly called tech/process node) standard cells that have typical (`tt`) speed (due to process variation), work at 25°C at a voltage level of 1.80 volts.

PVT are the 3 important conditions that need to be met for the synthesized design/circuitry on chip/silicon to work.

Each time a design is fabricated, the result will vary based on the equipment used, ambient changes etc — **process variations**.

Similarly, variations in **voltage** (supply is not perfectly ideal, so glitches are possible) and **temperature** (from exposure to real-world conditions) can cause variations in the fabricated design, causing it to deviate from behavior observed during simulation.

All these changes must be accommodated during simulation and compensated for, else the reliability of the fabricated chip will suffer.

> **KEY:** The functionality of the design must be maintained across PVT variations to produce a reliable and robust product.

In a `.lib` file, all such information about the standard cells in general and specific to certain logic modules are given. Within the definition of a cell, input-combination-specific leakage power, cell area, pin-specific capacitance, power, timing, etc., are noted.

There are different **flavours** of the same logic cell (e.g. AND gate with different number of inputs, varying area, power, etc).

> In short, a library file is rich in different logic cells and its variants for better optimization of the circuit.

---

## HIERARCHICAL VS FLAT SYNTHESIS

- **Hierarchical synthesis** retains the submodules used within the main module after synthesis.  
- **Flat synthesis** creates one module with logic of submodules combined.  

> Optimization of multimodule designs fare better when the design is flattened.

### Relevant commands:

```bash
synth -top <module_name>         # Hierarchical
synth -flatten                   # Flat (auto-selects top module)
```
All relevant files (inputs and outputs) are given above.

## SUBMODULE LEVEL SYNTHESIS

Command:
```bash
synth -top <sub_module_name>
```
**Why?**
1.	When a design has multiple instances of the same submodule, it can be synthesized once and the netlist replicated in the final design. This saves time, specially if the submodule is complex/large.
2.	In massive designs, divide and conquer approach is applied. A large design is subdivided into smaller ones, and each is synthesized individually (perhaps in parallel to save time). The tool gives the most optimized version for each submodule, hence the overall design is more optimized. 

## FLIP FLOPS AND TYPES
**What?**
Storage elements that store 1 bit of data.
**Why?**
Transitions in a combinational circuit is not instantaneous, due to the delays of the gates that make it up. Hence the outputs of combinational circuits are prone to glitches (momentary wrong value due to change in the inputs, happens because these changes take time to propagate through the gates to its output). More gates means more delays, so more glitches.
Modern day chips have so many functions, each of which is ultimately a combinational circuit. If combinational circuits are cascaded, then the output will never be stable because of all the glitches. To avoid this, flip flops are used. FF shields its output from glitches in its input, so they don’t propagate from one combinational circuit to next. 
But also, having only combinational circuits means a large amount of time to evaluate the output (sum of propagation delays of gates in the path to output). To reduce the time taken, increase frequency of operation and thus increase the performance, FFs are used. This technique is commonly known as pipelining.
Typically, when a circuit is powered on, the state of FFs in unknown (or garbage). To prevent this stage from affecting the output, FFs are initialised to bit 0 or 1 using reset or set.

**Types of FFs:**
Asynchronous set/reset FF
Synchronous set/reset FF
Asynchronous and synchronous reset FF
(set and reset – if applied together causes race condition, so its not discussed here)

Asynchronous: set/reset works as soon as it is applied irrespective of the clock signal.
Synchronous: set/reset signal waits for a clock edge, for it to be applied. 

## RELEVANT LABS:
Simulate and synthesize different DFFs. 
<async reset dff pic>
<sync reset dff pic>

**Note:** In asynchronous set/reset, only when asserted, it is effective immediately. When the signal is de-asserted, the function of DFF  returns to normal only on the next clock edge, not immediately.


## INTERESTING OPTIMIZATIONS IN HARDWARE
1.	Multiply by 2
2.	Multiple by 8

Multiplication by 2 is essentially left shift by 1 position. This can be done by rewiring the inputs to outputs, hence no standard cell is required. So, the ‘abc’ command throws an error, since there is nothing to map to. 
This is application for multiplication (and division) by any non-negative power of 2. 


