//.chart.libpath: "/" sv (getenv `QHOME;"ext";"chart");
.chart.libpath: first system"pwd";
.chart.template: {hsym `$"/" sv (.chart.libpath;"template";string ` sv (x;`html))};
.chart.tempfile: {hsym `$"/" sv (.chart.libpath;"tmp";string ` sv (`$-3_(string .z.Z) except ".:";`html))};
.chart.launch: (("m";"w")!("open ";"start "))[first string .z.o];

.j.p: {`$enlist each "\n" vs ssr[;;{"\n",x}] over (except[x;"\""];"[[]";"[]]")};

.nv.t1: {x: 0!x; .j.j {`key`values!(y;`x`y xcol (x,'y)#z)}[;;x]/:[c[0];1_c:cols x]};
.nv.t2: {.j.j {`key`values!(y;?[x; enlist(=;`sym;enlist y);0b;(`x`y!2#(cols x)except `sym)])}[x] each exec distinct sym from x};
//.nv.t3: {.j.j enlist`key`values!((cols x)1;`x`y xcol 0!x)}
//just remove sym columns since it does not plot properly in parallel graph
//.nv.t3: {.j.j #[;x] exec c from (meta x) where t<>"s"};

plot:{[template; fn; data]
	json: fn data;
	tempfile: .chart.tempfile[];
	tempfile 0: {ssr[y; "{{data}}"; x]}[json] each read0 .chart.template template;
	system .chart.launch, 1_string tempfile;
	.j.p json};

points: plot[`nvscatter; .nv.t1];
line: plot[`nvline; .nv.t1];
bar: plot[`nvbar; .nv.t1];
parallel: plot[`nvpar; .j.j];

/
//test 
t1: ([]time: 2015.04.01 + til 10; price: 10?100; r: 10?1.0)
t1: ([]time: 08:00 + til 10; price: 10?100; r: 10?1.0)
t1: ([]time: 2015.04.01 + 08:00 + 3600*til 10; price: 10?100; r: 10?1.0)
.j.p .nv.t1 1!t1
0!t1
t2: ([]time: til 10; sym: 10?`a`b; price: 10?100)
.j.p .nv.t2 1!t2
t3: ([]sym:`a`b`c`d; val:4?10)
.j.p .nv.t1 t3
t4: ([]a:10?100; b:10?1.0; c:10?1000; d:10?0.1; e:10?`a`b; f:10?100)
.j.p .nv.t3 t4

plot[`nvscatter; .nv.t1; t1]
plot[`nvscatter; .nv.t2; t2]
plot[`nvline; .nv.t2; t2]
plot[`nvbar; .nv.t1; t3]
plot[`nvpar; .j.j; t4]

points t1
line t1
bar t3
parallel t4

