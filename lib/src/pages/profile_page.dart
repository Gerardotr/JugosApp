import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile Page'),
        actions: <Widget>[
        Container(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: CircleAvatar(
            child: Image(
              image: NetworkImage(
                  'https://cdn4.iconfinder.com/data/icons/avatars-xmas-giveaway/128/girl_avatar_child_kid-512.png'),
            ),
          ),
        )
      ],
      ),
      backgroundColor: Theme.of(context).primaryColor,
      body: Center(
        child: Container(
          child: Container(
            height: 150,
            width: 150,
            child: CircleAvatar(
              backgroundColor: Theme.of(context).accentColor,
              child: FadeInImage(
                placeholder: AssetImage('assets/loading.gif'),
                fit: BoxFit.cover,
                image: NetworkImage('https://cdn4.iconfinder.com/data/icons/avatars-xmas-giveaway/128/girl_avatar_child_kid-512.png'),
              ),
            ),
          ),
        ),
      ),
    );
  }
}