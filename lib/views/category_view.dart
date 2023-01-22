import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../constants/app_colors.dart';
import '../constants/bottom_bar.dart';
import '../view_model.dart/home/home_cubit.dart';
import '../widgets/global_method.dart';
import 'all_meals_view.dart';

class CategoryView extends StatelessWidget {
  const CategoryView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeState>(
      listener: (context, state) {},
      builder: (context, state) => ConditionalBuilder(
        condition: HomeCubit.get(context).pizzaList.isNotEmpty,
        builder: (context) {
          var cubit = HomeCubit.get(context);
          return ListView(
            children: [
              _buildCategoryItem(
                  image: categoryImage[0]['image'],
                  function: () {
                    navigationTo(
                        context: context,
                        screen: AllMealsView(
                          model: cubit.pizzaList,
                          title: 'Pizza',
                        ));
                  },
                  context: context,
                  text: 'Pizza'),
              _buildCategoryItem(
                image: categoryImage[1]['image'],
                context: context,
                text: 'Pasta',
                function: () {
                  navigationTo(
                      context: context,
                      screen: AllMealsView(
                        model: cubit.pastaList,
                        title: 'Pasta',
                      ));
                },
              ),
              _buildCategoryItem(
                image: categoryImage[2]['image'],
                context: context,
                text: 'Salads',
                function: () {
                  navigationTo(
                      context: context,
                      screen: AllMealsView(
                        model: cubit.saladsList,
                        title: 'Salads',
                      ));
                },
              ),
              _buildCategoryItem(
                image: categoryImage[3]['image'],
                context: context,
                text: 'Dessert',
                function: () {
                  navigationTo(
                      context: context,
                      screen: AllMealsView(
                        model: cubit.dessertList,
                        title: 'Dessert',
                      ));
                },
              ),
              _buildCategoryItem(
                image: categoryImage[4]['image'],
                context: context,
                text: 'Drinks',
                function: () {
                  navigationTo(
                      context: context,
                      screen: AllMealsView(
                        model: cubit.drinkList,
                        title: 'Drinks',
                      ));
                },
              ),
              _buildCategoryItem(
                image: categoryImage[5]['image'],
                context: context,
                text: 'Sauces',
                function: () {
                  navigationTo(
                      context: context,
                      screen: AllMealsView(
                        model: cubit.saucesList,
                        title: 'Sauces',
                      ));
                },
              ),
              _buildCategoryItem(
                image: categoryImage[6]['image'],
                context: context,
                text: 'Sides',
                function: () {
                  navigationTo(
                      context: context,
                      screen: AllMealsView(
                        model: cubit.sidesList,
                        title: 'Sides',
                      ));
                },
              ),
            ],
          );
        },
        fallback: (context) {
          return Center(
            child: CircularProgressIndicator(
              color: AppColors.amber,
            ),
          );
        },
      ),
    );
  }

  _buildCategoryItem({context, function, text, image}) {
    Size size = MediaQuery.of(context).size;
    return InkWell(
      onTap: function,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(20)),
          child: Stack(alignment: Alignment.bottomCenter, children: [
            Image.network(
              image.toString(),
              fit: BoxFit.fill,
              height: size.height * .2,
              // width: size.width,
            ),
            Container(
                alignment: Alignment.center,
                width: double.infinity,
                height: 30,
                color: Colors.deepPurpleAccent,
                child: Text(
                  text.toString(),
                  style: const TextStyle(fontSize: 20, color: Colors.white),
                )),
          ]),
        ),
      ),
    );
  }
}
