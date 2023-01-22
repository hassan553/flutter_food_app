import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import '../constants/app_colors.dart';


class MealWidget extends StatelessWidget {
  dynamic image;
  dynamic name;
  dynamic price;
  MealWidget({Key? key, this.image, this.name, this.price}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // padding: const EdgeInsets.all(10),
      height: MediaQuery.of(context).size.height * .24,
      width: MediaQuery.of(context).size.width * .45,
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(13),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        mainAxisSize: MainAxisSize.min,
        children: [
          Expanded(
            flex: 2,
            child: Align(
              alignment: Alignment.center,
              child: Container(
                height: MediaQuery.of(context).size.height * .13,
                width: MediaQuery.of(context).size.width * .4,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(
                      image.toString(),
                    ),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ),
          ),
          // const Spacer(),
          Padding(
            padding: const EdgeInsets.all(3.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name.toString(),
                  textScaleFactor:
                      MediaQuery.of(context).size.width < 500 ? 1 : 1.5,
                  style: Theme.of(context).textTheme.titleSmall,
                ),
                Row(
                  children: [
                    Text(
                      '${price.toString()} \$',
                      textScaleFactor:
                          MediaQuery.of(context).size.width < 500 ? 1 : 1.5,
                      style: Theme.of(context)
                          .textTheme
                          .titleSmall!
                          .copyWith(color: AppColors.red),
                    ),
                    const Spacer(),
                    Icon(
                      IconlyBroken.heart,
                      color: Theme.of(context).iconTheme.color,
                    )
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
