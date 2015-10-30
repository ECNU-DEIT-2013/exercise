import 'dart:io';
import 'package:sqljocky/sqljocky.dart';

List result=new List();
int i=0;

main() async {
  var server = await HttpServer.bind(InternetAddress.LOOPBACK_IP_V4, 8080);
  print("Serving at ${server.address}:${server.port}");
  getData();

  await for (var request in server) {
    var res= request.response;
    addCorsHeaders(res);
    request.response
      ..headers.contentType = new ContentType("application", "json", charset: "utf-8")
      ..write('[\n');
      for(int j=0;j<result.length;j++)
      res.write('"${result[j]}');
      res.write(']');
/*..write('''[
      "portmanteau", "fantabulous", "spork", "smog",
      "spanglish", "gerrymander", "turducken", "stagflation",
      "bromance", "freeware", "oxbridge", "palimony", "netiquette",
       "brunch", "blog", "chortle", "Hassenpfeffer", "Schnitzelbank"
       ]''')
       */
      res.close();
  }
}

getData()async{
  var pool=new ConnectionPool(host: '52.8.67.180', port: 3306, user: 'dec2013stu', password: 'dec2013stu', db: 'stu_10130340212', max: 5);
  var results = await pool.query('select * from user_gyt');
  return results.forEach((row) {
    print('Name: ${row[0]}, Number: ${row[1]}, Email: ${row[2]}');
    result.add('Name: ${row[0]}, Number: ${row[1]}, Email: ${row[2]}');
    result.add('\n');
    i++;
  });
}

void addCorsHeaders(HttpResponse response) {
  response.headers.add('Access-Control-Allow-Origin', '*');
  response.headers.add('Access-Control-Allow-Methods', 'POST, OPTIONS');
  response.headers.add('Access-Control-Allow-Headers', 'Origin, X-Requested-With, Content-Type, Accept');
}


