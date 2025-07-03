v {xschem version=3.4.7 file_version=1.2}
G {}
K {}
V {}
S {}
E {}
N 210 -240 210 -220 {lab=GND}
N 210 -260 210 -240 {lab=GND}
N 210 -440 210 -420 {lab=VDD}
N 50 -240 50 -220 {lab=GND}
N 50 -260 50 -240 {lab=GND}
N 50 -360 50 -320 {lab=VDD}
N 190 -290 210 -290 {lab=GND}
N 190 -290 190 -250 {lab=GND}
N 190 -250 210 -250 {lab=GND}
N 210 -230 380 -230 {lab=GND}
N 380 -260 380 -230 {lab=GND}
N 380 -290 400 -290 {lab=GND}
N 400 -290 400 -250 {lab=GND}
N 380 -250 400 -250 {lab=GND}
N 250 -290 340 -290 {lab=#net1}
N 380 -360 380 -320 {lab=#net2}
N 210 -360 210 -320 {lab=#net1}
N 210 -340 270 -340 {lab=#net1}
N 270 -340 270 -290 {lab=#net1}
N 530 -260 530 -230 {lab=GND}
N 380 -230 530 -230 {lab=GND}
N 530 -450 530 -320 {lab=#net3}
N 380 -450 530 -450 {lab=#net3}
N 380 -450 380 -420 {lab=#net3}
C {devices/title.sym} 160 -30 0 0 {name=l1 author="Akira Tsuchiya"}
C {symbols/nfet_03v3.sym} 230 -290 0 1 {name=M1
L=0.28u
W=5.6u
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
C {devices/gnd.sym} 210 -220 0 0 {name=l2 lab=GND}
C {devices/vsource.sym} 530 -290 0 0 {name=VOUT value=1.65 savecurrent=false}
C {devices/ammeter.sym} 380 -390 0 0 {name=Viout savecurrent=true spice_ignore=0}
C {devices/code_shown.sym} 10 -650 0 0 {name=NGSPICE only_toplevel=true
format="tcleval( @value )"
value="
.option savecurrent
.control
save all

dc Iin 0 1m 0.01m
plot i(Viout)
.endc
"}
C {devices/code_shown.sym} 10 -140 0 0 {name=MODELS only_toplevel=true
format="tcleval( @value )"
value="
.include $::180MCU_MODELS/design.ngspice
.lib $::180MCU_MODELS/sm141064.ngspice typical
"}
C {vdd.sym} 210 -440 0 0 {name=l3 lab=VDD}
C {devices/vsource.sym} 50 -290 0 0 {name=VDD value=3.3 savecurrent=false}
C {devices/gnd.sym} 50 -220 0 0 {name=l4 lab=GND}
C {vdd.sym} 50 -360 0 0 {name=l5 lab=VDD}
C {symbols/nfet_03v3.sym} 360 -290 0 0 {name=M2
L=0.28u
W=5.6u
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
C {isource.sym} 210 -390 0 0 {name=Iin value=1m}
