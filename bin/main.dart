import 'dart:io';

main() async {
  var server = await HttpServer.bind(InternetAddress.LOOPBACK_IP_V4, 8080);
  print("Serving at ${server.address}:${server.port}");

  await for (var request in server) {
  request.response.headers
    ..add("Access-Control-Allow-Origin", "*")
    ..add("Access-Control-Allow-Methods", "POST, GET, OPTIONS")
    ..add("Access-Control-Allow-Headers", "Origin, X-Requested-With, Content-Type, Accept");
    resquest.response
      ..headers.contentType = new ContentType("application", "json", charset: "utf-8")
      ..write('[\n "portmanteau", "fantabulous", "spork", "smog",\n "spanglish", "gerrymander", "turducken", "stagflation",\n "bromance", "freeware", "oxbridge", "palimony", "netiquette",\n "brunch", "blog", "chortle", "Hassenpfeffer", "Schnitzelbank"\n]\n')
      ..close();
  }
}
void addCorsHeaders(HttpResponse res) {
  res.headers.add("Access-Control-Allow-Origin", "*");
  res.headers.add("Access-Control-Allow-Methods", "POST, GET, OPTIONS");
  res.headers.add("Access-Control-Allow-Headers", "Origin, X-Requested-With, Content-Type, Accept");
}