import 'dart:io';
import 'dart:async';
import 'package:sqljocky/sqljocky.dart';
import 'dart:convert';
String s='''[
  "portmanteau", "fantabulous", "spork", "smog",
  "spanglish", "gerrymander", "turducken", "stagflation",
  "bromance", "freeware", "oxbridge", "palimony", "netiquette",
  "brunch", "blog", "chortle", "Hassenpfeffer", "Schnitzelbank"
]''';

main() async {
  //var server = await HttpServer.bind(InternetAddress.LOOPBACK_IP_V4, 8080);
  //print("Serving at ${server.address}:${server.port}");
  HttpServer.bind(InternetAddress.LOOPBACK_IP_V4, 8080).then((server){
    server.listen((HttpRequest request){
      switch (request.method) {
        case "GET":
          handleGet(request);
          break;
        case "POST":
          handlePost(request);
          break;
      }
    });
  });
}
void handleGet(HttpRequest req) {
  HttpResponse res = req.response;
  addCorsHeaders(res);
  res.headers.contentType = new ContentType("application", "json", charset: "utf-8");
  res..write(s)
    ..close();
}
void handlePost(HttpRequest req) {
  HttpResponse res = req.response;
  addCorsHeaders(res);
  addSql();
  var choice =req.uri.queryParameters["Sex"];
  if(choice=="male"){
    addSql();
   req.response..write("like male")
      ..close();
  }
  else{
    req.response..write("like female")
      ..close();
  }
}


void addCorsHeaders(HttpResponse res) {
  res.headers.add("Access-Control-Allow-Origin", "*");
  res.headers.add("Access-Control-Allow-Methods", "POST, GET, OPTIONS");
  res.headers.add("Access-Control-Allow-Headers", "Origin, X-Requested-With, Content-Type, Accept");
}
Future addSql() async{
   List l1=new List();
   var pool = new ConnectionPool(host: 'localhost', port: 3306, user: 'root', password: '1234', db: 'helloworld', max: 5);
   var query = await pool.prepare('insert into user_info (name, email) values (?,?)');
  // var results = await pool.query('select * from user_info');
   var result = await query.execute(['Bon', 'bob@bob.com']);
   print("New user's id: ${result.insertId}");
 }

/*Future addSql() async{
  var pool = new ConnectionPool(host: 'localhost', port: 3306, user: 'root', password: '1234', db: 'helloworld', max: 5);
  var results = await pool.query('select * from user_info');
  results.forEach((row)
  {
    print('Name: ${row[0]}, email: ${row[1]}');
   // return row[0];
    var js1 = JSON.encode(row[0]);
    res.write(js1);
  });
}*/