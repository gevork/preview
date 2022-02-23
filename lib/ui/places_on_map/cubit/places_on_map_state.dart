part of 'places_on_map_cubit.dart';

@immutable
abstract class PlacesOnMapState {
  const PlacesOnMapState();
}

class PlacesOnMapInitialState extends PlacesOnMapState {}

class PlacesOnMapLoadingState extends PlacesOnMapState {}

class PlacesOnMapSuccessState extends PlacesOnMapState {
  const PlacesOnMapSuccessState(this.places);

  final List<Place> places;
}

class PlacesOnMapErrorState extends PlacesOnMapState {
  const PlacesOnMapErrorState(this.error);

  final String error;
}

class UpdateUserPositionState extends PlacesOnMapState {
  const UpdateUserPositionState(this.position);

  final Position position;
}
