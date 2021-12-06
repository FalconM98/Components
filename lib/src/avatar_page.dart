import 'package:flutter/material.dart';

class AvatarPage extends StatelessWidget {
  const AvatarPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Avatar Page'),
        centerTitle: true,
        actions: <Widget>[
          Container(
            margin: EdgeInsets.only(right: 10.0),
            child: CircleAvatar(
              child: Text('PK'),
              backgroundColor: Colors.brown,
            ),
          ),
        ],
      ),
      body: Center(
        child: FadeInImage(
          image: NetworkImage(
              'https://www.muycomputer.com/wp-content/uploads/2021/08/Spider-Man.jpg'),
          placeholder: AssetImage('img/jar-loading.gif'),
          fadeInDuration: Duration(milliseconds: 600),
        ),
      ),
    );
  }
}
