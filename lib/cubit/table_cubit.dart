import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../models/user.dart';
import 'app_state.dart';

part 'table_state.dart';

class TableCubit extends Cubit<TableState> {
  late final List<User>? user;

  TableCubit({this.user})
      : super(TableState(isLoading: false, isInitialize: false, user: [])) {
    init();
  }

  init() {
    _getData();
    return Future.value();
  }

  Future<List<User>?> _getData() async {
    emit(state.copyWith(isLoading: true));
    List<User>? list;

    try {
      var uri = Uri.parse('https://jsonplaceholder.typicode.com/posts');

      var response = await http.get(uri);
      print("response:" + "${response.statusCode}");

      final respBody = json.decode(response.body);
      // parse only for data part
      if (response.statusCode == 200) {
        final List<dynamic> data = respBody;

        list = List<User>.from(data.map((x) => User.fromJson(x)));
        print(list);

        emit(state.copyWith(user: list, isLoading: false));
      }
    } catch (error) {
      print(error);
    }
  }
}
