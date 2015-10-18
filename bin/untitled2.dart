import 'dart:io';
main() async {
  var server = await HttpServer.bind(InternetAddress.LOOPBACK_IP_V4, 8080);
  print("Serving at ${server.address}:${server.port}");
  await for (var request in server) {
    request.response
      ..headers.contentType = new ContentType("application", "JSON ", charset: "utf-8")
      ..write('[\n "portmanteau", "fantabulous", "spork", "smog","spanglish",\n"gerrymander", "turducken", "stagflation","bromance", "freeware",\n"oxbridge", "palimony", "netiquette","brunch", "blog",\n "chortle", "Hassenpfeffer", "Schnitzelbank" \n]')
      ..close();
  }
}