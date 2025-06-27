# CMOS Analog Circuits in GF180MCU

Tutorial of CMOS Analog Circuits in GF180MCU

## Environment

Xschem files assume [IIC-OSIC-TOOLS tuned for Chipathon 2025](https://github.com/sscs-ose/sscs-chipathon-2025).
If you use [normal IIC-OSIC-TOOLS](https://github.com/iic-jku/IIC-OSIC-TOOLS), please replace the model path

```
.include $::180MCU_MODELS/design.ngspice
.lib $::180MCU_MODELS/sm141064.ngspice typical
```

to

```
.include /foss/pdks/gf180mcuD/libs.tech/ngspice/design.ngspice
.lib /foss/pdks/gf180mcuD/libs.tech/ngspice/sm141064.ngspice typical
```

## Contents
1. Learning MOSFET characteristics [[Jupyter-nodebook](https://github.com/atuchiya/gf180-analog-tutorial/blob/main/mosfet_gf180.ipynb)] | [[Xschem](https://github.com/atuchiya/gf180-analog-tutorial/tree/main/mosfet_gf180)]
2. Fifty-Nifty Variations of Two-Transistor Circuits [[Jupyter-notebook](https://github.com/atuchiya/gf180-analog-tutorial/blob/main/fifty_nifty.ipynb)] | [[Xschem](https://github.com/atuchiya/gf180-analog-tutorial/tree/main/fifty_nifty)]
