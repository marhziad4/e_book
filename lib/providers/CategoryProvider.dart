import 'package:flutter/material.dart';
import 'package:sqflite_example/controllers/category_db_controller.dart';
import 'package:sqflite_example/models/category.dart';

class CategoryProvider extends ChangeNotifier {
  List<Category> categories = <Category>[];
  CategoryDbController _categoryDbController = CategoryDbController();

  Future<bool> create({required Category category}) async {
    int id = await _categoryDbController.create(category);
    if (id != 0) {
      category.id = id;
      categories.add(category);
      notifyListeners();
      return true;
    }
    return false;
  }

  Future<void> read() async {
    categories = await _categoryDbController.read();
    notifyListeners();
  }

  Future<bool> update({required Category category}) async {
    bool updated = await _categoryDbController.update(category);
    if(updated){
      int index = categories.indexWhere((element) => element.id == category.id);
      if(index != -1){
        categories[index] = category;
        notifyListeners();
        return true;
      }
    }
    return false;
  }

  Future<bool> delete({required int id}) async {
    bool deleted = await _categoryDbController.delete(id);
    if(deleted){
      int index = categories.indexWhere((element) => element.id == id);
      if(index != -1){
        categories.removeAt(index);
        notifyListeners();
        return true;
      }
    }
    return false;
  }
}
