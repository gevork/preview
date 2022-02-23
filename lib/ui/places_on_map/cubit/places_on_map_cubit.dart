import 'package:bloc/bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:meta/meta.dart';
import 'package:notamedia/data/models/base_response.dart';
import 'package:notamedia/data/models/place/place.dart';
import 'package:notamedia/data/repositories/places/places_repository.dart';
import 'package:notamedia/data/repositories/user/user_repository.dart';
import 'package:notamedia/resource/resource_string.dart';

part 'places_on_map_state.dart';

class PlacesOnMapCubit extends Cubit<PlacesOnMapState> {
  PlacesOnMapCubit({required UserRepository userRepository})
      : _userRepository = userRepository,
        super(PlacesOnMapInitialState());

  final PlacesRepository _placesRepository = PlacesRepository();
  final UserRepository _userRepository;

  fetchPlaces() async {
    emit(PlacesOnMapLoadingState());
    var response = await _placesRepository.getPlaces();
    if (response.responseStatus == ResponseStatus.success) {
      var sortData = response.data
          ?.where((e) =>
              e.data?.general?.address?.mapPosition?.coordinates?.isNotEmpty ==
              true)
          .toList();
      if (sortData?.isNotEmpty == true) {
        emit(PlacesOnMapSuccessState(sortData!));
      } else {
        emit(const PlacesOnMapErrorState(ResourceString.notFound));
      }
    } else {
      emit(
          PlacesOnMapErrorState(response.error ?? ResourceString.defaultError));
    }
  }

  fetchUserLocation() async =>
      emit(UpdateUserPositionState(await _userRepository.fetchUserPosition()));
}
