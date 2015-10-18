import 'dart:io';

main() async {
  var server = await HttpServer.bind(InternetAddress.LOOPBACK_IP_V4, 8080);
  print("Serving at ${server.address}:${server.port}");

  await for (var request in server) {
    var res= request.response;
    addCorsHeaders(res);
    request.response
      ..headers.contentType = new ContentType("application", "json", charset: "utf-8")
      ..write('[\n "portmanteau", "fantabulous", "spork", "smog",\n "spanglish", "gerrymander", "turducken", "stagflation",\n "bromance", "freeware", "oxbridge", "palimony", "netiquette",\n "brunch", "blog", "chortle", "Hassenpfeffer", "Schnitzelbank"\n]')
      ..close();
  }
}
void addCorsHeaders(HttpResponse res) {
  res.headers.add('Access-Control-Allow-Origin', '*');
  res.headers.add('Access-Control-Allow-Methods', 'POST, OPTIONS');
  res.headers.add('Access-Control-Allow-Headers',
  'Origin, X-Requested-With, Content-Type, Accept');
}
