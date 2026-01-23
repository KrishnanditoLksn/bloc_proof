import 'package:equatable/equatable.dart';


abstract class PlantHomeEvent extends Equatable {
  const PlantHomeEvent();

  @override
  List<Object?> get props => [];
}

class GetPlantList extends PlantHomeEvent{}