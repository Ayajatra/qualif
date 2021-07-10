import 'package:flutter/material.dart';

import 'global.dart';

class ListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(
      title: Text("${Global.username} - List"),
    ),
    drawer: Drawer(
      child: ListView(
        // padding: EdgeInsets.zero,
        children: [
          ListTile(
            leading: Icon(Icons.home),
            title: Text('Home'),
            onTap: () {
              Navigator.popAndPushNamed(context, "/home");
            }
          ),
          ListTile(
            leading: Icon(Icons.list),
            title: Text('List'),
            selected: true,
          ),
          ListTile(
            leading: Icon(Icons.logout),
            title: Text('Logout'),
            onTap: () {
              Navigator.popAndPushNamed(context, "/login");
            },
          ),
        ],
      ),
    ),
    body: ListView(
      children: [
        {
          'title': 'Work Ethics',
          'image': '1.jpg',
          'detail': 'Work Ethics is something that is important duh.',
        },
        {
          'title': 'Meeting Ethics',
          'image': '2.jpg',
          'detail': 'When we are in a meeting we must smile to ease tension with our coworker.',
        },
        {
          'title': 'Stock Market Ethics',
          'image': '3.jpg',
          'detail': 'When diving into stock market, we first need to know the ethics in stock market community.',
        },
      ].map((data) => Card(
          child: ListTile(
            leading: Image(
              image: AssetImage("images/${data['image']!}"),
            ),
            title: Text(data['title']!),
            onTap: () {
              Navigator.pushNamed(
                context,
                '/listdetail',
                arguments: data
              );
            }
          ),
      )).toList(),
    )
  );
}