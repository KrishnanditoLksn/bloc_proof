import 'package:bloc/bloc.dart';
import 'package:proffesor_bloc/data/event/event_trigger.dart' as event_trigger;
import 'package:proffesor_bloc/data/repositories/api_plant_repository.dart';
import 'package:proffesor_bloc/data/state/home_state.dart';

class PlantHomeBlocs extends Bloc<event_trigger.PlantHomeEvent, HomeState> {
  PlantHomeBlocs() : super(PlantHomeInitial()) {
    final ApiPlantRepository repository = ApiPlantRepository();

    on<event_trigger.GetPlantList>((event, emit) async {
      try {
        emit(PlantHomeLoading());
        final datas = await repository.getAllPlants();
        emit(PlantHomeLoaded(datas!));
      } on PlantHomeError {
        emit(const PlantHomeError("An Error Occured"));
      }
    });
  }
}
