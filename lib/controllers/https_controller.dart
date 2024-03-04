import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:simple_users_list/models/randomuser_model.dart';

class HttpsController extends GetxController {
  final Dio dio = Dio();

  List<RandomuserModel> userlist = [];

  Future<List<RandomuserModel>> getRandomUsersList(bool forceRefresh) async {
    if (userlist.isNotEmpty && !forceRefresh) {
      return userlist;
    }
    var res = await dio.getUri<Map<String, dynamic>>(
      Uri.parse("https://randomuser.me/api/?results=10"),
      options: Options(
        contentType: 'json',
      ),
    );
    var js = res.data!;
    // var list = (js["results"] as List<Map<String, dynamic>>);
    userlist = (js["results"] as List<dynamic>).map((e) => RandomuserModel.fromMap(e['login']['uuid'], e)).toList();
    return userlist;
  }
}
