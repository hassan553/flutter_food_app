import '../main_view.dart';
import '../../view_model.dart/login/login_cubit.dart';
import 'register_view.dart';
import '../home_view.dart';
import '../../widgets/global_method.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../widgets/custom_textField.dart';
import 'package:flutter/material.dart';
import '../../constants/app_colors.dart';

class LoginView extends StatelessWidget {
   LoginView({Key? key}) : super(key: key);
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return BlocProvider(
      create: (context) => LoginCubit(),
      child: BlocConsumer<LoginCubit, LoginState>(
        listener: (context, state) {
          if (state is LoginSuccessState) {
            const SnackBar(
              content: Text('Successfully Login '),
              backgroundColor: Colors.green,
            );
            navigationTo(context: context, screen: const HomeView());
          } else if (state is LoginErrorState) {
            SnackBar(
              content: Text(state.error.toString()),
              backgroundColor: Colors.green,
            );
          }
        },
        builder: (context, state) {
          var cubit = LoginCubit.get(context);
          return Scaffold(
            body: SingleChildScrollView(
              child: SafeArea(
                  child: Column(
                // crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: double.infinity,
                    height: size.height * .4,
                    child: Image.asset(
                      'assets/plate3.png',
                      fit: BoxFit.fill,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Form(
                      key: formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            'Login To YAM YAM ',
                            style: Theme.of(context).textTheme.titleLarge,
                          ),
                          SizedBox(
                            height: size.height * .04,
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
                            height: size.height * .03,
                          ),
                          CustomTextField(
                            hint: 'Password',
                            obscure: true,
                            controller: passwordController,
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
                          Align(
                            alignment: Alignment.centerRight,
                            child: TextButton(
                              onPressed: () {
                                
                              },
                              child: Text(
                                'Forget Passwod ',
                                style: Theme.of(context).textTheme.titleLarge,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: size.height * .02,
                          ),
                          InkWell(
                            onTap: () {
                              
                              navigationAndFinsh(
                                  context: context, screen:const  MainView());
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
                                'Login ',
                                style: Theme.of(context).textTheme.titleLarge,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: size.height * .02,
                          ),
                          SizedBox(
                            height: size.height * .04,
                            child: Row(
                              children: [
                                Text(
                                  'Don\’t have an account? ',
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleLarge!
                                      .copyWith(fontSize: 14),
                                ),
                                InkWell(
                                  onTap: () {
                                    navigationTo(
                                        context: context,
                                        screen: RegisterView());
                                  },
                                  child: Text(
                                    'Sign Up ',
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleLarge!
                                        .copyWith(
                                            fontSize: 18, color: Colors.pink),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: size.height * .02,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              )),
            ),
          );
        },
      ),
    );
  }
}
