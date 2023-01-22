import '../constants/app_colors.dart';
import 'splash_view.dart';
import '../widgets/global_method.dart';
import 'package:flutter/material.dart';

class UserView extends StatelessWidget {
  const UserView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        margin: const EdgeInsets.all(8.0),
        height: MediaQuery.of(context).size.height * .7,
        child: Stack(
          alignment: Alignment.bottomCenter,
          //crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Card(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                ),
                child: LayoutBuilder(
                  builder: (context, constraints) => Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SizedBox(
                        height: constraints.maxHeight * .3,
                      ),
                      _buildUserInfo(text: 'Hassan Marzouq', context: context),
                      SizedBox(
                        height: constraints.maxHeight * .03,
                      ),
                      _buildUserInfo(
                          text: 'Hassan@gmail.com', context: context),
                      SizedBox(
                        height: constraints.maxHeight * .03,
                      ),
                      _buildUserInfo(text: '01003204302', context: context),
                      SizedBox(
                        height: constraints.maxHeight * .03,
                      ),
                      const Divider(),
                      SizedBox(
                        height: constraints.maxHeight * .03,
                      ),
                      ElevatedButton(
                        onPressed: () {
                          navigationAndFinsh(
                              context: context, screen: const SplashView());
                        },
                        style: ElevatedButton.styleFrom(
                            primary: AppColors.pink,
                            minimumSize: Size(constraints.maxHeight * .8, 50)),
                        child: Text(
                          'Logout',
                          style: Theme.of(context)
                              .textTheme
                              .titleLarge!
                              .copyWith(color: AppColors.white),
                        ),
                      ),
                      SizedBox(
                        height: constraints.maxHeight * .04,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              top: 0,
              child: CircleAvatar(
                radius: 70,
                backgroundColor: AppColors.white,
                child: Image.network(
                  fit: BoxFit.cover,
                  'https://cdn-icons-png.flaticon.com/512/3048/3048127.png',
                  width: 100,
                  height: 100,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  _buildUserInfo({text, context}) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 13, horizontal: 10),
      height: 45,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.pink, width: 1),
      ),
      child: Text(
        text.toString(),
        style: Theme.of(context).textTheme.titleSmall,
      ),
    );
  }
}
