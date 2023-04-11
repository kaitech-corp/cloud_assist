import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../models/cloud_data_model/cloud_data_model.dart';
import '../../../../services/ui/text_styles.dart';

class FeaturedService extends StatelessWidget {
  const FeaturedService({
    required this.cloudData,
    super.key,
  });

  final CloudData cloudData;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.goNamed('serviceDetails', extra: cloudData);
      },
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Expanded(
                  child: Text(
                    cloudData.service,
                    style: titleLarge(context)
                        ?.copyWith(fontWeight: FontWeight.bold),
                    maxLines: 2,
                  ),
                ),
                const Icon(Icons.data_object,color: Colors.blueAccent,)
              ],
            ),
            const SizedBox(
              height: 15,
            ),
            Text(
              cloudData.description,
              style: titleMedium(context),
            ),
          ],
        ),
      ),
    );
  }
}
