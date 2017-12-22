var express = require('express');
var app = express();
var callfile = require('child_process'); 

app.get('/', function (req, res) {
   res.send('Hello World');
})

app.get('/del_user', function (req, res) {
   console.log("/del_user 响应 DELETE 请求");
   res.send('删除页面');
})

app.get('/getAllNodes', function (req, res) {
  callfile.execFile('./testbash.sh',[],null,function (err, stdout, stderr) {     
  res.send(stdout);
});

})

//  /list_user 页面 GET 请求
app.get('/list_user', function (req, res) {
   console.log("/list_user GET 请求");
   res.send('用户列表页面');
})


// 对页面 abcd, abxcd, ab123cd, 等响应 GET 请求
app.get('/ab*cd', function(req, res) {   
   console.log("/ab*cd GET 请求");
   res.send('正则匹配');
})

var server = app.listen(8081, function () {
 
  var host = server.address().address
  var port = server.address().port
 
  console.log("应用实例，访问地址为 http://%s:%s", host, port)
 
})
