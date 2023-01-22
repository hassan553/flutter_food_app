import 'meal_detail_view.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../constants/app_colors.dart';
import '../view_model.dart/home/home_cubit.dart';
import '../widgets/global_method.dart';
import '../widgets/meal_widget.dart';

class FavourtyView extends StatelessWidget {
  const FavourtyView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeState>(
      listener: (context, state) {},
      builder: (context, state) => ConditionalBuilder(
        fallback: (context) => Center(
            child: CircularProgressIndicator(
          color: AppColors.amber,
        )),
        condition: HomeCubit.get(context).favourties.isNotEmpty,
        builder: (context) {
          var cubit = HomeCubit.get(context);
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: ConditionalBuilder(
              condition: cubit.favourties.isNotEmpty,
              fallback: (context) => Center(
                child: CircularProgressIndicator(color: AppColors.white),
              ),
              builder: (context) => GridView.builder(
                itemCount: cubit.favourties.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount:
                        MediaQuery.of(context).size.width > 650 ? 3 : 2,
                    mainAxisSpacing: 5,
                    // childAspectRatio: 1 / 1.2,
                    crossAxisSpacing: 5),
                itemBuilder: (context, index) => InkWell(
                  onTap: () {
                    navigationTo(
                        context: context,
                        screen: MealDetailView(
                          meal: cubit.favourties[index],
                        ));
                  },
                  child: MealWidget(
                    image: cubit.favourties[index].image,
                    name: cubit.favourties[index].name,
                    price: cubit.favourties[index].price,
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
