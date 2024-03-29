TOP?=top
# DESIGN Modules .v que hacen parte del proyecto
DESIGN?=./top.v
#test bench del proyecto para la simulación
tb?=$(TOP)_tb.v
# Ruta donde está quartus instalado
PATH_QUARTUS?=/home/alejandro/intelFPGA_lite/22.1std/quartus/bin
# MORE_SRC2SIM permite agregar más archivos fuentes para la simulación
MORE_SRC2SIM?=
# Cable programador
CABLE?=USB-Blaster

B=build

help-quartus:
	@echo "\n## SINTESIS Y CONFIGURACIÓN ##"
	@echo "\tmake syn\t-> Sintetizar diseño"
	@echo "\tmake config\t-> Configurar fpga"

init: init-qsf syn-quartus

syn: syn-quartus

report-syn: report-syn-quartus

config: config-fpga-quartus

clean: clean-sim clean-syn-quartus clean-sim


rtl: rtl-from-json view-svg

sim: clean-sim iverilog-compile vpp-simulate wave

# Aplicación de síntesis
CC=$(PATH_QUARTUS)/quartus_sh

# Aplicación para la programación
PGM=$(PATH_QUARTUS)/quartus_pgm

# Indice de dispositivos (FPGA) encontrados
INDEX_DEV=1

## INICIO DE COMANDOS ##

# Flujo de compilación: 
syn-quartus:
	@echo "Flujo de síntesis"
	$(CC) --flow compile $(TOP)
	@cat $B/$(TOP).fit.summary

report-syn-quartus:
	cat $B/top.sta.rpt

# Configurar la FPGA con el bitsream
config-fpga-quartus:
	@echo "Iniciar programación de FPGA"
	$(PGM) -m JTAG -o "P;$B/$(TOP).sof@$(INDEX_DEV)"

# Listar un cable programador
cable-list-quartus:
	@echo "Detectar cable"
	$(PGM) -l

# Detectar una fpga
fpga-detect-quartus:
	@echo "Detectar fpga"
	$(PGM) -c $(CABLE) -a

# Ayuda sobre comandos de ejemplo
syn-quartus-help:
	$(CC) --help=flow

# EMPAQUETAR PROYECTO EN .ZIP
Z?=prj
zip:
	$(RM) $Z $Z.zip
	mkdir -p $Z
	head -n -3 Makefile > $Z/Makefile
	sed -n '8,$$p' $(MK_SYN) >> $Z/Makefile
	sed -n '7,$$p' $(MK_SIM) >> $Z/Makefile
	cp -var *.v *.md *.txt *.qsf *.qpf *.png .gitignore $Z
ifneq ($(wildcard *.mem),) # Si existe un archivo .png
	cp -var *.mem $Z
endif
ifneq ($(wildcard *.hex),) # Si existe un archivo .png
	cp -var *.hex $Z
endif
ifneq ($(wildcard *.gtkw),) # Si existe un archivo .txt
	cp -var *.gtkw $Z
endif
	zip -r $Z.zip $Z

init-qsf:
	@echo "build/\nsim/\ndb/\nincremental_db/\n*.log\n$Z/\n" > .gitignore
	@echo "\n### ¡ATENCIÓN! ###"
	@echo "\nMODIFIQUE EL ARCHIVO top.qsf CON LA SIGUIENTE INFORMACIÓN:"
	@cat ./config.txt
	@echo "## END\n"

RM=rm -rf
clean-syn-quartus:
	$(RM) db incremental_db $B

clean-zip:
	$(RM) $Z
S=sim

