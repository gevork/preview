import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:notamedia/data/repositories/user/user_repository.dart';
import 'package:notamedia/ui/places_on_map/index.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (context) => UserRepository(),
      child: ScreenUtilInit(
        designSize: const Size(360, 640),
        builder: () {
          return MaterialApp(
            title: '',
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              primarySwatch: Colors.blue,
            ),
            initialRoute: '/',
            routes: {
              PlacesOnMapPage.routeName: (context) => const PlacesOnMapPage(),
            },
          );
        },
      ),
    );
  }
}
