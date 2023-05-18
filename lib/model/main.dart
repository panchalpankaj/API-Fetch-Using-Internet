
import 'package:flutter/material.dart';
import 'package:newsapine2/model/apiService.dart';
import 'package:newsapine2/model/article.dart';
import '../UserDetailsPage.dart';
void main() {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'API Service',
      theme: ThemeData(
        primarySwatch: Colors.lightGreen,
      ),
      home: MyHomePage(id: 'flutter demo app'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.id}) : super(key: key);

  final String id;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  ApiService client = ApiService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('User Info',
            style: TextStyle(color: Colors.white, fontSize: 27)),
        brightness: Brightness.light,
        backgroundColor: Colors.cyan,
        elevation: 0.0,
      ),
      body: FutureBuilder<List<Article>>(
        future: client.getArticle(),
        builder:
            (BuildContext context, AsyncSnapshot<List<Article>> snapshot) {
          if (snapshot.hasData) {
            List<Article> data = snapshot.data!;
            return ListView.builder(
              itemCount: data.length,
              itemBuilder: (context, index) {
                Article article = data[index];
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            UserDetailsPage(article: article),
                      ),
                    );
                  },
                  child: ListTile(
                    leading: CircleAvatar(
                        backgroundImage:
                        NetworkImage(article.avatar ?? '')),
                    title: Text(
                        '${article.first_name ?? ''} ${article.last_name ?? ''}'),
                    subtitle: Text(article.email ?? ''),
                  ),
                );
              },
            );
          } else if (snapshot.hasError) {
            return Center(child: Text('${snapshot.error}'));
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
















