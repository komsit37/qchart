\l lib/qchart/qchart.q
/ or if you use .qp (q package manager)
/.qp.require "qchart"

/examples
/time series
qchart.line ([]time: 2015.04.01 + til 10; price: 10?100)
qchart.points ([]time: 2015.04.01 + til 10; price: 10?100)
qchart.histbar ([]time: 2015.04.01 + til 10; price: 10?100)

/with sym
qchart.lineSym `time xasc ([]time: 10#2015.01.01 + til 5; sym: 10#`a`b; price: 10?100)
qchart.lineKey[; `book] `time xasc ([]time: 10#2015.01.01 + til 5; book: 10#`a`b; price: 10?100)	/if key col is not sym
qchart.stackedbar `time xasc ([]time: 10#2015.01.01 + til 5; sym: 10#`a`b; price: 10?100)

/category
qchart.bar ([]sym:`a`b`c`d; val:4?10)
qchart.pie ([]sym:`a`b`c`d; val:4?10)
qchart.hbar ([]sym:`a`b`c`d; val:4?10)

qchart.parallel ([]a:10?100; b:10?1.0; c:10?1000; d:10?0.1; e:10?`a`b; f:10?100)	/co

/
//test 
t1: ([]time: 2015.04.01 + til 10; price: 10?100)
t1: ([]time: 2015.04.01 + til 10; price: 10?100; r: 10?1.0)
t1: ([]time: 08:00 + til 10; price: 10?100; r: 10?1.0)
t1: ([]time: 2015.04.01 + 08:00 + 3600*til 10; price: 10?100; r: 10?1.0)
.j.p .nv.t1 1!t1
0!t1
t2: ([]time: til 10; sym: 10?`a`b; price: 10?100)
t2: ([]time: til 10; book: 10?`a`b; price: 10?100)
.j.p .nv.t2 1!t2
t3: ([]sym:`a`b`c`d; val:4?10)
.j.p .nv.t1 t3
t4: ([]a:10?100; b:10?1.0; c:10?1000; d:10?0.1; e:10?`a`b; f:10?100)
t5: ([]time: 10?`x`y`z`k`j; sym: 10?`a`b; price: 10?100)
.j.p .nv.t3 t4

.qchart.plot[`nvscatter; .nv.t1 t1]
.qchart.plot[`nvscatter; .nv.t2 t2]
.qchart.plot[`nvline; .nv.t2 t2]
.qchart.plot[`nvbar; .nv.t1 t3]
.qchart.plot[`nvpar; t4]
.qchart.plot[`nvpie; `x`y xcol 0!t3]
.qchart.plot[`nvhbar; .nv.t1 t3]
.qchart.plot[`nvhistbar; .nv.t1 t1]

