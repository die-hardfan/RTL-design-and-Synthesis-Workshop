# DAY 1

## Aim
Familiarisation with the tool flow and commands required for the workshop.

---

## Tools used

- Iverilog (simulator)  
- GTKwave (waveform viewer)  
- Yosys (synthesizer)  

---

## Theory

### Introduction

Any design flow starts with specifications (in short *spec*) which is given by the customer. It entails the detailed functionality of what the design/module is supposed to do.

An implementation of spec is called **RTL design**. 

To check/verify whether the implementation (RTL design) adheres to given specifications, it needs to be simulated, which is done using a simulator (e.g. iVerilog).

Simulation is done by applying test vectors/stimulus to the primary inputs of the DUT (design under test) and observing its primary outputs. This requires a stimulus generator and observer, all of which together forms the **testbench**. 

A testbench has no primary inputs and outputs, since all it does is apply stimulus and observe the outputs of the DUT. 

---

### How a Simulator Works

A simulator looks for the changes in inputs; when there is a change in any of the inputs, the outputs are evaluated.

**No change in input → no change in output**, since it's not evaluated by the tool. 

The output file of a simulator is called a **Value Change Dump (.vcd)**, which refers to the fact that the tool evaluates and "dumps" the output to a file when there’s an input **value change**.

---

## Tool Flow Setup

All the tools used in this workshop have been run on **Oracle Virtual Box**. The VM image has been provided, the tool setup and further labs have been conducted individually. The following steps assume the VM has been setup and is running smoothly.

1. Open the terminal, check if git is installed using the command:

    ```bash
    git --version
    ```

2. Install git if not already, then `git clone` the repo from the website given below in the root directory (accessed using command: `sudo -i`, then enter the password):

    ```
    https://github.com/kunalg123/vsdflow
    ```

   This contains all the tools required to proceed with the workshop (iverilog, gtkwave, and yosys).

3. In the repo, click on **Code** (green button) and copy the URL.

4. Then use the `git clone` command on the terminal in the folder named `repo`:

    ```bash
    git clone <repo url> <folder name to store the files>
    ```

5. Then `git clone` another repo found in the below website:

    ```
    https://github.com/kunalg123/sky130RTLDesignAndSynthesisWorkshop
    ```

   This contains all the files required to do the labs in the workshop.

---

### The setup is now complete.

**The directories within the repo are as follows:**

- `.lib` : is the sky130 standard cell library to be used for synthesis  
- `mylib` : contains the Verilog models of the standard cells in `.lib`  
- `verilog_files` : contains all the design files and testbench used in the labs  

---

## Simulating using Iverilog

**Aim:** simulate `good_mux.v` using iverilog

- Navigate to `verilog_files` folder

- Simulate:

    ```bash
    iverilog <design file names> <tb file names>
    ```

    Example:

    ```bash
    iverilog good_mux.v tb_good_mux.v
    ```

    This creates `a.out` file. Execute it using:

    ```bash
    ./a.out
    ```

    This produces a `.vcd` file. To view it:

    ```bash
    gtkwave <vcd file name>
    ```

---

## Introduction to Synthesis using Yosys

RTL code/design is the behavioural representation of the required spec.  
What we need is hardware/circuit.  

**Synthesis** is the implementation of the RTL code as circuit/hardware where the design/code is converted to gates and connections are made accordingly.

---

**Aim:** Synthesis of `good_mux.v`

1. Invoke yosys

2. Read the `.lib` file:

    ```bash
    read_liberty -lib <path to .lib>
    ```

   This imports the standard cells from the library file.

3. Read design file:

    ```bash
    read_verilog good_mux.v
    ```

4. Synthesis:

    ```bash
    synth -top <module name of the design to be synthesized>
    ```

5. If the design contains DFFs, then:

    ```bash
    dfflibmap -liberty <dfflib file path>
    ```

   This is done to map the DFFs to the standard cells that are sometimes stored in a different file.

6. Then generate the netlist:

    ```bash
    abc -liberty <path to .lib file>
    ```

   This generates the netlist by mapping the standard cells from `.lib` file to the synthesized circuit above.

7. Write the netlist:

    ```bash
    write_verilog -noattr <netlist file name>.v
    ```

   Using the gvim text editor, we can view the netlist as a text.  
   `-noattr` is used for a simplified view of the netlist.

---

**Before mapping to the standard cells** (`abc` command)

*(illustration/step not shown here in text)*

**After mapping to the standard cells**

*(illustration/step not shown here in text)*
