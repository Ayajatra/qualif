import 'package:flutter/material.dart';

import 'global.dart';

class ListDetailPage extends StatefulWidget {
  final Map<String, String> content;

  ListDetailPage(this.content);

  @override
  State<StatefulWidget> createState() => ListDetailState(content);
}

class ListDetailState extends State<ListDetailPage> with TickerProviderStateMixin {
  final Map<String, String> content;
  final TextEditingController _reviewController = TextEditingController();
  final List<Map<String, String>> reviews = [];
  late TabController _tabController;

  ListDetailState(this.content);

  @override
  void initState() {
    _tabController = TabController(
      length: 2,
      vsync: this
    );

    super.initState();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(
      title: Text("${Global.username} - List Detail"),
      bottom: TabBar(
        controller: _tabController,
        tabs: [
          Icon(Icons.info_rounded),
          Icon(Icons.reviews),
        ],
      ),
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
            },
          ),
          ListTile(
            leading: Icon(Icons.list),
            title: Text('List'),
            onTap: () {
              Navigator.popAndPushNamed(context, "/list");
            },
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
    body: TabBarView(
      controller: _tabController,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Image(
              image: AssetImage("images/${content['image']!}"),
              fit: BoxFit.fitWidth,
            ),
            Text(
              content['title']!,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              )
            ),
            Text(
              content['detail']!
            ),
            TextField(
              maxLines: 4,
              decoration: InputDecoration(
                hintText: 'Input Review',
                border: OutlineInputBorder(borderSide: BorderSide())
              ),
              controller: _reviewController,
            ),
            ElevatedButton(
              child: Text('Submit Review'),
              onPressed: () {
                if (_reviewController.text.isEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Review must not be empty'))
                  );

                  return;
                }

                setState(() {  
                  reviews.add({
                    'username': Global.username,
                    'content': _reviewController.text
                  });
                });

                _reviewController.text = '';
              },
            ),
            ElevatedButton(
              child: Text('Go Back'),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
        ListView(
          children: reviews.map((item) => Card(
            child: ListTile(
              title: Text(
                item['username']!,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Text(item['content']!),
            ),
          )).toList(),
        )
      ],
    )
  );
}