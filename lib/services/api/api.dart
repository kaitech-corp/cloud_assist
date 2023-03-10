import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

import '../../models/cloud_data_model.dart';
import '../../models/gcloud_data_model/gcloud_data_model.dart';


class CloudDataAPI {
  ///API for cloud data
  Future<List<CloudData>?> getCloudData() async {
    const String url = 'https://storage.googleapis.com/api-project-371618.appspot.com/cloud_data.json';

    try {
      final http.Response response = await http.get(Uri.parse(url!));
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
        print(e.toString());
      }
    }
    return null;
  }

  ///API for gcloud data
  Future<List<GCloudData>?> getGCloudData() async {
    const String url = 'https://storage.googleapis.com/api-project-371618.appspot.com/cmd_line_cheat_sheet.json';

    try {
      final http.Response response = await http.get(Uri.parse(url!));
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
        print(e.toString());
      }
    }
    return null;
  }
}
