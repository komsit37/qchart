var timeReg = /^(\d\d):(\d\d):?(\d\d)?.?(\d\d\d)?/;
var datetimeReg = /^(\d\d\d\d-\d\d-\d\d)D(\d\d:\d\d:\d\d.\d+)/;
var dateReg = /^(\d\d\d\d-\d\d-\d\d)$/;

function parseTime(x, y) {
  var time = (y) ? y : new Date();
  var parts = timeReg.exec(x);
  if (!parts) return null;
  if (parts[1]) time.setHours(parseInt(parts[1]));
  if (parts[2]) time.setMinutes(parseInt(parts[2]));
  if (parts[3]) time.setSeconds(parseInt(parts[3]));
  if (parts[4]) time.setMilliseconds(parseInt(parts[4]));
  return time;
};

function parseDateTime(x) {
  var parts = datetimeReg.exec(x);
  if (!parts) return null;
  var datetime = (parts[1]) ? new Date(parts[1]) : new Date();
  if (parts[2]) datetime = parseTime(parts[2], datetime);
  return datetime;
};

function fixDate(data){
  var x0 = data[0].values[0].x;
  if (dateReg.test(x0)){
      data.forEach(function(kv){
        kv.values.forEach(function(d){
            d.x = new Date(d.x);
        })
      });
      xFormat = function(d){return d3.time.format('%d %b %y')(new Date(d))};
  };

  //todo: check data range and change format granularity accordingly
  if (timeReg.test(x0)){
    data.forEach(function(kv){
        kv.values.forEach(function(d){
            d.x = parseTime(d.x);
        })
      });
      // xFormat = function(d){return d3.time.format('%H:%M')(new Date(d))};
      xFormat = function(d){return d3.time.format('%H:%M:%S.%L')(new Date(d))};
  }

  if (datetimeReg.test(x0)){
    data.forEach(function(kv){
        kv.values.forEach(function(d){
            d.x = parseDateTime(d.x);
        })
      });
      xFormat = function(d){return d3.time.format('%x %H:%M')(new Date(d))};
  }
  return data;
};

function nvXformat(data){
  var x0 = data[0].values[0].x;
  if (dateReg.test(x0)){
    return function(d){return d3.time.format('%d %b %y')(new Date(d))};
  } else if (timeReg.test(x0)){
    return function(d){return d3.time.format('%H:%M:%S.%L')(new Date(d))};
  } else if (datetimeReg.test(x0)){
    return function(d){return d3.time.format('%x %H:%M')(new Date(d))};
  } 
  return function(d){return d};
};