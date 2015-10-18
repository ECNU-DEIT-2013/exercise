import 'dart:io';

main() async {
  var server = await HttpServer.bind(InternetAddress.LOOPBACK_IP_V4, 8080);
  print("Serving at ${server.address}:${server.port}");

  await for (var request in server) {
    var res = request.response;
    addCorsHeaders(res);
    request.response
      ..headers.contentType = new ContentType("application", "json", charset: "utf-8")
      ..write('[')
      ..write('\n"portmanteau","fantabulous","spork","smog",')
      ..write('\n"spanglish","gerrymander","turducken","stagflation",')
      ..write('\n"bromance","freeware","oxbridge","palimony","netiquette",')
      ..write('\n"brunch","blog","chortle","Hassenpfeffer","Schnitzelbank"\n')
      ..write(']')
      ..close();
  }
}
void addCorsHeaders(HttpResponse res) {
  res.headers.add('Access-Control-Allow-Origin', '*');
  res.headers.add('Access-Control-Allow-Methods', 'POST, OPTIONS');
  res.headers.add('Access-Control-Allow-Headers',
  'Origin, X-Requested-With, Content-Type, Accept');
}