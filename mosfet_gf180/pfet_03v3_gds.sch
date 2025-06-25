v {xschem version=3.4.7 file_version=1.2}
G {}
K {}
V {}
S {}
E {}
B 2 490 -650 1080 -190 {flags=graph
y1=0
y2=2.5e-05
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
N 190 -310 190 -240 {lab=#net1}
N 190 -340 320 -340 {lab=B}
N 110 -360 110 -340 {lab=G}
N 320 -360 320 -340 {lab=B}
N 190 -240 280 -240 {lab=#net1}
N 410 -360 410 -240 {lab=D}
N 340 -240 410 -240 {lab=D}
N 110 -440 110 -420 {lab=#net2}
N 410 -440 410 -420 {lab=#net2}
N 320 -440 320 -420 {lab=#net2}
N 190 -440 190 -370 {lab=#net2}
N 110 -340 150 -340 {lab=G}
N 110 -440 410 -440 {lab=#net2}
N 50 -440 50 -300 {lab=#net2}
N 50 -440 110 -440 {lab=#net2}
C {devices/title.sym} 160 -30 0 0 {name=l1 author="Akira Tsuchiya"}
C {devices/code_shown.sym} 10 -150 0 0 {name=MODELS only_toplevel=true
format="tcleval( @value )"
value="
.include /foss/pdks/gf180mcuD/libs.tech/ngspice/design.ngspice
.lib /foss/pdks/gf180mcuD/libs.tech/ngspice/sm141064.ngspice typical
"}
C {devices/code_shown.sym} 20 -790 0 0 {name=NGSPICE only_toplevel=true
value="
.option savecurrent
.control
save all
save @m.xm1.m0[gds]

* gds-VGS
dc VGS 0 3.3 0.01
write pfet_03v3_gds_idvgs.raw

* gds-VDS
dc VDS 0 3.3 0.01
plot 1/@m.xm1.m0[gds]
write pfet_03v3_gds_idvds.raw
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
C {devices/gnd.sym} 50 -220 0 0 {name=l2 lab=GND}
C {devices/vsource.sym} 320 -390 0 0 {name=VBS value=0 savecurrent=false}
C {devices/vsource.sym} 110 -390 0 0 {name=VGS value=1.5 savecurrent=false}
C {devices/vsource.sym} 410 -390 0 0 {name=VDS value=1.5 savecurrent=false}
C {devices/lab_pin.sym} 110 -340 0 0 {name=p1 sig_type=std_logic lab=G}
C {devices/lab_pin.sym} 410 -240 2 0 {name=p2 sig_type=std_logic lab=D}
C {devices/lab_pin.sym} 320 -340 2 0 {name=p3 sig_type=std_logic lab=B}
C {devices/ammeter.sym} 310 -240 3 0 {name=Vid savecurrent=true spice_ignore=0}
C {symbols/pfet_03v3.sym} 170 -340 0 0 {name=M1
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
model=pfet_03v3
spiceprefix=X
}
C {devices/vsource.sym} 50 -270 2 0 {name=VDD value=3.3 savecurrent=false}
