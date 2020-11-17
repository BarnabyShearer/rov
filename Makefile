all: BOM.txt rov.stl rov001.png rov002.png rov003.png

BOM.txt: main.echo
	sort <"$<" | uniq -c | sed 's/ECHO: //g' > "$@"

main.echo: main.scad *.scad
	openscad "$<" -o "$@"

rov.stl: main.scad *.scad
	openscad -D show_tether=false "$<" -o "$@"

rov001.png: main.scad *.scad
	openscad --imgsize=1024,1024 --camera 500,500,700,0,0,130 "$<" -o "$@"

rov002.png: main.scad *.scad
	openscad -D show_pipe=false --imgsize=1024,1024 --camera 500,500,700,0,0,130 "$<" -o "$@"

rov003.png: main.scad *.scad
	openscad -D show_pipe=false --imgsize=1024,1024 --camera 500,500,-500,0,0,130 "$<" -o "$@"

