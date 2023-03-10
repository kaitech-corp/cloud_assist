import 'package:flutter/material.dart';

import '../../../services/service_config/service_config.dart';
import '../../services/ui/text_styles.dart';
import '../tabs/command_lines.dart';
import '../tabs/databases.dart';
import '../tabs/networking.dart';
import '../tabs/services.dart';
import 'components/featured_service_widget.dart';
import 'components/quick_fact_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SizedBox(
          height: SizeConfig.screenHeight,
          width: SizeConfig.screenWidth,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(
                    top: 8.0, bottom: 16.0, left: 8.0, right: 8.0),
                child: Text(
                  'Cloud Assist',
                  style: headlineMedium(context),
                ),
              ),
              const Expanded(child: TabControllerWidget()),
            ],
          ),
        ),
      ),
    );
  }
}

class TabControllerWidget extends StatelessWidget {
  const TabControllerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 5,
        child: Column(
          children: <Widget>[
            TabBar(
              tabs: const <Widget>[
                Text('Home'),
                Text('Services'),
                Text('Databases'),
                Text('Networking'),
                Text('Command Lines'),
              ],
              isScrollable: true,
              labelStyle: titleMedium(context),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 16.0),
              child: Container(height: 2, color: Colors.grey),
            ),
            Expanded(
              child: TabBarView(
                children: <Widget>[
                  Column(
                    children: const <Widget>[
                      Expanded(child: QuickFactWidget()),
                      Expanded(flex: 2, child: FeaturedServiceWidget())
                    ],
                  ),
                  const SearchServices(),
                  const DatabaseServices(),
                  const NetworkingServices(),
                  const GCloudScreen(),
                ],
              ),
            )
          ],
        ));
  }
}
