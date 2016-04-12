system "rm -rf ", .qchart.libpath, "/output";	//clear previous output file
.qchart.read_template: {read0 hsym `$"/" sv (.qchart.libpath; "template"; string ` sv (x;`html))};
.qchart.generate_tempfile: {hsym `$"/" sv (.qchart.libpath; "output"; string ` sv (`$-3_(string .z.Z) except ".:";`html))};
.qchart.generate_tempfile: {`$"/" sv (.qchart.libpath; "output"; string ` sv (`$-3_(string .z.Z) except ".:";`html))};

.qchart.render: {[template; data] .qchart.render_json[template; .j.j data]}
.qchart.render_json: {[template; json] outfile: .qchart.generate_tempfile[]; (hsym outfile) 0: {ssr[y; "{{data}}"; x]}[json] each .qchart.read_template[template]; outfile}


.qchart.launch_command: (("m";"l"; "w")!("open "; "open"; "start "))[first string .z.o]
.qchart.launch: {system cmd: (.qchart.launch_command, string x); cmd};

/pretty print json
.j.pp: {`$enlist each "\n" vs ssr[;;{"\n",x}] over (except[x;"\""];"[[]";"[]]")};

.nv.t1: {x: 0!x; {`key`values!(y;`x`y xcol (x,'y)#z)}[;;x]/:[c[0];1_c:cols x]};
.nv.t2: {{`key`values!(y;?[x; enlist(=;`sym;enlist y);0b;(`x`y!2#(cols x)except `sym)])}[x] each exec distinct sym from x};

//.nv.t3: {.j.j enlist`key`values!((cols x)1;`x`y xcol 0!x)}
//just remove sym columns since it does not plot properly in parallel graph
//.nv.t3: {.j.j #[;x] exec c from (meta x) where t<>"s"};

//internal plot function
.qchart.plot:{[template; data] .qchart.launch .qchart.render[template; data]};

//public functions
qchart.points: {.qchart.plot[`nvscatter] .nv.t1 x};
qchart.line: {.qchart.plot[`nvline] .nv.t1 x};
qchart.lineSym: {.qchart.plot[`nvline] .nv.t2 x};
qchart.bar: {.qchart.plot[`nvbar] .nv.t1 x};
qchart.stackedbar: {.qchart.plot[`nvstackedbar] .nv.t2 x};
qchart.parallel: {.qchart.plot[`nvpar; x]};