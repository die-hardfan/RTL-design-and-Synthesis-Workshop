## Interesting optimizations in hardware

Multiplication (and division) by 2 or a non-negative power of 2 leads to left (or right) shift. Such shifts are just rewiring circuits and don't require any cells, hence 'abc' command gives an error.

![](images/mul2_show.png)
Circuit for multiplication by 2

![](images/mul8_show.png)
Circuit for multiplication by 8

![](images/mul8_stat_abcerror.png)
'abc' error and 'synth' statistics that prove no cells are used
