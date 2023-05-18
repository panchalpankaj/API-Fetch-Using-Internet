import 'dart:convert';
import 'package:http/http.dart';
import 'package:newsapine2/model/article.dart';

class ApiService{
  final endPointUrl ="https://reqres.in/api/users?page=2";
  Future<List<Article>> getArticle() async{
    Response response=await get(Uri.parse(endPointUrl));
    if(response.statusCode==200){
      Map<String,dynamic> json=jsonDecode(response.body);
      List<dynamic> body=json['data'];
      List<Article> data =body.map((dynamic item) => Article.fromjson(item)).toList();
      return data;
    }else{
      throw ("Data not found");
    }
  }
}