import 'dart:io';

import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

/// @Author Aaron
/// @Email aaron@merculet.io
/// @Date 2018/10/22
/// @Description 数据库操作辅助类
class DbHelper {
  Database database;

  final String DbName = "viet_news.db";

  final String TABLE_NAME = "newstable";
  final String ITEM_ID = "itemid";
  final String DATA = "content";

  static final DbHelper db = new DbHelper._internal();

  factory DbHelper() {
    return db;
  }

  DbHelper._internal() {
    _initDb(DbName).then((path) {
      _createTable(path, TABLE_NAME);
    });
  }

  //插入
  Future<int> insert(String itemId, String dataValue) async {
    return await database
        .insert(TABLE_NAME, {"$ITEM_ID": itemId, "$DATA": dataValue});
  }

  //更新(如果原来没有此条数据，不会插入)
  Future<int> update(String itemId, String dataValue) async {
    return await database
        .update(TABLE_NAME, {"$ITEM_ID": itemId, "$DATA": dataValue});
  }

  //替换(如果原来没有此条数据，则插入)
  Future<int> replace(String itemId, String dataValue) async {
    return await database.execute(
        "REPLACE INTO $TABLE_NAME($ITEM_ID, $DATA) VALUES ('$itemId','$dataValue')");
  }

  //查询
  Future<List<Map<String, dynamic>>> query({String itemId}) async {
    if (itemId != null) {
      return await database.query(TABLE_NAME, where: "$ITEM_ID = $itemId");
    } else {
      return await database.query(TABLE_NAME);
    }
  }

  //删除
  Future<int> delete({String itemId}) async {
    if (itemId != null) {
      print("itemId1:$itemId");
      return await database.delete(TABLE_NAME, where: "$ITEM_ID = $itemId");
    } else {
      print("itemId2:$itemId");
      return await database.delete(TABLE_NAME);
    }
  }

// 返回路径
  Future<String> _initDb(String dbName) async {
    var databasePath = await getDatabasesPath();
    print(databasePath);
    String path = join(databasePath, dbName);

    // make sure the folder exists
    if (!await Directory(dirname(path)).exists()) {
      try {
        await Directory(dirname(path)).create(recursive: true);
      } catch (e) {
        print(e);
      }
    } else {
      //      await deleteDatabase(path);
    }
    return path;
  }

// 返回表
  Future _createTable(String path, String tableName) async {
    Future _onCreate(Database db, int version) async {
      await db.execute('''
          create table if not exists $tableName ( 
            $ITEM_ID text primary key, 
            $DATA text not null)
      ''');
    }

    database = await openDatabase(path, version: 1, onCreate: _onCreate);
  }
}
