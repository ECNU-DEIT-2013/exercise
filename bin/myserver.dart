import 'dart:io';
<<<<<<< HEAD
import 'dart:convert' show UTF8, JSON;

main() async {
  List jsondata = [
    "portmanteau", "fantabulous", "spork", "smog",
    "spanglish", "gerrymander", "turducken", "stagflation",
    "bromance", "freeware", "oxbridge", "palimony", "netiquette",
    "brunch", "blog", "chortle", "Hassenpfeffer", "Schnitzelbank"
  ];
=======

main() async {
>>>>>>> origin/10130340237
  var server = await HttpServer.bind(InternetAddress.LOOPBACK_IP_V4, 8080);
  print("Serving at ${server.address}:${server.port}");

  await for (var request in server) {
    request.response
<<<<<<< HEAD
      ..headers.contentType = new ContentType("text", "json", charset: "utf-8")
      ..write(JSON.encode(jsondata))
      ..close();


  }
}
void addCorsHeaders(HttpResponse res) {
    res.headers.add("Access-Control-Allow-Origin", "*");
    res.headers.add("Access-Control-Allow-Methods", "POST,GET,OPTIONS");
    res.headers.add("Access-Control-Allow-Headers", "Origin, X-Requested-With, Content-Type, Accept");
  }
=======
      ..headers.contentType = new ContentType("text", "html", charset: "utf-8")
      ..write('<p>Hello, world</p><h1>fdaf</h1>')
      ..close();
  }
}
>>>>>>> origin/10130340237
