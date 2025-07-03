v {xschem version=3.4.7 file_version=1.2}
G {}
K {}
V {}
S {}
E {}
N 460 -540 460 -520 {lab=VDD}
N 50 -360 50 -320 {lab=VDD}
N 460 -240 460 -220 {lab=GND}
N 250 -260 250 -240 {lab=com}
N 250 -370 310 -370 {lab=inp}
N 350 -340 350 -320 {lab=#net1}
N 350 -320 570 -320 {lab=#net1}
N 570 -340 570 -320 {lab=#net1}
N 460 -320 460 -300 {lab=#net1}
N 350 -370 370 -370 {lab=#net1}
N 370 -370 370 -330 {lab=#net1}
N 350 -330 370 -330 {lab=#net1}
N 550 -370 570 -370 {lab=#net1}
N 550 -370 550 -330 {lab=#net1}
N 550 -330 570 -330 {lab=#net1}
N 350 -520 350 -500 {lab=VDD}
N 350 -520 570 -520 {lab=VDD}
N 570 -520 570 -500 {lab=VDD}
N 570 -440 570 -400 {lab=outn}
N 350 -440 350 -400 {lab=outp}
N 50 -260 50 -220 {lab=GND}
N 130 -260 130 -220 {lab=GND}
N 130 -360 130 -320 {lab=com}
N 250 -370 250 -320 {lab=inp}
N 310 -420 350 -420 {lab=outp}
N 570 -420 610 -420 {lab=outn}
N 690 -260 690 -240 {lab=com}
N 690 -370 690 -320 {lab=#net2}
N 630 -310 650 -310 {lab=inp}
N 630 -270 650 -270 {lab=com}
N 630 -270 630 -250 {lab=com}
N 630 -250 690 -250 {lab=com}
N 610 -370 690 -370 {lab=#net2}
C {devices/title.sym} 160 -30 0 0 {name=l1 author="Akira Tsuchiya"}
C {symbols/nfet_03v3.sym} 330 -370 0 0 {name=M1
L=0.28u
W=11.2u
nf=1
mult=1
ad="'int((nf+1)/2) * W/nf * 0.18u'"
pd="'2*int((nf+1)/2) * (W/nf + 0.18u)'"
as="'int((nf+2)/2) * W/nf * 0.18u'"
ps="'2*int((nf+2)/2) * (W/nf + 0.18u)'"
nrd="'0.18u / W'" nrs="'0.18u / W'"
sa=0 sb=0 sd=0
model=nfet_03v3
spiceprefix=X
}
C {devices/gnd.sym} 460 -220 0 0 {name=l2 lab=GND}
C {devices/code_shown.sym} 10 -590 0 0 {name=NGSPICE only_toplevel=true
format="tcleval( @value )"
value="
.option savecurrent
.control
save all

dc Vdiff -1.65 1.65 0.01
plot V(outp) V(outn)
.endc
"}
C {devices/code_shown.sym} 10 -140 0 0 {name=MODELS only_toplevel=true
format="tcleval( @value )"
value="
.include $::180MCU_MODELS/design.ngspice
.lib $::180MCU_MODELS/sm141064.ngspice typical
"}
C {vdd.sym} 460 -540 0 0 {name=l3 lab=VDD}
C {devices/vsource.sym} 50 -290 0 0 {name=VDD value=3.3 savecurrent=false}
C {devices/gnd.sym} 50 -220 0 0 {name=l4 lab=GND}
C {vdd.sym} 50 -360 0 0 {name=l5 lab=VDD}
C {symbols/nfet_03v3.sym} 590 -370 0 1 {name=M2
L=0.28u
W=11.2u
nf=1
mult=1
ad="'int((nf+1)/2) * W/nf * 0.18u'"
pd="'2*int((nf+1)/2) * (W/nf + 0.18u)'"
as="'int((nf+2)/2) * W/nf * 0.18u'"
ps="'2*int((nf+2)/2) * (W/nf + 0.18u)'"
nrd="'0.18u / W'" nrs="'0.18u / W'"
sa=0 sb=0 sd=0
model=nfet_03v3
spiceprefix=X
}
C {isource.sym} 460 -270 0 0 {name=Itail value=1m}
C {devices/vsource.sym} 250 -290 0 0 {name=Vdiff value=0 savecurrent=false}
C {res.sym} 350 -470 0 0 {name=R1
value=2k
footprint=1206
device=resistor
m=1}
C {res.sym} 570 -470 0 0 {name=R2
value=2k
footprint=1206
device=resistor
m=1}
C {devices/vsource.sym} 130 -290 0 0 {name=Vcom value=1.65 savecurrent=false}
C {devices/gnd.sym} 130 -220 0 0 {name=l7 lab=GND}
C {lab_pin.sym} 130 -360 0 0 {name=p1 sig_type=std_logic lab=com}
C {lab_pin.sym} 250 -240 0 1 {name=p2 sig_type=std_logic lab=com}
C {lab_pin.sym} 610 -420 0 1 {name=p3 sig_type=std_logic lab=outn}
C {lab_pin.sym} 310 -420 0 0 {name=p4 sig_type=std_logic lab=outp}
C {vcvs.sym} 690 -290 0 0 {name=E1 value=-1}
C {lab_pin.sym} 690 -240 0 1 {name=p5 sig_type=std_logic lab=com}
C {lab_pin.sym} 250 -370 0 0 {name=p6 sig_type=std_logic lab=inp}
C {lab_pin.sym} 630 -310 0 0 {name=p7 sig_type=std_logic lab=inp}
