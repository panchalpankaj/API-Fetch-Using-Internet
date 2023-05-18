import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:newsapine2/model/article.dart';

class UserDetailsPage extends StatelessWidget {
  final Article article;

  const UserDetailsPage({Key? key, required this.article}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'User Info',
          style: TextStyle(color: Colors.white, fontSize: 27),
        ),
        brightness: Brightness.light,
        backgroundColor: Colors.cyan,
        elevation: 0.0,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: Image.network(
                article.avatar ?? '',
                height: 120,
                width: 120,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(height: 20),
            Text(
              '${article.first_name ??''} ${article.last_name ?? ''}',
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 10),
            Text(article.email??''),
          ],
        ),
      ),
    );
  }
}