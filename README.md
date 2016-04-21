#qchart
plot data directly from kdb (using javascript). Works well with sublime-q.
It transform your data into json and render it into html/javascript template.
![alt text](https://raw.github.com/komsit37/qchart/master/resources/preview.png "Screenshot")
![alt text](https://raw.github.com/komsit37/qchart/master/resources/stackedbar.png "Stackedbar")

#Install
### By [qpm!](https://github.com/yang-guo/qp)
```bash
qpm.q install https://github.com/komsit37/qchart.git
```
###Or Manually
I recommend install it to your QHOME/lib. You can install it anywhere but I use ~/q/lib as example (change it to c:/q/lib for windows)
```bash
cd ~/q/lib
git clone https://github.com/komsit37/qchart.git
```

#Usage
All plot functions are available under `qchart` dict (note there is no namespace `.`, `.qchart` is used for internal while `qchart` is public)
check example.q
```q
\l lib/qchart/qchart.q
/ or if you use .qp (q package manager)
/.qp.require "qchart"

/time series
qchart.line ([]time: 2015.04.01 + til 10; price: 10?100)
qchart.points ([]time: 2015.04.01 + til 10; price: 10?100)

/with sym
qchart.stackedbar `time xasc ([]time: 10#2015.01.01 + til 5; sym: 10#`a`b; price: 10?100)

/category
qchart.bar ([]sym:`a`b`c`d; val:4?10)
qchart.parallel ([]a:10?100; b:10?1.0; c:10?1000; d:10?0.1; e:10?`a`b; f:10?100)

```

#Todo
more charts  
better API
