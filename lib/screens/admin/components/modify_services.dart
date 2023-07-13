import 'package:flutter/material.dart';
import 'package:nil/nil.dart';

import '../../../models/cloud_data_model/cloud_data_model.dart';
import '../../../services/firebase_functions/cloud_functions.dart';
import '../../../services/firebase_functions/firebase_functions.dart';
import '../../../services/navigation/navigation.dart';
import '../../../widgets/line_break.dart';

class ModifyServices extends StatefulWidget {
  const ModifyServices({super.key});

  @override
  State<ModifyServices> createState() => _ModifyServicesState();
}

class _ModifyServicesState extends State<ModifyServices> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<CloudData>>(
      future: FirestoreDatabase().getServiceData(),
      builder: (BuildContext context, AsyncSnapshot<List<CloudData>> snapshot) {
        if (snapshot.hasData) {
          final List<CloudData>? services = snapshot.data;
          return ListView.builder(
              itemCount: services?.length ?? 0,
              itemBuilder: (BuildContext context, int index) {
                final CloudData data = services?[index] ?? defaultCloudData;
                return Column(
                  children: <Widget>[
                    GestureDetector(
                      onTap: () {
                        router.pushNamed('serviceDetails', extra: data);
                      },
                      child: ListTile(
                        title: Text(data.service),
                        trailing: ElevatedButton(
                          onPressed: () {
                            showDialog(
                              context: context,
                              builder: (BuildContext context) => AlertDialog(
                                title: const Text(
                                    'Which item would you like to update?'),
                                content: SizedBox(
                                  width: double.maxFinite,
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: <Widget>[
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: <Widget>[
                                          Expanded(
                                            child: ElevatedButton(
                                              onPressed: () {
                                                CloudFunctions()
                                                    .createNewFactsManually(data.service);
                                                router.pop();
                                              },
                                              child: const Text('Fun Facts'),
                                            ),
                                          ),
                                          Expanded(
                                            child: ElevatedButton(
                                              onPressed: () {
                                                CloudFunctions()
                                                    .updateServiceField(
                                                        service: data.service,
                                                        field: 'description',
                                                        provider: data.provider);
                                                router.pop();
                                              },
                                              child: const Text('Description'),
                                            ),
                                          ),
                                          Expanded(
                                            child: ElevatedButton(
                                              onPressed: () {
                                                CloudFunctions()
                                                    .updateServiceField(
                                                        service: data.service,
                                                        field: 'benefits',
                                                        provider: data.provider);
                                                router.pop();
                                              },
                                              child: const Text('Benefits'),
                                            ),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(height: 10),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: <Widget>[
                                          Expanded(
                                            child: ElevatedButton(
                                              onPressed: () {
                                                CloudFunctions()
                                                    .updateServiceField(
                                                        service: data.service,
                                                        field: 'cons',
                                                        provider: data.provider);
                                                router.pop();
                                              },
                                              child: const Text('Cons'),
                                            ),
                                          ),
                                          Expanded(
                                            child: ElevatedButton(
                                              onPressed: () {
                                                CloudFunctions()
                                                    .updateServiceField(
                                                        service: data.service,
                                                        field: 'example',
                                                        provider: data.provider);
                                                router.pop();
                                              },
                                              child: const Text('Example'),
                                            ),
                                          ),
                                          Expanded(
                                            child: ElevatedButton(
                                              onPressed: () {
                                                CloudFunctions()
                                                    .updateServiceField(
                                                        service: data.service,
                                                        field: 'useCases',
                                                        provider: data.provider);
                                                router.pop();
                                              },
                                              child: const Text('Use Cases'),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          },
                          child: const Text('Update'),
                        ),
                      ),
                    ),
                    greyLineBreak,
                    const SizedBox(
                      height: 16,
                    )
                  ],
                );
              });
        } else {
          return nil;
        }
      },
    );
  }
}
