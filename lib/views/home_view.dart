import 'package:google_fonts/google_fonts.dart';
import '../constants/app_colors.dart';
import '../constants/app_text.dart';
import '../view_model.dart/home/home_cubit.dart';
import 'all_meals_view.dart';
import 'meal_detail_view.dart';
import '../widgets/meal_widget.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../widgets/global_method.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return BlocConsumer<HomeCubit, HomeState>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = HomeCubit.get(context);
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                AppText.title1,
                textScaleFactor:
                    MediaQuery.of(context).size.width < 500 ? 1 : 1.5,
                style: Theme.of(context).textTheme.titleLarge,
              ),
              Text(
                AppText.title2,
                textScaleFactor:
                    MediaQuery.of(context).size.width < 500 ? 1 : 1.5,
                style: Theme.of(context).textTheme.titleLarge,
              ),
              SizedBox(
                height: size.height * .03,
              ),
              _buildTextField(context: context),
              SizedBox(
                height: size.height * .02,
              ),
              Text(
                AppText.categories,
                textScaleFactor:
                    MediaQuery.of(context).size.width < 500 ? 1 : 1.5,
                style: Theme.of(context).textTheme.titleLarge,
              ),
              SizedBox(
                height: size.height * .01,
              ),
              SizedBox(
                height: size.height * .08,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  children: [
                    _buildCategoryItem(
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
                ),
              ),
              SizedBox(
                height: size.height * .02,
              ),
              Text(
                AppText.title3,
                textScaleFactor:
                    MediaQuery.of(context).size.width < 500 ? 1 : 1.5,
                style: Theme.of(context).textTheme.titleLarge,
              ),
              SizedBox(
                height: size.height * .03,
              ),
              Expanded(
                child: ConditionalBuilder(
                  condition: cubit.dessertList.isNotEmpty,
                  fallback: (context) => Center(
                    child: CircularProgressIndicator(color: AppColors.white),
                  ),
                  builder: (context) => GridView.builder(
                      itemCount: cubit.dessertList.length,
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
                                  meal: cubit.dessertList[index],
                                ));
                          },
                          child: MealWidget(
                            image: cubit.dessertList[index].image,
                            name: cubit.dessertList[index].name,
                            price: cubit.dessertList[index].price,
                          ))),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  _buildCategoryItem({context, text, function}) {
    return InkWell(
      onTap: function,
      child: Container(
        margin: const EdgeInsets.all(3),
        alignment: Alignment.center,
        padding: const EdgeInsets.all(10),
        height: MediaQuery.of(context).size.height * .057,
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(13),
        ),
        child: Text(
          text,
          textScaleFactor: MediaQuery.of(context).size.width < 500 ? 1 : 1.3,
          style: Theme.of(context).textTheme.displayLarge,
        ),
      ),
    );
  }

  _buildTextField({context}) {
    return Container(
      alignment: Alignment.center,
      padding: const EdgeInsets.all(10),
      height: 35,
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(13),
      ),
      child: TextField(
        style: GoogleFonts.roboto(color: Colors.pink, fontSize: 14),
        cursorColor: Theme.of(context).scaffoldBackgroundColor,
        decoration: InputDecoration(
            hintText: AppText.hint,
            hintStyle: Theme.of(context)
                .textTheme
                .titleSmall!
                .copyWith(fontSize: 13, color: Colors.pink),
            border: InputBorder.none),
      ),
    );
  }
}
