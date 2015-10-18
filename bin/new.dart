import 'dart:io';

main() async {
  var server = await HttpServer.bind(InternetAddress.LOOPBACK_IP_V4, 8080);
  print("Serving at ${server.address}:${server.port}");

  await for (var request in server) {
    HttpResponse responseS = request.response;
    addCorsHeaders(responseS);
    responseS
      ..headers.contentType = new ContentType("application", "json", charset: "utf-8")
      ..write('''[
    "portmanteau", "fantabulous", "spork", "smog",
    "spanglish", "gerrymander", "turducken", "stagflation",
    "bromance", "freeware", "oxbridge", "palimony", "netiquette",
    "brunch", "blog", "chortle", "Hassenpfeffer", "Schnitzelbank"
    ]''')
      ..close();
  }
}

void addCorsHeaders(HttpResponse responseS) {
  responseS.headers.add('Access-Control-Allow-Origin', '*');
  responseS.headers.add(
      'Access-Control-Allow-Methods', 'POST, OPTIONS');
  responseS.headers.add('Access-Control-Allow-Headers',
  'Origin, X-Requested-With, Content-Type, Accept');
}
