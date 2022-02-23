import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notamedia/data/models/place/place.dart';
import 'package:notamedia/resource/resource_string.dart';
import 'package:notamedia/ui/places_on_map/cubit/places_on_map_cubit.dart';
import 'package:notamedia/ui/places_on_map/sheets/place_info.dart';
import 'package:notamedia/ui/places_on_map/widgets/bottom_loader.dart';
import 'package:yandex_mapkit/yandex_mapkit.dart';

const double _defaultMapZoom = 12.0;
const double _pointZoom = 18.0;

class PlacesOnMapForm extends StatefulWidget {
  const PlacesOnMapForm({Key? key}) : super(key: key);

  @override
  State<PlacesOnMapForm> createState() => _PlacesOnMapFormState();
}

class _PlacesOnMapFormState extends State<PlacesOnMapForm> {
  late final YandexMapController? _mapController;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void dispose() {
    _mapController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        actions: _buildActions,
      ),
      body: BlocListener<PlacesOnMapCubit, PlacesOnMapState>(
        listener: _stateHandler,
        child: Stack(
          children: [
            _buildMap,
            _buildBottomLoading,
          ],
        ),
      ),
    );
  }

  List<Widget> get _buildActions => [
        IconButton(
            onPressed: () => _fetchData(), icon: const Icon(Icons.refresh)),
        IconButton(
            onPressed: () =>
                context.read<PlacesOnMapCubit>().fetchUserLocation(),
            icon: const Icon(Icons.my_location)),
      ];

  Widget get _buildMap {
    return BlocBuilder<PlacesOnMapCubit, PlacesOnMapState>(
      buildWhen: (previous, current) => current is PlacesOnMapSuccessState,
      builder: (context, state) {
        return YandexMap(
          logoAlignment: const MapAlignment(
              horizontal: HorizontalAlignment.left,
              vertical: VerticalAlignment.bottom),
          onUserLocationAdded: (UserLocationView view) async =>
              _userLocationView(view),
          mapObjects: state is PlacesOnMapSuccessState
              ? _buildMapObject(state.places)
              : [],
          modelsEnabled: true,
          onMapCreated: (YandexMapController controller) async {
            _mapController = controller;
            context.read<PlacesOnMapCubit>().fetchUserLocation();
            _fetchData();
          },
        );
      },
    );
  }

  List<MapObject> _buildMapObject(List<Place> places) =>
      places.map((place) => _buildPlaceMark(place)).toList();

  Placemark _buildPlaceMark(Place place) => Placemark(
      mapId: MapObjectId(place.id),
      point: Point(
          latitude: place.data!.general!.address!.mapPosition!.latitude!,
          longitude: place.data!.general!.address!.mapPosition!.longitude!),
      opacity: 1,
      onTap: (Placemark self, Point point) {
        _showSheet(place);
        _moveCamera(
            latitude: self.point.latitude,
            longitude: self.point.longitude,
            zoom: _pointZoom);
      },
      icon: PlacemarkIcon.single(PlacemarkIconStyle(
          scale: 1,
          image: BitmapDescriptor.fromAssetImage('assets/images/place.png'),
          rotationType: RotationType.rotate)));

  Widget get _buildBottomLoading {
    return BlocBuilder<PlacesOnMapCubit, PlacesOnMapState>(
      builder: (context, state) =>
          BottomLoader(show: state is PlacesOnMapLoadingState),
    );
  }

  _showSnackError(BuildContext context, String text, VoidCallback onTap) {
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(
        SnackBar(
          action: SnackBarAction(
            label: ResourceString.reload,
            onPressed: onTap,
          ),
          content: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
              text,
              maxLines: 2,
            ),
          ),
        ),
      );
  }

  UserLocationView _userLocationView(UserLocationView view) => view.copyWith(
      pin: view.pin.copyWith(
          icon: PlacemarkIcon.single(PlacemarkIconStyle(
              image:
                  BitmapDescriptor.fromAssetImage('assets/place_user.png')))),
      arrow: view.arrow.copyWith(
          icon: PlacemarkIcon.single(PlacemarkIconStyle(
              image: BitmapDescriptor.fromAssetImage('assets/place_user')))),
      accuracyCircle: view.accuracyCircle.copyWith(fillColor: Colors.black));

  _fetchData() => context.read<PlacesOnMapCubit>().fetchPlaces();

  _moveCamera(
      {required double latitude, required double longitude, double? zoom}) {
    var cameraPosition = CameraPosition(
        target: Point(latitude: latitude, longitude: longitude),
        zoom: zoom ?? _defaultMapZoom);
    _mapController?.moveCamera(CameraUpdate.newCameraPosition(cameraPosition),
        animation:
            const MapAnimation(type: MapAnimationType.linear, duration: .3));
  }

  _showSheet(Place place) async {
    _scaffoldKey.currentState
        ?.showBottomSheet(
          (BuildContext context) {
            return DraggableScrollableSheet(
              initialChildSize: .4,
              expand: false,
              builder: (_, controller) =>
                  PlaceInfo(place: place, scrollController: controller),
            );
          },
        )
        .closed
        .then((value) => _moveCamera(
            latitude: place.data!.general!.address!.mapPosition!.latitude!,
            longitude: place.data!.general!.address!.mapPosition!.longitude!));
  }

  _stateHandler(BuildContext context, PlacesOnMapState state) {
    if (state is PlacesOnMapErrorState) {
      _showSnackError(context, state.error, () => _fetchData());
    }
    if (state is UpdateUserPositionState) {
      _moveCamera(
          latitude: state.position.latitude,
          longitude: state.position.longitude);
    }
  }
}
