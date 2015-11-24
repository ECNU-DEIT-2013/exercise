import 'dart:io';
import 'package:rest_frame/rest_frame.dart';
import 'dart:async';

void addCorsHeaders(HttpResponse res) {
  res.headers.add("Access-Control-Allow-Origin", "*");
  res.headers.add("Access-Control-Allow-Methods", "POST, GET, OPTIONS");
  res.headers.add("Access-Control-Allow-Headers", "Origin, X-Requested-With, Content-Type, Accept");
}

main() async {
  var server = await HttpServer.bind(InternetAddress.LOOPBACK_IP_V4, 8008);
  print("Serving at ${server.address}:${server.port}");



  await for (var request in server) {
    addCorsHeaders(request.response);
   // handleRequest(request);
    //stockPost(request);
    Router router1 = new Router();
    router1.post(stockPost, "/stock");//因为在做尝试，但是 不是应该这样写了就可以用吗？？ps：直接用浏览器访问server的地址的话，这个httprequest的method是什么啊？
    Router childrouter = router1.child("/bond");
    print('Server is OK');
  }
}

void handleRequest(HttpRequest request) {
  try {
    if(request.method == 'POST'){
      handlePost(request);
    }
    else{
      request.response..statusCode = HttpStatus.METHOD_NOT_ALLOWED
        ..write('Unsupported request: ${request.method}.')
        ..close();
    }
  } catch (e) {
    print('Exception in handleRequest: $e');
  }
  print('Request handled.');
}

void handlePost(HttpRequest request){

}

void stockPost(HttpRequest request){
  request.response
    ..headers.contentType = new ContentType("text", "plain", charset: "utf-8")
    ..write('test')
    ..close();
}//不知道怎么写就开始乱写了= =