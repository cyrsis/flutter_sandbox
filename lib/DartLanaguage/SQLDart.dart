import 'dart:io';
import 'dart:async';
import 'package:sqljocky5/constants.dart';
import 'package:sqljocky5/sqljocky.dart';
import 'package:sqljocky5/utils.dart';

main(List<String> arguments) async {

  var pool = new ConnectionPool(
      host: 'localhost',
      port: 3306,
      user: 'bryan',
      password: 'password',
      db: 'school',
      max: 5
  );

  var query = await pool.prepare('insert into students (name) values (?)');
  await insert(query, 'Marc');
  await insert(query, 'Chad');
  await insert(query, 'Stacy');
  await insert(query, 'Peter');

  pool.closeConnectionsNow();
  exit(0);

}

void insert(var query, String name) async {
  var result = await query.execute([name]);
  print('New student ID: ${result.insertId}');
}

