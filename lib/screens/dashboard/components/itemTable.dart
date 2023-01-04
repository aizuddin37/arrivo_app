import 'dart:convert';
import 'package:admin/cubit/table_cubit.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../../../constants.dart';
import '../../../models/user.dart';

// ignore: must_be_immutable
class TableView extends StatefulWidget {
  TableView({Key? key}) : super(key: key);

  @override
  State<TableView> createState() => _TableViewState();
}

class _TableViewState extends State<TableView> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TableCubit()..init(),
      child: Container(
        decoration: BoxDecoration(
          color: secondaryColor,
          borderRadius: const BorderRadius.all(Radius.circular(5)),
        ),
        child: BlocBuilder<TableCubit, TableState>(
          builder: (context, state) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  children: [
                    SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "  User List",
                          style: Theme.of(context).textTheme.headline5,
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Theme(
                  data: Theme.of(context).copyWith(
                    cardColor: secondaryColor,
                    dividerColor: bgColor,
                  ),
                  child: SizedBox(
                    height: 750,
                    width: double.infinity,
                    child: PaginatedDataTable2(
                      source: getUser(state.user),
                      columnSpacing: 5,
                      horizontalMargin: 5,
                      rowsPerPage: 30,
                      columns: <DataColumn>[
                        DataColumn(
                          label: Text("User ID"),
                        ),
                        DataColumn(
                          label: Text("Id"),
                        ),
                        DataColumn(
                          label: Text("Title"),
                        ),
                        DataColumn(
                          label: Text("Body"),
                        ),
                        // DataColumn(
                        //   label: Text("Order Item ID"),
                        // ),
                        // DataColumn(
                        //   label: Text("SKU"),
                        // ),
                        // DataColumn(
                        //   label: Text("Country"),
                        // ),
                      ],
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}

class getUser extends DataTableSource {
  List<User> _data;
  getUser(this._data);

  @override
  DataRow? getRow(int index) {
    return DataRow.byIndex(index: index, cells: [
      DataCell(Text(_data[index].userId.toString())),
      DataCell(Text(_data[index].id.toString())),
      DataCell(Text(_data[index].title.toString())),
      DataCell(Text(_data[index].body.toString())),
    ]);
  }

  @override
  // TODO: implement isRowCountApproximate
  bool get isRowCountApproximate => false;

  @override
  // TODO: implement rowCount
  int get rowCount => _data.length;

  @override
  // TODO: implement selectedRowCount
  int get selectedRowCount => 0;
}
