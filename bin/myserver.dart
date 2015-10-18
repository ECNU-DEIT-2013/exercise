import 'dart:io';

main() async {
  var server = await HttpServer.bind(InternetAddress.LOOPBACK_IP_V4, 8080);
  print("Serving at ${server.address}:${server.port}");

  void addCorsHeaders(HttpResponse res){
    res.headers.add("Access-Control-Allow-Origin","*");
    res.headers.add("Access-Control-Allow-Methods","POST, GET, OPTIONS");
    res.headers.add("Access-Control-Allow-Headers","Origin, X-Requested-With");
  }
  await for (var request in server) {
    HttpResponse res = request.response;
    addCorsHeaders(res);
    res
      ..headers.contentType = new ContentType("text", "plain", charset: "utf-8")
      ..write('Hello Florence!')
      ..close();
  }
}
