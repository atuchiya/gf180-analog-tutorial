v {xschem version=3.4.7 file_version=1.2}
G {}
K {}
V {}
S {}
E {}
N 150 -240 150 -220 {lab=GND}
N 150 -260 150 -240 {lab=GND}
N 150 -240 290 -240 {lab=GND}
N 290 -580 290 -560 {lab=VDD}
N 290 -500 290 -480 {lab=#net1}
N 290 -450 310 -450 {lab=#net1}
N 310 -490 310 -450 {lab=#net1}
N 290 -490 310 -490 {lab=#net1}
N 290 -330 310 -330 {lab=GND}
N 310 -330 310 -280 {lab=GND}
N 290 -280 310 -280 {lab=GND}
N 50 -240 50 -220 {lab=GND}
N 50 -260 50 -240 {lab=GND}
N 50 -360 50 -320 {lab=VDD}
N 220 -450 250 -450 {lab=in}
N 290 -300 290 -240 {lab=GND}
N 290 -420 290 -360 {lab=out}
N 290 -390 400 -390 {lab=out}
N 220 -450 220 -330 {lab=in}
N 220 -330 250 -330 {lab=in}
N 150 -390 220 -390 {lab=in}
N 150 -390 150 -320 {lab=in}
N 400 -390 400 -340 {lab=out}
N 400 -280 400 -240 {lab=GND}
N 290 -240 400 -240 {lab=GND}
C {devices/title.sym} 160 -30 0 0 {name=l1 author="Akira Tsuchiya"}
C {symbols/nfet_03v3.sym} 270 -330 0 0 {name=M1
L=0.28u
W=0.6u
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
C {devices/gnd.sym} 150 -220 0 0 {name=l2 lab=GND}
C {devices/vsource.sym} 150 -290 0 0 {name=VIN value="DC=1.65 AC 1" savecurrent=false}
C {devices/lab_pin.sym} 400 -390 2 0 {name=p2 sig_type=std_logic lab=out}
C {devices/ammeter.sym} 290 -530 0 0 {name=Vid savecurrent=true spice_ignore=0}
C {devices/code_shown.sym} 480 -430 0 0 {name=NGSPICE only_toplevel=true
format="tcleval( @value )"
value="
.option savecurrent
.control
save all

* waveform
ac dec 20 1e6 1e10
plot Vdb(out)
plot Vp(out) * 180 / 3.14 - 180
.endc
"}
C {devices/code_shown.sym} 10 -140 0 0 {name=MODELS only_toplevel=true
format="tcleval( @value )"
value="
.include $::180MCU_MODELS/design.ngspice
.lib $::180MCU_MODELS/sm141064.ngspice typical
"}
C {symbols/pfet_03v3.sym} 270 -450 0 0 {name=M2
L=0.28u
W=1.6u
nf=1
mult=1
ad="'int((nf+1)/2) * W/nf * 0.18u'"
pd="'2*int((nf+1)/2) * (W/nf + 0.18u)'"
as="'int((nf+2)/2) * W/nf * 0.18u'"
ps="'2*int((nf+2)/2) * (W/nf + 0.18u)'"
nrd="'0.18u / W'" nrs="'0.18u / W'"
sa=0 sb=0 sd=0
model=pfet_03v3
spiceprefix=X
}
C {vdd.sym} 290 -580 0 0 {name=l3 lab=VDD}
C {devices/vsource.sym} 50 -290 0 0 {name=VDD value=3.3 savecurrent=false}
C {devices/gnd.sym} 50 -220 0 0 {name=l4 lab=GND}
C {vdd.sym} 50 -360 0 0 {name=l5 lab=VDD}
C {capa.sym} 400 -310 0 0 {name=C1
m=1
value=100f
footprint=1206
device="ceramic capacitor"}
C {devices/lab_pin.sym} 150 -390 2 1 {name=p1 sig_type=std_logic lab=in}
