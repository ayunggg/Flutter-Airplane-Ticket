import 'package:flutter/material.dart';

import '../../shared/theme.dart';

class CustomTextFormField extends StatelessWidget {
  final String title;
  final String hintText;
  final bool obsecureText;
  final TextEditingController controller;

  const CustomTextFormField({
    Key? key,
    required this.controller,
    required this.title,
    required this.hintText,
    this.obsecureText = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: regular.copyWith(
              fontSize: 14,
              color: blackColor,
            ),
          ),
          SizedBox(
            height: 6,
          ),
          TextFormField(
            controller: controller,
            obscureText: obsecureText,
            style: regular.copyWith(
              fontSize: 16,
              color: blackColor,
            ),
            cursorColor: blackColor,
            decoration: InputDecoration(
              hintText: hintText,
              border: OutlineInputBorder(
                borderSide: BorderSide(color: greyColor),
                borderRadius: BorderRadius.circular(18),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(18),
                borderSide: BorderSide(
                  color: primaryColor,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
