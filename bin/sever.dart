import 'dart:io';

main() async {
  //�ܺã����Ը����˿ںš��Զ˿ڵ������ô���ˣ�
  var server = await HttpServer.bind(InternetAddress.LOOPBACK_IP_V4, 1122);
  print("Serving at ${server.address}:${server.port}");

  await for (var request in server) {
    var response = request.response;
    addCorsHeaders(response);
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
void addCorsHeaders(HttpResponse response) {
  response.headers.add('Access-Control-Allow-Origin', '*');
  response.headers.add(
      'Access-Control-Allow-Methods', 'POST, OPTIONS');
  response.headers.add('Access-Control-Allow-Headers',
  'Origin, X-Requested-With, Content-Type, Accept');
}