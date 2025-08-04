## Commands in Yosys to get the most optimized circuit through synthesis
```bash
1. read_liberty -lib <path to .lib file>
2. read_verilog multiple_module_opt.v
3. flatten  #this must be done before synthesis to get the most optimized circuit later
4. synth -top multiple_module_opt
5. opt_clean -purge
6. abc -liberty <path to .lib file>
```
