// ignore_for_file: prefer_single_quotes

import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:notamedia/data/models/base_response.dart';
import 'package:notamedia/data/models/place/place.dart';
import 'package:notamedia/resource/resource_string.dart';

class PlacesRepository {
  Future<BaseResponse<List<Place>, String>> getPlaces() async {
    try {
      rootBundle.clear(); // удаляем кеш что-бы отрабатывал catch
      await Future.delayed(
          const Duration(milliseconds: 500)); // эмулируем rest запрос
      var result =
          await rootBundle.loadString('assets/data-59-structure-3.json');
      return compute(parsePlaces, result);
    } catch (e) {
      return BaseResponse<List<Place>, String>.error(
          ResourceString.defaultError);
    }
  }
}

BaseResponse<List<Place>, String> parsePlaces(String json) {
  final parsed = jsonDecode(json);
  var places = List<Place>.from(parsed.map((e) => Place.fromMap(e)).toList());
  return BaseResponse<List<Place>, String>.success(places);
}
