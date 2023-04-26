import 'package:flutter/material.dart';

import '../../services/ui/text_styles.dart';
import 'components/create_service_screen.dart';
import 'components/data_screen.dart';
import 'components/modify_services.dart';
import 'components/users_screen.dart';

class AdminScreen extends StatelessWidget {
  const AdminScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Admin Screen',
            style: headlineSmall(context),
          ),
          bottom:  TabBar(
            isScrollable: true,
        
            tabs: const <Tab>[
              Tab(text: 'Users'),
              Tab(text: 'Data'),
              Tab(text: 'Manage GCP Service'),
              Tab(text: 'Modify Service')
            ],
            labelStyle: titleMedium(context),
          ),
        ),
        body: const TabBarView(
          children: <Widget>[
            UsersScreen(),
            DataScreen(),
            CreateServicesScreen(),
            ModifyServices()
          ],
        ),
      ),
    );
  }
}
