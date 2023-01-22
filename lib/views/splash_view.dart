import '../constants/app_colors.dart';
import 'auth/login_view.dart';
import '../widgets/global_method.dart';
import 'package:flutter/material.dart';


class SplashView extends StatefulWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
 
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                  'assets/plate3.png',
                ),
                fit: BoxFit.cover,
              ),
              gradient: LinearGradient(
                begin: Alignment.bottomRight,
                colors: [
                  Colors.redAccent,
                  Color.fromARGB(255, 139, 6, 6),
                  Colors.black12,
                  Color.fromARGB(66, 0, 0, 0),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 15,
            child: ElevatedButton(
              onPressed: () {
                navigationAndFinsh(context: context, screen:  LoginView());
              },
              style: ElevatedButton.styleFrom(
                  primary: AppColors.amber,
                  minimumSize: Size(size.width * .8, 50)),
              child: Text(
                'GET STARTED',
                style: Theme.of(context)
                    .textTheme
                    .titleLarge!
                    .copyWith(color: AppColors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
