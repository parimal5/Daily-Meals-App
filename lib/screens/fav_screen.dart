import 'package:flutter/material.dart';

class FavouriteScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Favourite Text',
        style: Theme.of(context).textTheme.headline6,
      ),
    );
  }
}
