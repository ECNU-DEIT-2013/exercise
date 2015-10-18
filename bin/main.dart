import 'dart:io';

main() async {
  var server = await HttpServer.bind(InternetAddress.LOOPBACK_IP_V4, 8080);
  print("Serving at ${server.address}:${server.port}");

}


  await for (var request in server) {
    request.response
      ..headers.contentType = new ContentType("text", "html", charset: "utf-8")
      ..write('<p>portmanteau<p>')
      ..close();
  }
}
processString(String jsonString) {
  List<String> portmanteaux = JSON.decode(jsonString);
  for (int i = 0; i < portmanteaux.length; i++) {
    wordList.children.add(new LIElement()..text = portmanteaux[i]);
  }
}

handleError(Object error) {
  wordList.children.add(new LIElement()..text = 'Request failed.');
}
