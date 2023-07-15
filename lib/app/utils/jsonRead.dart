import 'dart:convert' as convert;
import 'package:flutter/services.dart' show rootBundle;

Future<Map<String, dynamic>?> readJsonFile(String filePath) async {
  try {
    // Read the contents of the JSON file
    String contents = await rootBundle.loadString(filePath);

    // Parse the JSON data
    Map<String, dynamic> jsonData = convert.jsonDecode(contents);

    // Return the parsed JSON data
    return jsonData;
  } catch (e) {
    print('Error reading JSON file: $e');
    return null;
  }
}