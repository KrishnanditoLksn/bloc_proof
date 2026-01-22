import 'dart:convert';

Plant plantFromJson(String str) => Plant.fromJson(
    json.decode(str)
  );

String plantToJson(Plant data) => json.encode(
  data.toJson()
);

class Plant {
    int id;
    String species;
    int age;
    int habitat;

    Plant({
        required this.id,
        required this.species,
        required this.age,
        required this.habitat,
    });

    factory Plant.fromJson(Map<String, dynamic> json) => Plant(
        id: json["id"],
        species: json["species"],
        age: json["age"],
        habitat: json["habitat"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "species": species,
        "age": age,
        "habitat": habitat,
    };
}
