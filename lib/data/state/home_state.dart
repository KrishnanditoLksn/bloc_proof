import 'package:equatable/equatable.dart';
import 'package:proffesor_bloc/data/model/plant.dart';

abstract class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object?> get props => [];
}

class PlantHomeInitial extends HomeState {}

class PlantHomeLoading extends HomeState {}

class PlantHomeLoaded extends HomeState {
  final Plant plant;
  const PlantHomeLoaded(this.plant);
}

class PlantHomeError extends HomeState {
  final String? message;
  const PlantHomeError(this.message);
}