help-sim:
	@echo "\n## SIMULACIÓN Y RTL##"
	@echo "\tmake rtl \t-> Crear el RTL desde el TOP"
	@echo "\tmake sim \t-> Simular diseño"
	@echo "\tmake wave \t-> Ver simulación en gtkwave"
	@echo "\nEjemplos de simulaciones con más argumentos:"
	@echo "\tmake sim VVP_ARG=+inputs=5\t\t:Agregar un argumento a la simulación"
	@echo "\tmake sim VVP_ARG=+a=5\ +b=6\t\t:Agregar varios argumentos a la simulación"
	@echo "\tmake sim VVP_ARG+=+a=5 VVP_ARG+=+b=6\t:Agregar varios argumentos a la simulación"
	@echo "\tmake rtl TOP=modulo1\t\t\t:Obtiene el RTL de otros modulos (submodulos)"
	@echo "\tmake rtl rtl2png\t\t\t:Convertir el RTL del TOP desde formato svg a png"
	@echo "\tmake rtl rtl2png TOP=modulo1\t\t:Además de convertir, obtiene el RTL de otros modulos (submodulos)"
	@echo "\tmake convertOneVerilogFile\t\t\t:Crear un único verilog del diseño"



iverilog-compile:
	mkdir -p $S
ifneq ($(MORE_SRC2SIM), )
	cp -var $(MORE_SRC2SIM) $S
endif
	iverilog -o $S/$(TOP).vvp $(tb) $(DESIGN)

# VVP_ARG permite agregar argumentos en la simulación con vvp
VVP_ARG=
vpp-simulate:
	cd $S && vvp $(TOP).vvp -vcd $(VVP_ARG)

wave:
	@gtkwave $S/top.vcd	top.gtkw || (echo "No hay un forma de onda que motrar en gtkwave, posiblemente no fue solicitada en la simulación")

json-yosys:
	mkdir -p $S
	yosys -p 'read_verilog $(DESIGN); prep -top $(TOP); hierarchy -check; proc; write_json $S/$(TOP).json'

# COnertir el diseño en un solo archivo de verilog
convertOneVerilogFile:
	mkdir -p $S
	yosys -p 'read_verilog $(DESIGN); prep -top $(TOP); hierarchy -check; proc; opt -full; write_verilog -noattr -nodec $S/$(TOP).v'
	# yosys -p 'read_verilog $(DESIGN); prep -top $(TOP); hierarchy -check; proc; opt -full; write_verilog -noattr -noexpr -nodec $S/$(TOP).v'
	# yosys -p 'read_verilog $(DESIGN); prep -top $(TOP); hierarchy -check; proc; flatten; synth; write_verilog -noattr -noexpr $S/$(TOP).v'

rtl-from-json: json-yosys
	netlistsvg $S/$(TOP).json -o $S/$(TOP).svg

view-svg:
	eog $S/$(TOP).svg

rtl-xdot:
	yosys -p $(RTL_COMMAND)

rtl2png:
	convert -density 200 -resize 1200 $S/$(TOP).svg $(TOP).png
	# convert -resize 1200 -quality 100 $S/$(TOP).svg $(TOP).png

init-sim:	
	@echo "sim/\n$Z/\n" > .gitignore
	touch README.md top.png

RM=rm -rf
# EMPAQUETAR SIMULACIÓN EN .ZIP
Z?=prj
zip-sim:
	$(RM) $Z $Z.zip
	mkdir -p $Z
	# Quitar las últimas dos líneas del Makefile y crear copia en el directorio $Z
	head -n -2 Makefile > $Z/Makefile
	# Agregar desde la línea 7 en adelante en el Makefile
	sed -n '7,$$p' $(MK_SIM) >> $Z/Makefile
	cp -var *.v *.md .gitignore $Z
ifneq ($(wildcard *.mem),) # Si existe un archivo .png
	cp -var *.mem $Z
endif
ifneq ($(wildcard *.hex),) # Si existe un archivo .png
	cp -var *.hex $Z
endif
ifneq ($(wildcard *.png),) # Si existe un archivo .png
	cp -var *.png $Z
endif
ifneq ($(wildcard *.txt),) # Si existe un archivo .txt
	cp -var *.txt $Z
endif
ifneq ($(wildcard *.dig),) # Si existe un archivo .dig
	cp -var *.dig $Z
endif
	zip -r $Z.zip $Z

clean-sim:
	rm -rf $S $Z $Z.zip

