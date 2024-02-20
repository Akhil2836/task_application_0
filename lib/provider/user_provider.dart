import 'package:riverpod/riverpod.dart';
import 'package:task_application_0/model/user_model.dart';
import 'package:task_application_0/services/api_service.dart';

final userDataProvider= FutureProvider<List<UserModel>>((ref)async{
  return ref.watch(postProvider).getPosts();
});