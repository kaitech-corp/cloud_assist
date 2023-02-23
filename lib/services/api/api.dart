import 'dart:convert';
import 'dart:math';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

import '../../models/cloud_data_model/cloud_data_model.dart';
import '../../models/gcloud_data_model/gcloud_data_model.dart';

class CloudDataAPI {
  ///API for cloud data
  Future<List<CloudData>?> getCloudData() async {
    const String url =
        'https://storage.googleapis.com/api-project-371618.appspot.com/cloud_data.json';

    try {
      final http.Response response = await http.get(Uri.parse(url));
      if (200 == response.statusCode) {
        final dynamic result = json.decode(utf8.decode(response.bodyBytes));
        final Iterable<dynamic> list = result as Iterable<dynamic>;
        final List<CloudData> cloudData = list
            .map((dynamic e) => CloudData.fromJson(e as Map<String, Object?>))
            .toList();
        return cloudData;
      } else {
        return null;
      }
    } on Exception catch (e) {
      if (kDebugMode) {
        // ignore: noop_primitive_operations
        print('Error in cloud data api call: ${e.toString()}');
      }
    }
    return null;
  }

  ///API for gcloud data
  Future<List<GCloudData>?> getGCloudData() async {
    const String url =
        'https://storage.googleapis.com/api-project-371618.appspot.com/cmd_line_cheat_sheet.json';

    try {
      final http.Response response = await http.get(Uri.parse(url));
      if (200 == response.statusCode) {
        final dynamic result = json.decode(utf8.decode(response.bodyBytes));
        final Iterable<dynamic> list = result as Iterable<dynamic>;
        final List<GCloudData> gcloudData = list
            .map((dynamic e) => GCloudData.fromJson(e as Map<String, Object?>))
            .toList();
        return gcloudData;
      } else {
        return null;
      }
    } on Exception catch (e) {
      if (kDebugMode) {
        // ignore: noop_primitive_operations
        print('Error in gcloud data api call: ${e.toString()}');
      }
    }
    return null;
  }

  ///API for quick facts
  Future<List<String>?> getQuickFactData() async {
    const String url =
        'https://storage.googleapis.com/api-project-371618.appspot.com/facts.json';

    try {
      final http.Response response = await http.get(Uri.parse(url));
      if (200 == response.statusCode) {
        final dynamic result = json.decode(utf8.decode(response.bodyBytes));
        final List<String> factData = (result as Iterable<dynamic>)
            // ignore: avoid_dynamic_calls
            .map((dynamic e) => e['Fact'] as String)
            .toList();
        //Only return three facts randomly chosen
        final Random random = Random();
        final List<String> selectedFacts = <String>[];
        for (int i = 0; i < 3; i++) {
          selectedFacts.add(factData[random.nextInt(factData.length - 1)]);
        }
        return selectedFacts;
      } else {
        return null;
      }
    } on Exception catch (e) {
      if (kDebugMode) {
        // ignore: noop_primitive_operations
        print('Error in fact data api call: ${e.toString()}');
      }
    }
    return null;
  }
}
