import 'package:flutter/material.dart';
import 'package:myfood/model/category.dart';

class CatagoryMealsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final routesArgs =
        ModalRoute.of(context).settings.arguments as Map<String, String>;
    final categoryTitle = routesArgs['title'];
    final categoryid = routesArgs['id'];
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle),
      ),
      body: Center(
        child: Text('This is Next Screen'),
      ),
    );
  }
}
