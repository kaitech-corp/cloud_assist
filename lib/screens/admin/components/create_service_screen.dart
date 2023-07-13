import 'dart:async';

import 'package:flutter/material.dart';

import '../../../models/service_model/create_service_model.dart';
import '../../../services/firebase_functions/cloud_functions.dart';

class CreateServicesScreen extends StatefulWidget {
  const CreateServicesScreen({super.key});

  @override
  State<CreateServicesScreen> createState() => _CreateServicesScreenState();
}

class _CreateServicesScreenState extends State<CreateServicesScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        bottom: TabBar(
          controller: _tabController,
          tabs: const <Tab>[
            Tab(text: 'GCP'),
            Tab(text: 'AWS'),
            Tab(text: 'Azure'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: <Widget>[
          ServiceListWidget(
              future: CloudFunctions().getGcpServiceList(), provider: 'GCP'),
          ServiceListWidget(
              future: CloudFunctions().getAWSServiceList(), provider: 'AWS'),
          ServiceListWidget(
              future: CloudFunctions().getAzureServiceList(), provider: 'Azure')
        ],
      ),
    );
  }
}

class ServiceListWidget extends StatelessWidget {
  const ServiceListWidget({
    super.key,
    required this.future,
    required this.provider,
  });

  final Future<List<ServiceModel>> future;
  final String provider;

void createAllServices(List<ServiceModel> services, String provider) {
  // services.forEach((ServiceModel element) {
  //   String category = element.category!;
  //   element.services!.forEach((Services item) {
  //     Timer.periodic(const Duration(seconds: 35), (Timer timer) {
  //       CloudFunctions().serviceDataGenerator(
  //         item.service!,
  //         category,
  //         provider,
  //       );
  //     });
  //   });
  // });
}


  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<ServiceModel>>(
      future: future,
      builder:
          (BuildContext context, AsyncSnapshot<List<ServiceModel>> snapshot) {
        if (snapshot.hasData) {
          final List<ServiceModel> services = snapshot.data!;

          return Column(
            children: <Widget>[
              Expanded(
                child: ListView.builder(
                  itemCount: snapshot.data!.length,
                  itemBuilder: (BuildContext context, int index) {
                    final ServiceModel service = services[index];
                    return ExpansionTile(
                      title: Text(service.category ?? ''),
                      children: service.services!
                          .map((Services item) => ListTile(
                                title: Text(item.service ?? ''),
                                trailing: ElevatedButton(
                                  onPressed: () =>
                                      CloudFunctions().serviceDataGenerator(
                                    item.service!,
                                    service.category!,
                                    provider,
                                  ),
                                  child: const Text('Create'),
                                ),
                              ))
                          .toList(),
                    );
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 16.0),
                child: ElevatedButton(
                  onPressed: () {
                    createAllServices(services, provider);
                  },
                  child: const Text('Create All'),
                ),
              ),
            ],
          );
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
