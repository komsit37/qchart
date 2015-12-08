#qchart
plot data directly from kdb (using javascript). Works well with sublime-q.
It transform your data into json and render it into html/javascript template.
![alt text](https://raw.github.com/komsit37/qchart/master/resources/preview.png "Screenshot")

#Install
### By [qpm!](https://github.com/yang-guo/qp)
```
qpm.q install https://github.com/komsit37/qchart.git
```
###Or Manually
I recommend install it to your QHOME/lib (if not you'll need to change .chart.libpath to your installation). You can install it anywhere but I use ~/q/lib as example - change it to c:/q/lib for windows)
```
cd ~/q/lib
git clone https://github.com/komsit37/qchart.git
vim qchart/index.q
//uncomment this line
.chart.libpath: "/" sv (getenv `QHOME;"lib";"chart");
//and comment this out (this only works if qpm.q is used)
/.chart.libpath: first system"pwd";
```

#Usage
```
.qp.require "qchart"
line ([]time: 2015.04.01 + til 10; price: 10?100)
points ([]time: 2015.04.01 + til 10; price: 10?100)
bar ([]sym:`a`b`c`d; val:4?10)
parallel ([]a:10?100; b:10?1.0; c:10?1000; d:10?0.1; e:10?`a`b; f:10?100)
```

#Todo
more charts
better API
