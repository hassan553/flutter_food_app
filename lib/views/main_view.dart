import '../view_model.dart/home/home_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../constants/bottom_bar.dart';

class MainView extends StatelessWidget {
  const MainView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeState>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = HomeCubit.get(context);
        return Scaffold(
          appBar: _buildAppBar(
            context: context,
            title: appBarTitle[cubit.currentIndex],
          ),
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: cubit.currentIndex,
            onTap: (value) {
              cubit.changeCurrentIndex(value);
            },
            type: BottomNavigationBarType.fixed,
            items: bottombar,
          ),
          body: screens[cubit.currentIndex],
        );
      },
    );
  }

  _buildAppBar({context, title}) {
    return AppBar(
      leading: null,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CircleAvatar(
            backgroundColor: Theme.of(context).scaffoldBackgroundColor,
            radius: 25,
            backgroundImage: const AssetImage('assets/plate1.png'),
          ),
          Text(
            title.toString(),
            style: Theme.of(context).textTheme.titleLarge,
          ),
          InkWell(
            onTap: () {
              HomeCubit.get(context).setTheme();
              print('da');
            },
            child: Icon(
              Icons.sunny,
              color: Theme.of(context).iconTheme.color,
            ),
          )
        ],
      ),
    );
  }
}
