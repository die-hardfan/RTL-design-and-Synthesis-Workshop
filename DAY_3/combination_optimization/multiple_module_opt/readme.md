## Design flow from simulation to synthesis to get the most optimized circuit
```bash
1. read_liberty -lib <path to .lib file>
2. read_verilog multiple_module_opt.v
3. flatten  #this must be done before synthesis to get the most optimized circuit later
4. synth -top multiple_module_opt
5. opt_clean -purge
6. abc -liberty <path to .lib file>
```

If the module is not flattened, the final circuit is not the most optimized.

The file multmodoptv2.v is the same as multiple_module_opt.v, except the submodules are removed and logic is directly defined within one module.
The synthesis of this can follow the normal procedure, and it still gives the most optimized circuit.


