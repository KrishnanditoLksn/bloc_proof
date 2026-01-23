import 'package:equatable/equatable.dart';
final class Plant extends Equatable {
  final int id;
  final String species;
  final int age;
  final int habitat;

  const Plant({
    required this.id,
    required this.species,
    required this.age,
    required this.habitat,
  });

  @override
  List<Object?> get props => [];
}
