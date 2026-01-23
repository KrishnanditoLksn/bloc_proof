import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:proffesor_bloc/data/model/plant.dart';

class ApiProvider {
  final String baseUrl = "http://10.0.2.2:8000/api/v1/plants";

  Future<Plant?> getPlant() async {
    try {
      final response = await http.get(Uri.parse(baseUrl));

      if (response.statusCode == 200) {
        final Map<String, dynamic> jsonMap =
            jsonDecode(response.body) as Map<String, dynamic>;

        return Plant.fromJson(jsonMap);
      } else {
        throw Exception('Status code: ${response.statusCode}');
      }
    } catch (error) {
      throw Exception('Failed to load plant: $error');
    }
  }
}
