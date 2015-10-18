import 'dart:io';

main() async {
  var server = await HttpServer.bind(InternetAddress.LOOPBACK_IP_V4, 1122);
  print("Serving at ${server.address}:${server.port}");

  await for (var request in server) {
    request.response
      ..headers.contentType = new ContentType("text", "josn", charset: "utf-8")
      ..write('["portmanteau", "fantabulous", "spork", "smog","spanglish", "gerrymander", "turducken", "stagflation","bromance", "freeware", "oxbridge", "palimony", "netiquette","brunch", "blog", "chortle", "Hassenpfeffer", "Schnitzelbank"]')
      ..close();
  }
}