import 'package:flutter/material.dart';

import '/widget/meal_item.dart';
import '/model/meal.dart';

class FavouriteScreen extends StatelessWidget {
  final List<Meal> favouriteMeal;
  FavouriteScreen(this.favouriteMeal);
  @override
  Widget build(BuildContext context) {
    if (favouriteMeal.isEmpty) {
      return Center(
        child: Text(
          'Add Favourite Meals :)',
          style: Theme.of(context).textTheme.headline6,
        ),
      );
    } else {
      return ListView.builder(
        itemBuilder: (ctx, index) {
          return MealItem(
            id: favouriteMeal[index].id,
            title: favouriteMeal[index].title,
            imageURL: favouriteMeal[index].imageUrl,
            duration: favouriteMeal[index].duration,
            affordability: favouriteMeal[index].affordability,
            complexity: favouriteMeal[index].complexity,
          );
        },
        itemCount: favouriteMeal.length,
      );
    }
  }
}
