import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'Bot_nav/home.dart';
import 'login.dart';
import 'controller/shared_preference.dart';
import 'Model/data_model.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  initiateLocalDB();
  SharedPreference().getLoginStatus().then((status) {
    runApp(MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(fontFamily: 'Poppins'),
        home: status ? HomePage() : LoginPage()
    ));
  });
  // runApp(const MyApp());
}

void initiateLocalDB() async {
  await Hive.initFlutter();
  Hive.registerAdapter(DataModelAdapter());
  await Hive.openBox<DataModel>("data");
}