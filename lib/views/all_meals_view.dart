import '../models/meal_model.dart';
import '../view_model.dart/home/home_cubit.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import '../constants/app_colors.dart';
import '../widgets/global_method.dart';
import '../widgets/meal_widget.dart';
import 'meal_detail_view.dart';

class AllMealsView extends StatelessWidget {
  List<MealModel>? model = [];
  String? title;
  AllMealsView({Key? key, this.model, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeState>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = HomeCubit.get(context);
        return Scaffold(
          appBar: AppBar(
            leading: InkWell(
              onTap: () {
                pop(context: context);
              },
              child: const Icon(IconlyBroken.arrowLeftCircle),
            ),
            centerTitle: true,
            title: Text(
              title!,
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: ConditionalBuilder(
              condition: model!.isNotEmpty,
              fallback: (context) => Center(
                child: CircularProgressIndicator(color: AppColors.white),
              ),
              builder: (context) => GridView.builder(
                  itemCount: model!.length,
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
                              meal: model![index],
                              
                            ));
                      },
                      child: MealWidget(
                        image:  model![index].image,
                        name:  model![index].name,
                        price:  model![index].price,
                      ))),
            ),
          ),
        );
      },
    );
  }
}
