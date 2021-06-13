import 'package:flutter/material.dart';

import '/model/meal.dart';
import '/widget/meal_item.dart';

class CatagoryMealsScreen extends StatefulWidget {
  static const routeName = '/catagory-meals';
  final List<Meal> avaibleMeals;

  CatagoryMealsScreen(this.avaibleMeals);

  @override
  _CatagoryMealsScreenState createState() => _CatagoryMealsScreenState();
}

class _CatagoryMealsScreenState extends State<CatagoryMealsScreen> {
  @override
  Widget build(BuildContext context) {
    final routesArgs =
        ModalRoute.of(context).settings.arguments as Map<String, String>;

    final categoryTitle = routesArgs['title'];
    final categoryId = routesArgs['id'];
    final categoryMeals = widget.avaibleMeals.where((meals) {
      return meals.categories.contains(categoryId);
    }).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle),
      ),
      body: ListView.builder(
        itemBuilder: (ctx, index) {
          return MealItem(
            id: categoryMeals[index].id,
            title: categoryMeals[index].title,
            imageURL: categoryMeals[index].imageUrl,
            duration: categoryMeals[index].duration,
            affordability: categoryMeals[index].affordability,
            complexity: categoryMeals[index].complexity,
          );
        },
        itemCount: categoryMeals.length,
      ),
    );
  }
}
