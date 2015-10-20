import 'dart:io';

main() async {
  var server = await HttpServer.bind(InternetAddress.LOOPBACK_IP_V4, 8080);
  print("Serving at ${server.address}:${server.port}");

  await for (var request in server) {

    HttpResponse response= request.response;
    addCorsHeaders(response);
    request.response
      ..headers.contentType = new ContentType("application", "json", charset: "utf-8")
      //..headers.accessControlAllowOrigin=new AccessControlAllowOrigin('Access-Control-Allow-Origin:*')
      ..write('[ \n "portmanteau", "fantabulous", "spork", "smog", "spanglish", "gerrymander", "turducken", "stagflation",  "bromance", "freeware", "oxbridge", "palimony", "netiquette",  "brunch", "blog", "chortle", "Hassenpfeffer", "Schnitzelbank" \n ]')
      ..close();

  }
}

void addCorsHeaders(HttpResponse res) {
res.headers.add("Access-Control-Allow-Origin", "*");
res.headers.add("Access-Control-Allow-Methods", "POST, GET, OPTIONS");
res.headers.add("Access-Control-Allow-Headers", "Origin, X-Requested-With, Content-Type, Accept");
}
