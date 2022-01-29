import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sqflite_example/database/db_provider.dart';
import 'package:sqflite_example/providers/CategoryProvider.dart';
import 'package:sqflite_example/screens/categories_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DbProvider().initDatabase();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<CategoryProvider>(create: (_) => CategoryProvider()),
      ],
      builder: (BuildContext context, Widget? child){
        return MyMaterialApp();
      },
    );
  }
}

class MyMaterialApp extends StatelessWidget {
  const MyMaterialApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: CategoriesScreen(),
    );
  }
}

