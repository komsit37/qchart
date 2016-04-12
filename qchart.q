/entry point if loaded using 
/\l lib/qchart/qchart.q

.qchart.libpath: {
	qhome: getenv `QHOME;
	default: ((`w`o`l)!("c:/q";"~/q";"~/q")) `$1#string .z.o;
	qhome: $[null `$qhome; default; qhome];
	"/" sv (qhome;"lib";"qchart")
	}[];
system "l ", "/" sv (.qchart.libpath; "init.q")
