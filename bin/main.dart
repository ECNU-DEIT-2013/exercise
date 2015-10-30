import 'dart:io';
import 'dart:async';
import 'dart:convert';
import 'package:sqljocky/sqljocky.dart';

main() async {
  var server = await HttpServer.bind(InternetAddress.LOOPBACK_IP_V4, 8080);
  print("Serving at ${server.address}:${server.port}");

  await for (var request in server) {
    var pool = new ConnectionPool(host: '52.8.67.180', port: 3306, user: 'dec2013stu', password: 'dec2013stu', db: 'stu_10130340212', max: 5);
    var results = await pool.query('select * from user_gyt');
    var ResultList = new List();
    results.forEach((row) {
      print('Name: ${row[0]}, Number: ${row[1]}, Email: ${row[2]}');
      ResultList.add('Name: ${row[0]}, Number: ${row[1]}, Email: ${row[2]}');
    });

    addCorsHeaders(request.response);
    request.response
      ..headers.contentType = new ContentType("application", "json", charset: "utf-8")
      ..write(ResultList)
      /*..write('''[
      "portmanteau", "fantabulous", "spork", "smog",
      "spanglish", "gerrymander", "turducken", "stagflation",
      "bromance", "freeware", "oxbridge", "palimony", "netiquette",
       "brunch", "blog", "chortle", "Hassenpfeffer", "Schnitzelbank"
       ]''')
       */
      ..close();
  }
}

void addCorsHeaders(HttpResponse response) {
  response.headers.add('Access-Control-Allow-Origin', '*');
  response.headers.add('Access-Control-Allow-Methods', 'POST, OPTIONS');
  response.headers.add('Access-Control-Allow-Headers', 'Origin, X-Requested-With, Content-Type, Accept');
}


