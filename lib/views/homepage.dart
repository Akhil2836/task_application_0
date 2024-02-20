import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:task_application_0/model/user_model.dart';
import 'package:task_application_0/provider/user_provider.dart';

class HomePage extends ConsumerWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userData = ref.watch(userDataProvider);
    return Scaffold(
      appBar: AppBar(
        title: Text("Riverpod Example"),
      ),
      body: userData.when(
          data: (userData) {
            List<UserModel> userList = userData.map((e) => e).toList();
            return ListView.builder(
                itemCount: userList.length,
                itemBuilder: (_, index) {
                  return Card(
                    color: Colors.blue,
                    child: ListTile(
                      leading: Text(userList[index].id!.toString()),
                      title: Text(userList[index].title!),
                      subtitle: Text(userList[index].body!),
                    ),
                  );
                });
          },
          error: (error, s) => Text(error.toString()),
          loading: () => CircularProgressIndicator()),
    );
  }
}
