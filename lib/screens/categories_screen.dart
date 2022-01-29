import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sqflite_example/providers/CategoryProvider.dart';
import 'package:sqflite_example/screens/add_category_screen.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Categories'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => AddCategoryScreen(),
                ),
              );
            },
            icon: Icon(Icons.add),
          ),
        ],
      ),
      body: Consumer<CategoryProvider>(
        builder: (
          BuildContext context,
          CategoryProvider provider,
          Widget? child,
        ) {
          if (provider.categories.isNotEmpty) {
            return ListView.builder(
              itemCount: provider.categories.length,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: Icon(Icons.category),
                  title: Text(provider.categories[index].name),
                  subtitle: Text(provider.categories[index].id.toString()),
                  trailing: IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.delete),
                  ),
                );
              },
            );
          } else {
            return Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    Icons.warning,
                    size: 80,
                    color: Colors.grey.shade500,
                  ),
                  Text(
                    'NO DATA',
                    style: TextStyle(
                      color: Colors.grey.shade500,
                      fontSize: 24,
                    ),
                  )
                ],
              ),
            );
          }
        },
      ),
    );
  }
}
