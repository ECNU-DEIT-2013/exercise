import 'dart:io';

main() async {
  var server = await HttpServer.bind(InternetAddress.LOOPBACK_IP_V4, 8080);
  print("Serving at ${server.address}:${server.port}");

  await for (var request in server) {
    request.response
      ..headers.contentType = new ContentType("text", "html", charset: "utf-8")
      ..write('Hello, boy <h1>Portmanteaux</h1> ')
      ..close();
  }
}