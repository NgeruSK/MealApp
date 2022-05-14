import 'package:flutter/material.dart';
import '../screens/filter_screen.dart';
import '../screens/screen_dashboard.dart';

import '../main.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({Key? key}) : super(key: key);

  Widget buildRow(String title, IconData icon,Function onTapHandler)
  {
    return ListTile(leading: Icon(icon, size: 26),
      title: Text(title, style: TextStyle(fontSize: 23),),
      onTap: () => onTapHandler(),
    );
  }
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            height: 120,
            width: double.infinity,
            padding: EdgeInsets.all(20),
            alignment: Alignment.centerLeft,

            child: Text('Dev Ongoing', style: TextStyle(fontWeight: FontWeight.w900, fontSize: 26),
            ),
          ),
          buildRow('Meals', Icons.restaurant, (){
            Navigator.of(context).pushNamed(DashBoard.routeName);
          }),
          buildRow('Filter', Icons.settings, (){
            Navigator.of(context).pushNamed(FilterScreen.routeName);
          }),
          buildRow('Logout', Icons.logout, (){
            Navigator.of(context).pushReplacementNamed(MyApp.routeName);
          }),
        ],
      ),
    );
  }
}
