import 'package:sqflite/sqflite.dart';
import 'package:sqflite_example/database/db_operations.dart';
import 'package:sqflite_example/database/db_provider.dart';
import 'package:sqflite_example/models/category.dart';

class CategoryDbController extends DbOperations<Category> {
  Database _database = DbProvider().database;

  @override
  Future<int> create(Category object) async {
    //SQL:: INSERT INTO categories (name) VALUES ('NEW NAME');
    return await _database.insert('categories', object.toMap());
  }

  @override
  Future<bool> delete(int id) async {
    //DELETE FROM categories;
    //DELETE FROM categories WHERE id = 1;
    int countOfDeletedRows =
        await _database.delete('categories', where: 'id = ?', whereArgs: [id]);
    return countOfDeletedRows > 0;
  }

  @override
  Future<List<Category>> read() async {
    //SELECT * FROM categories;
    List<Map<String, dynamic>> rows = await _database.query('categories');
    if (rows.isNotEmpty) {
      return rows.map((rowMap) => Category.fromMap(rowMap)).toList();
    }
    return [];
  }

  @override
  Future<Category?> show(int id) async {
    //SELECT * FROM categories WHERE id = 1;
    List<Map<String, dynamic>> rows =
        await _database.query('categories', where: 'id = ?', whereArgs: [id]);
    if (rows.isNotEmpty) {
      return rows.map((rowMap) => Category.fromMap(rowMap)).first;
    }
    return null;
  }

  @override
  Future<bool> update(Category object) async {
    //UPDATE categories SET name = 'NEW NAME';
    //UPDATE categories SET name = 'NEW NAME' WHERE id = 1;
    int countOfUpdatedRows = await _database.update(
        'categories', object.toMap(),
        where: 'id = ?', whereArgs: [object.id]);
    return countOfUpdatedRows > 0;
  }
}
