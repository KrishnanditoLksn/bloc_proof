import 'package:proffesor_bloc/data/model/plant.dart';
import 'package:proffesor_bloc/data/provider/api_provider.dart';

class ApiPlantRepository {
  final _provider = ApiProvider();

  Future<Plant?> getAllPlants() async {
    return _provider.getPlant();
  }
}
