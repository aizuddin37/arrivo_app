import 'package:admin/responsive.dart';
import 'package:admin/screens/dashboard/components/itemTable.dart';
import 'package:admin/shared/ui.dart';
import 'package:flutter/material.dart';
import '../../constants.dart';
import 'components/header.dart';

class DashboardScreen extends StatelessWidget {
  static const String routeName = 'dashboard-screen';

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        padding: EdgeInsets.all(defaultPadding),
        child: Column(
          children: [
            Header(),
            SizedBox(height: defaultPadding),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 5,
                  child: Column(
                    children: [
                      // MyFiles(),
                      SizedBox(height: defaultPadding),
                      UIHelper.verticalSpaceMedium(),
                      TableView(),
                    ],
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
