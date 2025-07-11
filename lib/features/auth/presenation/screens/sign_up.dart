import 'package:authh/core/Dialogs/dialogs.dart';
import 'package:authh/core/di/di.dart';
import 'package:authh/core/utils/app_colors.dart';
import 'package:authh/core/widgets/app_button.dart';
import 'package:authh/core/widgets/custom_field.dart';
import 'package:authh/core/widgets/custom_text.dart';
import 'package:authh/features/auth/presenation/bloc/auth_cubit.dart';
import 'package:authh/features/auth/presenation/bloc/auth_states.dart';
import 'package:authh/features/auth/presenation/screens/login.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUp extends StatelessWidget {
  SignUp({super.key});
  var nameController = TextEditingController();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var rePasswordController = TextEditingController();
  var phoneController = TextEditingController();
  var formKey=GlobalKey<FormState>();
  AuthCubit authCubit =getIt<AuthCubit>();

  @override
  Widget build(BuildContext context) {
    return BlocListener(
      bloc: authCubit,
      listener: (context, state) {
        if(state is RegisterLoadingState){
          DialogFunctions.showLoadingDialog(context, "Loading...");
        }
        if(state is RegisterErrorState){
          DialogFunctions.hideLoading(context);
          DialogFunctions.showMessageDialog(context: context,
              message: state.error,
            posActionName: "ok",
            title: "Register Fail"
          );
        }
        if(state is RegisterSuccessState){
          DialogFunctions.hideLoading(context);
          DialogFunctions.showMessageDialog(context: context,
              message: "success",
          posActionName: "ok",title: "Success Register");
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
                spacing: 25,
                children: [
                  SizedBox(height: 5),
                  CustomText(
                    text: "To create an account \n Complete your data",
                    fontSize: 22,
                    fontWeight: FontWeight.w400,
                    color: AppColors.white,
                  ),
                  SizedBox(height: 20),
                  CustomField(
                    keyboardType: TextInputType.text,
                    hint: "Enter your name",
                    obscureText: false,
                    filled: true,
                    controller: nameController,
                    validator: (p0) {
                      if (nameController.text.isEmpty) {
                        return "please enter your name";
                      }
                    },
                  ),
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
                  ),
                  CustomField(
                    keyboardType: TextInputType.number,
                    hint: "Enter your password",
                    obscureText: true,
                    filled: true,
                    controller: passwordController,
                    validator: (p0) {
                      if (nameController.text.isEmpty) {
                        return "please enter your password";
                      }
                    },
                  ),
                  CustomField(
                    keyboardType: TextInputType.number,
                    hint: "Confirm password",
                    obscureText: true,
                    filled: true,
                    controller: rePasswordController,
                    validator: (p0) {
                      if (rePasswordController.text.isEmpty) {
                        return "password not matched";
                      }
                    },
                  ),
                  CustomField(
                    keyboardType: TextInputType.phone,
                    hint: "Enter your phone number",
                    obscureText: false,
                    filled: true,
                    controller: phoneController,
                    validator: (p0) {
                      if (phoneController.text.isEmpty) {
                        return "please enter your phone number";
                      }
                    },
                  ),
                  SizedBox(height: 15),
                  AppButton(
                    onPressed: () {
                      if(formKey.currentState!.validate()){
                        authCubit.register(
                            nameController.text,
                            emailController.text,
                            passwordController.text,
                            rePasswordController.text,
                            phoneController.text);
                      }
                    },
                    child: CustomText(
                      text: "Sign Up",
                      color: Colors.grey,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                    backgroundColor: AppColors.white,
                  ),
                  Row(
                    spacing: 8,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CustomText(
                        text: "have an account?",
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        color: AppColors.white,
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(builder: (context) => Login()),
                          );
                        },
                        child: CustomText(
                          text: "Login",
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
