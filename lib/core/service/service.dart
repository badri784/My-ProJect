import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:quran_azkar/core/model/azkar_model.dart';

class Service {
  Future<List<AllAzkar>> readJson({
    required String fileName,
    required String jsonKey,
  }) async {
    final String response = await rootBundle.loadString(
      'assets/azkar/$fileName.json',
    );
    final data = json.decode(response);

    final List<dynamic> decodedData = data[jsonKey];

    return decodedData.map((item) => AllAzkar.fromJson(item)).toList();
  }
}
