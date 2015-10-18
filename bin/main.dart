import 'dart:io';
import 'dart:convert' show UTF8, JSON;


main() async {
  List jsonData = ["portmanteau", "fantabulous", "spork", "smog",
  "spanglish", "gerrymander", "turducken", "stagflation",
  "bromance", "freeware", "oxbridge", "palimony", "netiquette",
  "brunch", "blog", "chortle", "Hassenpfeffer", "Schnitzelbank"
  ];//creat a list
  var server = await HttpServer.bind(InternetAddress.LOOPBACK_IP_V4, 8080);
  print("Serving at ${server.address}:${server.port}");

  await for (var request in server) {
    HttpResponse response1 = request.response;
    addCorsHeaders(response1);
    request.response
      ..headers.contentType = new ContentType("application", "json", charset: "utf-8")//the ContentType is json
      ..write(JSON.encode(jsonData))// transform the list into json
      ..close();
  }
}
void addCorsHeaders(HttpResponse response1)//allow serve clients that are running on a different origin
{
  response1.headers.add("Access-Control-Allow-Origin", "*");
  response1.headers.add("Access-Control-Allow-Methods", "POST, GET, OPTIONS");
  response1.headers.add("Access-Control-Allow-Headers", "Origin, X-Requested-With, Content-Type, Accept");
}