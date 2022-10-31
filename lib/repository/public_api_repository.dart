import 'dart:convert';

import 'package:flutter_task/models/public_api.dart';
import 'package:flutter_task/utils/app_constants.dart';
import 'package:http/http.dart' as http;

class PublicApiRepository {
  Future<PublicApi> getApiData() async {
    const String url = AppConstants.entriesUrl;
    final result = await http.get(Uri.parse(url));
    return parsedJson(result.body);
  }

  PublicApi parsedJson(final response) {
    final jsonProduct = json.decode(response);
    return PublicApi.fromJson(jsonProduct);
  }
}
