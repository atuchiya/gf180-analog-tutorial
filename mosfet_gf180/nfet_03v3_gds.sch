v {xschem version=3.4.7 file_version=1.2}
G {}
K {}
V {}
S {}
E {}
B 2 490 -650 1080 -190 {flags=graph
y1=2.5e-06
y2=9.3e-05
ypos1=0
ypos2=2
divy=5
subdivy=1
unity=u
x1=0
x2=3.3
divx=5
subdivx=1
node=@m.xm1.m0[gds]
color=4

unitx=1
dataset=-1}
T {Select by Ctrl+left-click} 480 -820 0 0 0.4 0.4 {layer=1}
N 50 -240 50 -220 {lab=GND}
N 320 -240 410 -240 {lab=GND}
N 410 -260 410 -240 {lab=GND}
N 320 -260 320 -240 {lab=GND}
N 190 -310 190 -240 {lab=GND}
N 190 -340 320 -340 {lab=B}
N 320 -340 320 -320 {lab=B}
N 50 -340 150 -340 {lab=G}
N 50 -340 50 -320 {lab=G}
N 190 -420 280 -420 {lab=#net1}
N 190 -420 190 -370 {lab=#net1}
N 410 -420 410 -320 {lab=D}
N 340 -420 410 -420 {lab=D}
N 50 -260 50 -240 {lab=GND}
N 190 -240 320 -240 {lab=GND}
N 50 -240 190 -240 {lab=GND}
C {devices/title.sym} 160 -30 0 0 {name=l1 author="Akira Tsuchiya"}
C {symbols/nfet_03v3.sym} 170 -340 0 0 {name=M1
L=0.28u
W=0.22u
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
C {devices/gnd.sym} 50 -220 0 0 {name=l2 lab=GND}
C {devices/vsource.sym} 320 -290 0 0 {name=VBS value=0 savecurrent=false}
C {devices/vsource.sym} 50 -290 0 0 {name=VGS value=1.5 savecurrent=false}
C {devices/vsource.sym} 410 -290 0 0 {name=VDS value=1.5 savecurrent=false}
C {devices/lab_pin.sym} 50 -340 0 0 {name=p1 sig_type=std_logic lab=G}
C {devices/lab_pin.sym} 410 -420 2 0 {name=p2 sig_type=std_logic lab=D}
C {devices/lab_pin.sym} 320 -340 2 0 {name=p3 sig_type=std_logic lab=B}
C {devices/ammeter.sym} 310 -420 1 0 {name=Vid savecurrent=true spice_ignore=0}
C {devices/code_shown.sym} 20 -790 0 0 {name=NGSPICE only_toplevel=true
value="
.option savecurrent
.control
save all
save @m.xm1.m0[gds]

* gds-VGS
dc VGS 0 3.3 0.01
write nfet_03v3_gds_idvgs.raw

* gds-VDS
dc VDS 0 3.3 0.01
plot 1/@m.xm1.m0[gds]
write nfet_03v3_gds_idvds.raw
.endc
"}
C {devices/launcher.sym} 545 -765 0 0 {name=h1
descr="gds-VGS curve"
tclcommand="
xschem raw_read $netlist_dir/[file tail [file rootname [xschem get current_name]]]_idvgs.raw
"
}
C {devices/launcher.sym} 545 -725 0 0 {name=h2
descr="gds-VDS curve"
tclcommand="
xschem raw_read $netlist_dir/[file tail [file rootname [xschem get current_name]]]_idvds.raw
"
}
C {devices/code_shown.sym} 10 -140 0 0 {name=MODELS only_toplevel=true
format="tcleval( @value )"
value="
.include $::180MCU_MODELS/design.ngspice
.lib $::180MCU_MODELS/sm141064.ngspice typical
"}
