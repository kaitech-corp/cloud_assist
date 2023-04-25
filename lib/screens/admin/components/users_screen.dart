import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../../models/user_model/user_model.dart';
import '../../../services/firebase_functions/firebase_functions.dart';
import '../../../services/service_config/service_config.dart';
import '../../../services/ui/text_styles.dart';

class UsersScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<UserModel>?>(
      future: FirestoreDatabase().getUsers(),
      builder:
          (BuildContext context, AsyncSnapshot<List<UserModel>?> snapshot) {
        if (snapshot.hasData) {
          List<UserModel>? users = snapshot.data;
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
      children: [
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
            children: [
              _buildStatCard(
                context,
                'Total Users',
                users.length.toString(),
              ),
              _buildStatCard(
                context,
                'New Users (Last 7 Days)',
                '3',
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
          child: _buildChart(),
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
          children: [
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

  Widget _buildChart() {
    return SfCartesianChart(
      primaryXAxis: DateTimeAxis(),
      series: <ChartSeries>[
        LineSeries<UserData, DateTime>(
          dataSource: _createData(),
          xValueMapper: (UserData user, _) => user.date,
          yValueMapper: (UserData user, _) => user.count,
        ),
      ],
    );
  }

  List<UserData> _createData() {
    final DateTime now = DateTime.now();
    return [
      UserData(now.subtract(const Duration(days: 30)), 10),
      UserData(now.subtract(const Duration(days: 25)), 8),
      UserData(now.subtract(const Duration(days: 20)), 15),
      UserData(now.subtract(const Duration(days: 15)), 12),
      UserData(now.subtract(const Duration(days: 10)), 18),
      UserData(now.subtract(const Duration(days: 5)), 20),
      UserData(now, 25),
    ];
  }
}

class UserData {
  final DateTime date;
  final int count;

  UserData(this.date, this.count);
}
