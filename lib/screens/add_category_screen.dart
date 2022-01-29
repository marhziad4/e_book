import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sqflite_example/models/category.dart';
import 'package:sqflite_example/providers/CategoryProvider.dart';

class AddCategoryScreen extends StatefulWidget {

  @override
  _AddCategoryScreenState createState() => _AddCategoryScreenState();
}

class _AddCategoryScreenState extends State<AddCategoryScreen> {
  late TextEditingController _nameTextController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _nameTextController = TextEditingController();
  }
  @override
  void dispose() {
    // TODO: implement dispose
    _nameTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Category'),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 40,
        ),
        child: Column(
          children: [
            TextField(
              controller: _nameTextController,
              decoration: InputDecoration(hintText: 'Name'),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () async{
                await save();
              },
              child: Text('SAVE'),
              style: ElevatedButton.styleFrom(
                minimumSize: Size(double.infinity, 50),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> save() async {
    bool saved = await Provider.of<CategoryProvider>(context,listen: false).create(category: category);
    if(saved){
      print('SAVED SUCCESSFULLY');
    }
  }

  Category get category {
    Category category = Category();
    category.name = _nameTextController.text;
    return category;
  }
}
