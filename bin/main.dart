import 'dart:io';

main() async {
  var server = await HttpServer.bind(InternetAddress.LOOPBACK_IP_V4, 8080);
  print("Serving at ${server.address}:${server.port}");

  await for (var request in server) {
    //List<String> a=["mengmeng","leilei"];
    request.response
      ..headers.contentType = new ContentType("application", "json", charset: "utf-8")
      ..write(
        '''[
  "111", "222"
]'''

    )
      ..close();
  }
}