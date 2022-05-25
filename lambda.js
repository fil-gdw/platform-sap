var http= require('https');

export.handler =function(event, context) {

  console.logs('start request to' + event.url + event.region)
  http.get(event.url,function(res) {
  console.log("Got response:" + res.statusCOde);

  }).on('error',function(e){
  console.log("Got Error" + e.message);
  });
  
  console.log('end request to' + event.url + event.region)
  context.done(null);
}
