import 'dart:io';
import 'package:sqljocky/sqljocky.dart';

main() async {
  //addData();
  var server = await HttpServer.bind(InternetAddress.LOOPBACK_IP_V4, 8080);
  print("Serving at ${server.address}:${server.port}");

  await for (var request in server) {

    HttpResponse response= request.response;
    addCorsHeaders(response);
    var pool = new ConnectionPool(host: '52.89.52.143', port: 3306, user: 'User', password: 'ourpassword', db: 'ourdb1', max: 5);
    var results = await pool.query('select * from testsheet ');
    String writein='[ \n';
    var x=0;
    await results.forEach((row) {
      if(x==0){
      writein=writein + '"${row[0]}, ${row[1]}"';
      print(writein);
        x=1;
      }else{
        writein=writein + ',"${row[0]}, ${row[1]}"';
        print(writein);
      }
    });
    writein=writein+ '\n ]';
    //print(writein);
    request.response
      ..headers.contentType = new ContentType("application", "json", charset: "utf-8")
      //..headers.accessControlAllowOrigin=new AccessControlAllowOrigin('Access-Control-Allow-Origin:*')
      //..write('[ \n  "portmanteau", "fantabulous", "spork", "smog", "spanglish", "gerrymander", "turducken", "stagflation",  "bromance", "freeware", "oxbridge", "palimony", "netiquette",  "brunch", "blog", "chortle", "Hassenpfeffer", "Schnitzelbank" \n ]')
      ..write(writein)
      ..close();

  }
}

void addCorsHeaders(HttpResponse res) {
res.headers.add("Access-Control-Allow-Origin", "*");
res.headers.add("Access-Control-Allow-Methods", "POST, GET, OPTIONS");
res.headers.add("Access-Control-Allow-Headers", "Origin, X-Requested-With, Content-Type, Accept");
}
