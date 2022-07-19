// ignore_for_file: prefer_const_constructors

import 'package:airplane/cubit/auth_cubit.dart';
import 'package:airplane/shared/theme.dart';
import 'package:airplane/ui/widgets/custom_button.dart';
import 'package:airplane/ui/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignInPage extends StatelessWidget {
  SignInPage({Key? key}) : super(key: key);

  final TextEditingController emailController = TextEditingController(text: '');
  final TextEditingController passwordController =
      TextEditingController(text: '');

  @override
  Widget build(BuildContext context) {
    Widget title() {
      return Container(
        margin: EdgeInsets.only(top: 30),
        child: Text(
          'Sign in with \nYour Existance \nAccount',
          style: semiBold.copyWith(
            fontSize: 24,
            color: blackColor,
          ),
        ),
      );
    }

    Widget inputSection() {
      return Container(
        margin: EdgeInsets.only(top: 30),
        padding: EdgeInsets.symmetric(vertical: 30, horizontal: 20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(18),
          color: whiteColor,
        ),
        child: Column(
          children: [
            CustomTextFormField(
              title: 'Email Adress',
              hintText: 'Your Email Adress',
              controller: emailController,
            ),
            CustomTextFormField(
              title: 'Password',
              hintText: 'Your Password',
              obsecureText: true,
              controller: passwordController,
            ),
            //NOTE : Sign In Button
            BlocConsumer<AuthCubit, AuthState>(
              listener: (context, state) {
                if (state is AuthSuccess) {
                  Navigator.pushNamedAndRemoveUntil(
                      context, '/main', (route) => false);
                } else if (state is AuthFailed) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      backgroundColor: redColor,
                      content: Text(state.message),
                    ),
                  );
                }
              },
              builder: (context, state) {
                if (state is AuthLoading) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
                return CustomButton(
                  title: 'Sign In',
                  width: 290,
                  margin: EdgeInsets.only(left: 20, right: 20, bottom: 30),
                  onPressed: () {
                    context.read<AuthCubit>().singIn(
                          email: emailController.text,
                          password: passwordController.text,
                        );
                  },
                );
              },
            )
          ],
        ),
      );
    }

    Widget tagSection() {
      return GestureDetector(
        onTap: () {
          Navigator.pop(context);
        },
        child: Container(
          margin: EdgeInsets.only(top: 50, bottom: 73),
          child: Align(
            alignment: Alignment.bottomCenter,
            child: Text(
              'not have an account? Sign Up',
              style: regular.copyWith(
                fontSize: 16,
                color: blackColor,
                decoration: TextDecoration.underline,
              ),
            ),
          ),
        ),
      );
    }

    return Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.symmetric(
            horizontal: 24,
          ),
          children: [
            title(),
            inputSection(),
            tagSection(),
          ],
        ),
      ),
    );
  }
}
