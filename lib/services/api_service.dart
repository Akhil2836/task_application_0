import 'dart:convert';
import 'package:http/http.dart';
import 'package:task_application_0/model/user_model.dart';
import 'package:riverpod/riverpod.dart';


class ApiServices{
  String postUrl = "https://jsonplaceholder.typicode.com/posts";

Future<List<UserModel>> getPosts()async{
  Response response = await get(Uri.parse(postUrl));
  if(response.statusCode ==200){
    final List result = jsonDecode(response.body);
    return result.map((e) => UserModel.fromJson(e)).toList(); 
  }else{
    throw Exception(response.statusCode);
  }
}
}

final postProvider = Provider<ApiServices>((ref)=>ApiServices());