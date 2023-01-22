import '../../view_model.dart/register/register_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import '../../constants/app_colors.dart';
import '../../widgets/custom_textField.dart';
import '../../widgets/global_method.dart';
import '../home_view.dart';

class RegisterView extends StatelessWidget {
  RegisterView({Key? key}) : super(key: key);

  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var nameController = TextEditingController();
  var phoneController = TextEditingController();
  var formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return BlocProvider(
      create: (context) => RegisterCubit(),
      child: BlocConsumer<RegisterCubit, RegisterState>(
        listener: (context, state) {
          if (state is RegisterSuccess) {
            const SnackBar(
              content: Text('Successfully Register '),
              backgroundColor: Colors.green,
            );
            navigationTo(context: context, screen: const HomeView());
          } else if (state is RegisterError) {
            SnackBar(
              content: Text(state.error.toString()),
              backgroundColor: Colors.green,
            );
          }
        },
        builder: (context, state) {
          var cubit = RegisterCubit.get(context);
          return Scaffold(
            appBar: AppBar(
              leading: InkWell(
                onTap: () {
                  pop(context: context);
                },
                child: const Icon(
                  IconlyBroken.arrowLeftCircle,
                  size: 30,
                ),
              ),
            ),
            body: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Form(
                  key: formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: size.height * .1,
                      ),
                      Text(
                        'YAM YAM ',
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                      Text(
                        'Sign up free acount ',
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                      SizedBox(
                        height: size.height * .05,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Expanded(
                            flex: 2,
                            child: CustomTextField(
                              hint: 'Name',
                              controller: nameController,
                              keyboard: TextInputType.emailAddress,
                              validator: (value) {
                                if (value.isEmpty) {
                                  return 'Not Vaild Empty value';
                                }
                              },
                            ),
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          Stack(
                            alignment: Alignment.bottomRight,
                            children: [
                              CircleAvatar(
                                radius: 40,
                                backgroundColor: Colors.blue,
                                backgroundImage: cubit.userImageUri.isEmpty
                                    ? const NetworkImage(
                                        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTYIMmE0bLUSDD7LII20c-b06qmFH_ZWUqUQA&usqp=CAU')
                                    : NetworkImage(cubit.userImageUri),
                              ),
                              CircleAvatar(
                                backgroundColor: Colors.white,
                                radius: 15,
                                child: InkWell(
                                  onTap: () {
                                    cubit.getImageGallery();
                                  },
                                  child: Icon(
                                    IconlyBroken.camera,
                                    color: AppColors.pink,
                                  ),
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                      SizedBox(
                        height: size.height * .02,
                      ),
                      CustomTextField(
                        hint: 'Email',
                        controller: emailController,
                        keyboard: TextInputType.emailAddress,
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Not Vaild Empty value';
                          }
                        },
                      ),
                      SizedBox(
                        height: size.height * .02,
                      ),
                      CustomTextField(
                        hint: 'Password',
                        controller: passwordController,
                        keyboard: TextInputType.emailAddress,
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Not Vaild Empty value';
                          }
                        },
                      ),
                      SizedBox(
                        height: size.height * .02,
                      ),
                      CustomTextField(
                        hint: 'Phone',
                        controller: phoneController,
                        keyboard: TextInputType.emailAddress,
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Not Vaild Empty value';
                          }
                        },
                      ),
                      SizedBox(
                        height: size.height * .04,
                      ),
                      InkWell(
                        onTap: () {
                          if (formKey.currentState!.validate()) {}
                        },
                        child: Container(
                          alignment: Alignment.center,
                          padding: const EdgeInsets.symmetric(vertical: 8),
                          height: 40,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: AppColors.red,
                          ),
                          child: Text(
                            'Register ',
                            style: Theme.of(context).textTheme.titleLarge,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: size.height * .04,
                      ),
                      Text(
                        'By checking sign up you will have a delicious food  ',
                        style: Theme.of(context)
                            .textTheme
                            .titleLarge!
                            .copyWith(fontSize: 16),
                      ),
                    ],
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
