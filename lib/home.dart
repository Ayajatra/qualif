import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:qualif/global.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(
      title: Text("${Global.username} - Home"),
      actions: [
        PopupMenuButton<String>(
          child: Icon(Icons.color_lens),
          onSelected: (theme) {
            Global.globalState.setState(() {
              if (theme == "Light") {
                Global.globalState.theme = ThemeMode.light;
              } else {
                Global.globalState.theme = ThemeMode.dark;
              }
            });
          },
          itemBuilder: (context) => [
            PopupMenuItem(
              child: Text('Light'),
              value: 'Light',
            ),
            PopupMenuItem(
              child: Text('Dark'),
              value: 'Dark',
            ),
          ],
        )
      ],
    ),
    drawer: Drawer(
      child: ListView(
        // padding: EdgeInsets.zero,
        children: [
          ListTile(
            leading: Icon(Icons.home),
            title: Text('Home'),
            selected: true,
          ),
          ListTile(
            leading: Icon(Icons.list),
            title: Text('List'),
            onTap: () {
              Navigator.popAndPushNamed(context, "/list");
            }
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
    body: SafeArea(
      child: Column(
        children: [
          CarouselSlider(
            options: CarouselOptions(
              autoPlay: true,
            ),
            items: [
              "1.jpg",
              "2.jpg",
              "3.jpg",
            ].map((item) => Builder(
              builder: (context) => Image(
                image: AssetImage("images/$item")
              ),
            )).toList()
          ),
          Text(
            'Aperture Media',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16
            )
          ),
          Text('Hello! We are here to write about business.')
        ],
      )
    )
  );
}
