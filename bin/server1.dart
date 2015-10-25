import 'dart:io';
import 'dart:async';
import 'package:sqljocky/sqljocky.dart';
var list= new List();
main() async {
  var server = await HttpServer.bind(InternetAddress.LOOPBACK_IP_V4, 8080);
  print("Serving at ${server.address}:${server.port}");

  await for (var request in server) {
    HttpResponse res = request.response;
    addCorsHeaders(res);
    var s ='''[
  "portmanteau", "fantabulous", "spork", "smog",
  "spanglish", "gerrymander", "turducken", "stagflation",
  "bromance", "freeware", "oxbridge", "palimony", "netiquette",
  "brunch", "blog", "chortle", "Hassenpfeffer", "Schnitzelbank"
]''';
    addSql(res);
    request.response
      ..headers.contentType = new ContentType("application", "json", charset: "utf-8");
    for(var i=0;i<list.length;i++){
        res.write('"${list[i]}"');
      }
      res.close();
  }
}
Future addSql( var res) async{
  var pool = new ConnectionPool(host: 'localhost', port: 3306, user: 'root', password: '1234', db: 'helloworld', max: 5);
   var results = await pool.query('select * from user_info');
  results.forEach((row){
    list.add(row[0]);
    print(list);
  }
  );
print("hello");
//return list;
}


void addCorsHeaders(HttpResponse res) {
  res.headers.add("Access-Control-Allow-Origin", "*");
  res.headers.add("Access-Control-Allow-Methods", "POST, GET, OPTIONS");
  res.headers.add("Access-Control-Allow-Headers", "Origin, X-Requested-With, Content-Type, Accept");
}