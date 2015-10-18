
import 'dart:io';

main() async {
  var server = await HttpServer.bind(InternetAddress.LOOPBACK_IP_V4, 8080);
  print("Serving at ${server.address}:${server.port}");

  await for (var request in server) {
    HttpResponse res = request.response;
    addCorsHeaders(res);
    request.response
      ..headers.contentType = new ContentType("appliciation", "json", charset:"utf-8")
      ..write('''["portmanteau","fantabulous","spork,smog","spanglish","gerrymander","turducken","stagflation","bromance",
      "freeware","oxbridge","palimony","netiquett","brunch","blog","chortle","Hassenpfeffer","Schnitzelbank"]''')
      ..close();
  }
}
void addCorsHeaders(HttpRespose res){
  res.headers.add("Access-Control-Allow-Origin","*");
  res.headers.add("Access-Control-Allow-Methods","POST,GET,OPTIONS");
  res.headers.add("Access-Control-Allow-Headers","Origin,X-Requested-With,Content-Type,Accept");
}




