import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../../models/user_model/user_model.dart';
import '../../../services/firebase_functions/firebase_functions.dart';
import '../../../services/service_config/service_config.dart';
import '../../../services/ui/text_styles.dart';
import '../logic/logic.dart';

class UsersScreen extends StatelessWidget {
  const UsersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<UserModel>?>(
      future: FirestoreDatabase().getUsers(),
      builder:
          (BuildContext context, AsyncSnapshot<List<UserModel>?> snapshot) {
        if (snapshot.hasData) {
          final List<UserModel>? users = snapshot.data;
          return StatisticsScreen(
            users: users!,
          );
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}

class StatisticsScreen extends StatelessWidget {
  const StatisticsScreen({super.key, required this.users});

  final List<UserModel> users;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(
            'User Statistics',
            style: titleLarge(context),
          ),
        ),
        SizedBox(
          height: SizeConfig.screenHeight * .2,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              _buildStatCard(
                context,
                'Total Users',
                users.length.toString(),
              ),
              _buildStatCard(
                context,
                'New Users (Last 7 Days)',
                '${getUserCount(users,DateTime.now().subtract(const Duration(days: 30)))}',
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(
            'New Users (Last 30 Days)',
            style: titleLarge(context),
          ),
        ),
        Expanded(
          child: _buildChart(users),
        ),
      ],
    );
  }

  Widget _buildStatCard(BuildContext context, String title, String value) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              title,
              style: titleSmall(context),
            ),
            const SizedBox(height: 8),
            Text(
              value,
              style: titleLarge(context),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildChart(List<UserModel> userlist) {
    return SfCartesianChart(
      primaryXAxis: DateTimeAxis(),
      series: <ChartSeries<dynamic,dynamic>>[
        BarSeries<UserData, DateTime>(
          dataSource: _createData(userlist),
          xValueMapper: (UserData user, _) => user.date,
          yValueMapper: (UserData user, _) => user.count,
        ),
      ],
    );
  }

  List<UserData> _createData(List<UserModel> userlist) {
    final DateTime now = DateTime.now();
    return <UserData>[
      UserData(now.subtract(const Duration(days: 30)), getUserCount(userlist,now.subtract(const Duration(days: 30)))),
      UserData(now.subtract(const Duration(days: 25)), getUserCount(userlist,now.subtract(const Duration(days: 25)))),
      UserData(now.subtract(const Duration(days: 20)), getUserCount(userlist,now.subtract(const Duration(days: 20)))),
      UserData(now.subtract(const Duration(days: 15)), getUserCount(userlist,now.subtract(const Duration(days: 15)))),
      UserData(now.subtract(const Duration(days: 10)), getUserCount(userlist,now.subtract(const Duration(days: 10)))),
      UserData(now.subtract(const Duration(days: 5)), getUserCount(userlist,now.subtract(const Duration(days: 5)))),
      UserData(now, 25),
    ];
  }
}


