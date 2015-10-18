
import 'dart:io';

main() async {
  var server = await HttpServer.bind(InternetAddress.LOOPBACK_IP_V4, 8080);
  print("Serving at ${server.address}:${server.port}");

  await for (var request in server) {
    request.response
      ..headers.contentType = new ContentType("application", "json", charset: "utf-8")
      ..write('[\n "portmanteau", "fantabulous", "spork", "smog",\n "spanglish", "gerrymander", "turducken", "stagflation",\n "bromance", "freeware", "oxbridge", "palimony", "netiquette",\n "brunch", "blog", "chortle", "Hassenpfeffer", "Schnitzelbank"\n]')
      ..close();
  }
}