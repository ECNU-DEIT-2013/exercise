import'dart:async';
import 'dart:io';
main() async {
  var server = await HttpServer.bind(InternetAddress.LOOPBACK_IP_V4,8080);
  print("Serving at ${server.address}:${server.port}");

    await for (var request in server) {
      request.response.headers
      ..add('Access-Control-Allow-Origin', '*')
      ..add('Access-Control-Allow-Methods', 'POST, OPTIONS')
      ..add('Access-Control-Allow-Headers', 'Origin, X-Requested-With, Content-Type, Accept');
      request.response
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
