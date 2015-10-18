import 'dart:io';

main() async {
  var server = await HttpServer.bind(InternetAddress.LOOPBACK_IP_V4, 8080);
  print("Serving at ${server.address}:${server.port}");

  await for (var request in server) {
    request.response
      ..headers.contentType = new ContentType("text", "html", charset: "utf-8")
      ..write('<p>Hello, world</p><h1>fdaf</h1>')
      ..close();
  }
}