import 'package:flutter/material.dart';

import '../../../../models/cloud_data_model/cloud_data_model.dart';
import '../../../../services/constants.dart';
import '../../../../services/service_config/service_config.dart';
import '../../../../services/ui/text_styles.dart';
import '../../../tabs/ai.dart';

class QuickLinkList extends StatefulWidget {
  const QuickLinkList
({super.key});

  @override
  State<QuickLinkList> createState() => _QuickLinkListState();
}

class _QuickLinkListState extends State<QuickLinkList> {
  String? selectedLink;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Quick Links',style: headlineSmall(context),),
      ),
      body: SizedBox(
        width: SizeConfig.screenWidth,
        height: SizeConfig.screenHeight,
        child: AnimatedSwitcher(
          duration: const Duration(milliseconds: 500),
          child: selectedLink == null
              ? GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2, // Two columns
                  ),
                  itemCount: quickLinks.length,
                  itemBuilder: (BuildContext context, int index) {
                    return ListTile(
                      title: Text(quickLinks[index]),
                      onTap: () {
                        setState(() {
                          selectedLink = quickLinks[index];
                        });
                      },
                    );
                  },
                )
              : AnotherListWidget(selectedLink: selectedLink!),
        ),
      ),
    );
  }
}

class AnotherListWidget extends StatelessWidget {

  const AnotherListWidget({super.key, required this.selectedLink});
  final String selectedLink;

  @override
  Widget build(BuildContext context) {
    return AIServices(cloudData: [defaultCloudData,defaultCloudData]);
  }
}