import 'package:flutter/material.dart';
import '../widgets/main_drawer.dart';

class FilterScreen extends StatefulWidget {
  static const routeName = 'filter-screen';

  Function _filterFunction;

  Map<String,bool> my_settings;

  FilterScreen(this._filterFunction, this.my_settings);

  @override
  State<StatefulWidget> createState() {
    return _FilterScreenState();
  }

}

class _FilterScreenState extends State<FilterScreen>{

  late bool _glutenFree = false;
  late bool _lactoseFree = false;
  late bool _isVegan = false;
  late bool _vegetarian = false;

  @override
  void initState() {
    // TODO: implement initState
    print(widget.my_settings['gluten']);
    _glutenFree = widget.my_settings['gluten']!;
    _vegetarian = widget.my_settings['vegetarian']!;
    _lactoseFree = widget.my_settings['lactose']!;
    _isVegan = widget.my_settings['vegan']!;
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    Widget markWidget(String title_text, String sub_title, bool current_value, bool changing_value) {
      return SwitchListTile(value: current_value,
          title: Text(title_text),
          subtitle: Text(sub_title),
          onChanged: (bool new_value){
            setState(() {
              current_value = new_value;
            });
          }
      );
    }

    void setFilters()
    {
      Map<String, bool> new_map = {
        'gluten' : _glutenFree,
        'lactose' : _lactoseFree,
        'vegan' : _isVegan,
        'vegetarian' : _vegetarian
      };

      widget._filterFunction(new_map);

    }
    return Scaffold(
      appBar: AppBar(title: Text('Your Filters'),centerTitle: true, actions: [IconButton(onPressed: () => setFilters(), icon: Icon(Icons.save))],),
      drawer: MainDrawer(),
      body: Container(

        child: Column(children: [
          Text('Setup your filters'),
          Expanded(
            child: ListView(
              children: [

                SwitchListTile(value: _glutenFree,
                    title: Text('Glutton Free'),
                    subtitle: Text('Only include gluten - free meals'),
                    onChanged: (bool new_value){
                      setState(() {
                        _glutenFree = new_value;
                      });
                    }
                ),

                SwitchListTile(value: _lactoseFree,
                    title: Text('Lactose Free'),
                    subtitle: Text('Only include lactose - free meals'),
                    onChanged: (bool new_value){
                      setState(() {
                        _lactoseFree = new_value;
                      });
                    }
                ),

                SwitchListTile(value: _isVegan,
                    title: Text('Vegan Foods'),
                    subtitle: Text('Only include Vegan meals'),
                    onChanged: (bool new_value){
                      setState(() {
                        _isVegan = new_value;
                      });
                    }
                ),

                SwitchListTile(value: _vegetarian,
                    title: Text('Vegetarian'),
                    subtitle: Text('Only include Vegetarian meals'),
                    onChanged: (bool new_value){
                      setState(() {
                        _vegetarian = new_value;
                      });
                    }
                ),
              ],
            ),
          )
        ],),
      ),
    );
  }

}
