import 'package:flutter/material.dart';
import 'package:myfood/screens/category_meal_screen.dart';

import '/widget/main_drawer.dart';

class FilterScreen extends StatefulWidget {
  static const routeName = '/filters';
  final Function saveFilter;
  final Map<String, bool> currentFilter;
  FilterScreen(this.currentFilter, this.saveFilter);
  @override
  _FilterScreenState createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  var _glutenFree = false;
  var _vegeterian = false;
  var _vegan = false;
  var _lactosFree = false;

  @override
  initState() {
    _glutenFree = widget.currentFilter['gluten'];
    _vegeterian = widget.currentFilter['vegeterian'];
    _vegan = widget.currentFilter['vegan'];
    _lactosFree = widget.currentFilter['lactose'];
  }

  Widget buildSwitchListTile(String title, String description,
      bool currentValue, Function updateValue) {
    return SwitchListTile(
      title: Text(title),
      value: currentValue,
      subtitle: Text(description),
      onChanged: updateValue,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Filter'),
          actions: [
            IconButton(
              onPressed: () {
                final selectFilter = {
                  'gluten': _glutenFree,
                  'lactose': _lactosFree,
                  'vegeterian': _vegeterian,
                  'vegan': _vegan,
                };
                widget.saveFilter(selectFilter);
                Navigator.of(context).pushNamed('/');
              },
              icon: Icon(Icons.save),
            ),
          ],
        ),
        drawer: MainDrawer(),
        body: Column(
          children: [
            Container(
              padding: EdgeInsets.all(20),
              child: Text(
                'Select You Prefered Meal Type:',
                style: Theme.of(context).textTheme.headline6,
              ),
            ),
            Expanded(
              child: ListView(
                children: [
                  buildSwitchListTile('Gluten Free',
                      'Include Only Gluten Free Food', _glutenFree, (newValue) {
                    setState(() {
                      _glutenFree = newValue;
                    });
                  }),
                  buildSwitchListTile(
                      'Lactose Free',
                      'Include Only Lactose Free Food',
                      _lactosFree, (newValue) {
                    setState(() {
                      _lactosFree = newValue;
                    });
                  }),
                  buildSwitchListTile(
                      'Vegeterian', 'Include Only Vegeterian Food', _vegeterian,
                      (newValue) {
                    setState(() {
                      _vegeterian = newValue;
                    });
                  }),
                  buildSwitchListTile(
                      'Vegan', 'Include Only Vegan Food', _vegan, (newValue) {
                    setState(() {
                      _vegan = newValue;
                    });
                  }),
                ],
              ),
            ),
          ],
        ));
  }
}
