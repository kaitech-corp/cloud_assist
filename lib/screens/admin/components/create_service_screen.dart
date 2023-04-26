import 'package:flutter/material.dart';

import '../../../models/service_model/create_service_model.dart';
import '../../../services/firebase_functions/cloud_functions.dart';

class CreateServicesScreen extends StatelessWidget {
  const CreateServicesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<ServiceModel>>(
      future: CloudFunctions().getGcpServiceList(),
      builder:
          (BuildContext context, AsyncSnapshot<List<ServiceModel>> snapshot) {
        if (snapshot.hasData) {
          final List<ServiceModel> services = snapshot.data!;

          return ListView.builder(
            itemCount: snapshot.data!.length,
            itemBuilder: (BuildContext context, int index) {
              final ServiceModel service = services[index];
              return ExpansionTile(
                title: Text(service.category ?? ''),
                children: service.services!
                    .map((Services item) => ListTile(
                          title: Text(item.service ?? ''),
                          trailing: ElevatedButton(
                            onPressed: () => CloudFunctions()
                                .serviceDataGenerator(item.service!,
                                    service.category!, 'gcp'),
                            child: const Text('Create'),
                          ),
                        ))
                    .toList(),
              );
            },
          );
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
