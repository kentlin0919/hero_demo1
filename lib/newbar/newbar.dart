import 'package:flutter/material.dart';

class Navbar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: ListView(padding: EdgeInsets.zero, children: [
      UserAccountsDrawerHeader(
        accountName: Text(
          'kent',
          style: TextStyle(color: Colors.white),
        ),
        accountEmail: Text(
          "kent.com",
          style: TextStyle(color: Colors.white),
        ),
        currentAccountPicture: CircleAvatar(
          child: ClipOval(
            child: Image.network(
              'https://yoti.life/wp-content/uploads/20160427221651_48.jpg',
              width: 90,
              height: 90,
              fit: BoxFit.cover,
            ),
          ),
        ),
        decoration: BoxDecoration(
          color: Colors.blue,
          image: DecorationImage(
            image: NetworkImage(
              'https://rimage.gnst.jp/livejapan.com/public/article/detail/a/00/00/a0000276/img/basic/a0000276_main.jpg?20170427165412&q=80',
            ),
            fit: BoxFit.cover,
          ),
        ),
      ),
      ListTile(
        leading: Icon(Icons.account_box),
        title: Text('Account'),
        onTap: () => print("ACC"),
      ),
      ListTile(
        leading: Icon(Icons.settings),
        title: Text('settings'),
        onTap: () => print("settings"),
      ),
      ListTile(
        leading: Icon(Icons.favorite_border),
        title: Text('image'),
        onTap: () => print("pp"),
      ),
      ListTile(
        leading: Icon(Icons.favorite_border),
        title: Text('image'),
        onTap: () => print("pp"),
      ),
      ListTile(
        leading: Icon(Icons.favorite_border),
        title: Text('image'),
        onTap: () => print("pp"),
      ),
    ]));
  }
}
