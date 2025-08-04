## Different combinational optimization techniques 

## EXAMPLE 1

The below code snippets are examples of constant propagation optimization technique. 

```
assign y = a?b:0;

assign y = a?1:b;
```

![](images/optcheck1_2.jpeg)
Expected circuits

![](images/opt_check_show_afteroptclear.png)
actual circuit for optcheck.v

![](images/opt_check2_show.png)
Actual circuit for optcheck2.v


## EXMAPLE 2

The below code snippet is an example of boolean optimization techniques.

```
assign y = a?(c?b:0):0;
```

![](images/optcheck3.jpeg)
Expected circuit for optcheck3.v

![](images/opt_check3_sho.png)
Actual circuit for optcheck3.v


## EXAMPLE 3

The below code snippet is an example of boolean optimization techniques.

```
 assign y = a?(b?(a & c ):c):(!c);
```

![](images/optcheck3.jpeg)
Expected circuit for optcheck4.v

![](images/opt_check4_show_afterabc_optclean.png)
Actual circuit for optcheck4.v

