import 'dart:io';

void addCorsHeaders(HttpResponse res) {
  res.headers.add('Access-Control-Allow-Origin', '*');
  res.headers.add('Access-Control-Allow-Methods', 'POST, OPTIONS');
  res.headers.add('Access-Control-Allow-Headers', 'Origin, X-Requested-With, Content-Type, Accept');
}
void handleOptions(HttpRequest req) {
  HttpResponse res = req.response;
  addCorsHeaders(res);
  print('${req.method}: ${req.uri.path}');
  res.statusCode = HttpStatus.NO_CONTENT;
  res.close();
}
main() async {
  var server = await HttpServer.bind(InternetAddress.LOOPBACK_IP_V4, 8008);
  print("Serving at ${server.address}:${server.port}");

  await for (var request in server) {
    handleOptions(request);
   //request.response.listen(addCorsHeaders());
    var JTxt1 ='['+'"portmanteau", "fantabulous", "spork", "smog","spanglish", "gerrymander", "turducken", "stagflation","bromance", "freeware", "oxbridge", "palimony", "netiquette","brunch", "blog", "chortle", "Hassenpfeffer", "Schnitzelbank"'+']' ;
   //request.response.headers
   // ..add('Access-Control-Allow-Origin', '*')
   // ..add('Access-Control-Allow-Methods', 'POST, OPTIONS')
   // ..add('Access-Control-Allow-Headers', 'Origin, X-Requested-With, Content-Type, Accept');

    request.response
      ..headers.contentType = new ContentType("application","json", charset: "utf-8")
      ..write(JTxt1)
      ..close();
  }
}