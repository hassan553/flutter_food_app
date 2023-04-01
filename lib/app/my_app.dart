import 'package:flutter_offline/flutter_offline.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../view_model.dart/home/home_cubit.dart';
import '../views/splash_view.dart';
import '../widgets/app_theme.dart';

class FoodApp extends StatelessWidget {
  const FoodApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => HomeCubit()
            ..getPizzaData()
            ..getDessertData()
            ..getDrinkData()
            ..getPastaData()
            ..getSaladsData()
            ..getSaucesData()
            ..getSidesData()
            ..getTheme(),
        ),
      ],
      child: BlocBuilder<HomeCubit, HomeState>(
       
        builder: (context, state) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            themeMode: HomeCubit.get(context).isDark
                ? ThemeMode.dark
                : ThemeMode.light,
            darkTheme: AppTheme.darkTheme(),
            theme: AppTheme.lightTheme(),
            title: 'Yam Yam',
            home: OfflineBuilder(
              connectivityBuilder: (
                BuildContext context,
                ConnectivityResult connectivity,
                Widget child,
              ) {
                bool connected = connectivity != ConnectivityResult.none;

                if (connected) {
                  return const SplashView();
                } else {
                  return Scaffold(
                    body: SafeArea(
                      child: Image.asset(
                        'assets/no.jpeg',
                        width: double.infinity,
                        height: double.infinity,
                        fit: BoxFit.fill,
                      ),
                    ),
                  );
                }
              },
              child: const CircularProgressIndicator(color: Colors.red),
            ),
          );
        },
      ),
    );
  }
}
