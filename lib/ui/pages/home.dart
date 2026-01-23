import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:proffesor_bloc/data/blocs/plant_home_blocs.dart';
import 'package:proffesor_bloc/data/event/event_trigger.dart';
import 'package:proffesor_bloc/data/model/plant.dart';
import 'package:proffesor_bloc/data/state/home_state.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<StatefulWidget> createState() {
    return _HomeState();
  }
}

class _HomeState extends State<Home> {
  final PlantHomeBlocs _plantHomeBlocs = PlantHomeBlocs();

  @override
  void initState() {
    _plantHomeBlocs.add(GetPlantList());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home Page')),
      body: _listPlant(context),
    );
  }

  Widget _listPlant(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8.0),
      child: BlocProvider(
        create: (_) => _plantHomeBlocs,
        child: BlocBuilder<PlantHomeBlocs, HomeState>(
          builder: (context, state) {
            if (state is PlantHomeInitial) {
              return _buildLoading();
            } else if (state is PlantHomeLoading) {
              return _buildLoading();
            } else if (state is PlantHomeLoaded) {
              return _cardItem(context, state.plant);
            } else if (state is PlantHomeError) {
              return Container();
            } else {
              return Container();
            }
          },
        ),
      ),
    );
  }

  Widget _cardItem(BuildContext context, List<Plant?> plant) {
    return ListView.builder(
      itemCount: plant.length,
      itemBuilder: (context, index) {
        final p = plant[index];
        return ListTile(
          title: Text(p!.species),
          subtitle: Text(p.age.toString()),
        );
      },
    );
  }

  Widget _buildLoading() => const Center(child: CircularProgressIndicator());
}
