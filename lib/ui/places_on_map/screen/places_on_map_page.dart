import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notamedia/data/repositories/user/user_repository.dart';
import 'package:notamedia/ui/places_on_map/cubit/places_on_map_cubit.dart';
import 'package:notamedia/ui/places_on_map/screen/places_on_map_form.dart';

class PlacesOnMapPage extends StatelessWidget {
  const PlacesOnMapPage({Key? key}) : super(key: key);

  static const String routeName = '/';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PlacesOnMapCubit(
          userRepository: RepositoryProvider.of<UserRepository>(context)),
      child: const PlacesOnMapForm(),
    );
  }
}
