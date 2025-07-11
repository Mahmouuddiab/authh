import 'package:authh/core/Dialogs/dialogs.dart';
import 'package:authh/core/di/di.dart';
import 'package:authh/core/utils/app_colors.dart';
import 'package:authh/core/widgets/app_button.dart';
import 'package:authh/core/widgets/custom_field.dart';
import 'package:authh/core/widgets/custom_text.dart';
import 'package:authh/features/auth/presenation/bloc/auth_cubit.dart';
import 'package:authh/features/auth/presenation/bloc/auth_states.dart';
import 'package:authh/features/auth/presenation/screens/sign_up.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Login extends StatelessWidget {
  Login({super.key});
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var formKey=GlobalKey<FormState>();
  AuthCubit authCubit =getIt<AuthCubit>();
  @override
  Widget build(BuildContext context) {
    return BlocListener(
      bloc: authCubit,
      listener: (context, state) {
        if(state is LoginLoadingState){
          DialogFunctions.showLoadingDialog(context, "Loading...");
        }
        if(state is LoginErrorState){
          DialogFunctions.hideLoading(context);
          DialogFunctions.showMessageDialog(context: context,
              message: "error",
            posActionName: "ok",
            title: "login fail"
          );
        }
        if(state is LoginSuccessState){
          DialogFunctions.hideLoading(context);
          DialogFunctions.showMessageDialog(context: context,
              message: "Success",
              posActionName: "ok",
              title: "login success"
          );
        }
      },
      child: Scaffold(
        backgroundColor: AppColors.black,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: 30,
                children: [
                  CustomText(
                    text: "To continue login with \n Your email",
                    color: AppColors.white,
                    fontWeight: FontWeight.w500,
                    fontSize: 22,
                  ),
                  SizedBox(height: 30),
                  CustomField(
                    keyboardType: TextInputType.emailAddress,
                    hint: "Enter your email",
                    obscureText: false,
                    filled: true,
                    controller: emailController,
                    validator: (p0) {
                      if (emailController.text.isEmpty) {
                        return "please enter your email";
                      }
                    },
                    suffixIcon: Icon(Icons.email, color: Colors.grey),
                  ),
                  CustomField(
                    keyboardType: TextInputType.emailAddress,
                    hint: "Enter your password",
                    obscureText: true,
                    filled: true,
                    controller: passwordController,
                    validator: (p0) {
                      if (passwordController.text.isEmpty) {
                        return "please enter your password";
                      }
                    },
                    suffixIcon: Icon(Icons.visibility_off, color: Colors.grey),
                  ),
                  AppButton(
                    onPressed: () {
                      if(formKey.currentState!.validate()){
                        authCubit.login(
                            emailController.text,
                            passwordController.text);
                      }
                    },
                    child: CustomText(
                      text: "Login",
                      fontSize: 19,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey,
                    ),
                    backgroundColor: AppColors.white,
                  ),
                  Row(
                    spacing: 8,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CustomText(
                        text: "haven't an account?",
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        color: AppColors.white,
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(builder: (context) => SignUp()),
                          );
                        },
                        child: CustomText(
                          text: "Create one",
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
