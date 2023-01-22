import '../view_model.dart/home/home_cubit.dart';
import '../constants/app_text.dart';
import '../models/meal_model.dart';
import '../widgets/global_method.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import '../constants/app_colors.dart';

class MealDetailView extends StatelessWidget {
  MealModel? meal;
  var isNotDrink;
  MealDetailView({Key? key, this.meal, this.isNotDrink = true})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: _buildAppBar(context: context, title: meal!.name, meal: meal),
      body: Container(
        width: size.width,
        height: size.height,
        color: Theme.of(context).scaffoldBackgroundColor,
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                width: size.width,
                height: size.height * .6,
                decoration: BoxDecoration(
                  color: AppColors.containerColor,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(80),
                    topRight: Radius.circular(80),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: size.height * .2,
                      ),
                      Visibility(
                        visible: isNotDrink,
                        child: Row(
                          children: [
                            Text(
                              'Spicy',
                              style: Theme.of(context)
                                  .textTheme
                                  .titleSmall!
                                  .copyWith(
                                    fontSize: 18,
                                  ),
                            ),
                            SizedBox(
                              width: size.width * .05,
                            ),
                            Checkbox(
                              value: meal!.spicy,
                              onChanged: (value) {},
                              checkColor: AppColors.white,
                              activeColor: AppColors.red,
                            ),
                            const Spacer(),
                            Text(
                              'vegetarian',
                              style: Theme.of(context)
                                  .textTheme
                                  .titleSmall!
                                  .copyWith(
                                    fontSize: 18,
                                  ),
                            ),
                            SizedBox(
                              width: size.width * .05,
                            ),
                            Checkbox(
                              value: meal!.vegetarian,
                              onChanged: (value) {},
                              checkColor: AppColors.white,
                              activeColor: Colors.green,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: size.height * .01,
                      ),
                      Visibility(
                        visible: meal!.ingredients.isNotEmpty,
                        child: Expanded(
                          flex: 3,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Ingredients',
                                style: Theme.of(context)
                                    .textTheme
                                    .titleSmall!
                                    .copyWith(
                                      fontSize: 18,
                                    ),
                              ),
                              SizedBox(
                                height: size.height * .01,
                              ),
                              _buildIngredients(
                                  context: context, list: meal!.ingredients),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: size.height * .02,
                      ),
                      Row(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                AppText.price,
                                style: Theme.of(context).textTheme.headline1,
                              ),
                              Text(
                                '${meal!.price.toString()} \$',
                                style: Theme.of(context)
                                    .textTheme
                                    .titleSmall!
                                    .copyWith(
                                      fontSize: 14,
                                      color: AppColors.red,
                                    ),
                              ),
                            ],
                          ),
                          const Spacer(),
                          Container(
                            height: size.height * .07,
                            width: size.width * .4,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: AppColors.red,
                              borderRadius: BorderRadius.circular(30),
                            ),
                            child: Text(
                              AppText.buyNow,
                              style: Theme.of(context)
                                  .textTheme
                                  .titleSmall!
                                  .copyWith(
                                    fontSize: 18,
                                    color: AppColors.white,
                                  ),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              top: size.height * .25,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  CircleAvatar(
                    radius: 70,
                    backgroundImage: NetworkImage(
                      meal!.image,
                    ),
                  ),
                  Text(
                    meal!.name,
                    style: Theme.of(context)
                        .textTheme
                        .titleSmall!
                        .copyWith(fontSize: 18),
                  ),
                  SizedBox(
                    height: size.height * .01,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  _buildIngredients({context, required List list}) {
    return Expanded(
      child: SingleChildScrollView(
        child: Wrap(
            children: list.map((e) {
          return Container(
            padding: const EdgeInsets.all(10),
            margin: const EdgeInsets.all(5),
            // width: 50,
            height: 40,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20), color: Colors.amber),
            child: FittedBox(
                fit: BoxFit.fitWidth,
                child: Text(
                  '${list.indexOf(e) + 1}-${e.toString()}',
                  style: Theme.of(context).textTheme.titleSmall,
                )),
          );
        }).toList()),
      ),
    );
  }

  _buildAppBar({context, title, meal}) {
    return AppBar(
      leading: InkWell(
        onTap: () {
          pop(context: context);
        },
        child: const Icon(IconlyBroken.arrowLeftCircle),
      ),
      centerTitle: true,
      actions: [
        InkWell(
          onTap: () {
            HomeCubit.get(context).setFaourties(meal);
            //print(HomeCubit.get(context).favourties[1].isFavourite);
          },
          child: Padding(
            padding: const EdgeInsets.only(right: 8),
            child: Icon(
              true? IconlyBold.heart : IconlyBroken.heart,
              color: true
                  ? Colors.red
                  : Theme.of(context).iconTheme.color,
            ),
          ),
        ),
      ],
      title: Text(
        title.toString(),
        style: Theme.of(context).textTheme.titleLarge,
      ),
    );
  }
}
