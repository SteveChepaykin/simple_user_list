import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:simple_users_list/controllers/https_controller.dart';
import 'package:simple_users_list/controllers/login_controller.dart';
import 'package:simple_users_list/models/randomuser_model.dart';
import 'package:simple_users_list/screens/details_screen.dart';

class UserListScreen extends StatefulWidget {
  const UserListScreen({super.key});

  @override
  State<UserListScreen> createState() => _UserListScreenState();
}

class _UserListScreenState extends State<UserListScreen> {
  bool isSearching = false;
  bool refresh = false;

  TextEditingController querycont = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(Get.find<LoginController>().loginName!),
        actions: [
          IconButton(
            onPressed: () {
              setState(() {
                isSearching = !isSearching;
              });
            },
            icon: const Icon(Icons.search_rounded),
          ),
          IconButton(
            onPressed: () {
              Get.find<LoginController>().logout();
            },
            icon: const Icon(Icons.logout_rounded),
          ),
        ],
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          setState(() {
            refresh = true;
          });
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20,),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (isSearching)
                TextField(
                  controller: querycont,
                  onChanged: (value) {
                    setState(() {});
                  },
                ),
              FutureBuilder<List<RandomuserModel>>(
                future: getUsers(),
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  List<RandomuserModel> querylist = snapshot.data!;
                  if (isSearching && querycont.text != '') {
                    querylist = querylist
                        .where(
                          (element) => element.firstname.contains(querycont.text),
                        )
                        .toList();
                  }
                  return Expanded(
                    child: ListView(
                      children: [
                        ...querylist.map(
                          (e) => ListTile(
                            title: Text("${e.firstname} ${e.secondname}"),
                            onTap: () {
                              Get.to(
                                () => DetailsScreen(
                                  character: e,
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<List<RandomuserModel>> getUsers() async {
    var res = await Get.find<HttpsController>().getRandomUsersList(refresh);
    refresh = false;
    return res;
  }
}
