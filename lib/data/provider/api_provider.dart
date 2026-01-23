import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:proffesor_bloc/data/model/plant.dart';

class ApiProvider {
  final _client = http.Client();
  final String baseUrl = "https://fa41d127933b.ngrok-free.app/api/v1/plants";

  Future<List<Plant?>> getPlant() async {
    final response = await _client.get(Uri.parse(baseUrl));

    if (response.statusCode == 200) {
      final body = json.decode(response.body) as List;

      return body.map((dynamic json) {
        final map = json as Map<String, dynamic>;
        return Plant(
          id: map['id'] as int,
          species: map['species'] as String,
          age: map['age'] as int,
          habitat: map['habitat'] as int,
        );
      }).toList();
    }
    throw Exception('error fetching posts');
  }
}
