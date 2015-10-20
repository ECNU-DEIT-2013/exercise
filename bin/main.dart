
import 'dart:io';

main() async {
  var response = request.response;
  addCorsHeaders(response);
  var server = await HttpServer.bind(InternetAddress.LOOPBACK_IP_V4, 8080);

  print("Serving at ${server.address}:${server.port}");

  await for (var request in server) {
    request.response
      ..headers.contentType = new ContentType("application", "json", charset: "utf-8")//dartsdk-ContentType-json
      ..write(
 "[       'worker','labourer','physical',   'labourer',   'mentalworker',     'skilled',    'newspaper'] "  )
      ..close();
  }
}

//server-tutorial HTTPServers and Clients-using the http_server package����-note_server.dart�����ã�
void addCorsHeaders(HttpResponse response) {
  response.headers.add('Access-Control-Allow-Origin', '*');//*�����з��������ܷ��ʣ�����д���Լ��ģ�127.0.0.1
  response.headers.add(
      'Access-Control-Allow-Methods', 'POST, OPTIONS');
  response.headers.add('Access-Control-Allow-Headers',
  'Origin, X-Requested-With, Content-Type, Accept');
}