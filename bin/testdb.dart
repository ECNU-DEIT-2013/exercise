import 'dart:io';
import 'package:sqljocky/sqljocky.dart';

main() async {
  var pool = new ConnectionPool(host: '52.89.52.143', port: 3306, user: 'User', password: 'ourpassword', db: 'ourdb1', max: 5);
  var results = await pool.query('select * from testsheet ');
  String str1='';
  String str='';
  results.forEach((row) {
    print('Name:${row[0]}, email:${row[1]}');
  });
  print(str1);
}

