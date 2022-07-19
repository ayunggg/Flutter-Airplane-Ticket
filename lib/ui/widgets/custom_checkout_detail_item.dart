import 'package:airplane/shared/theme.dart';
import 'package:flutter/material.dart';

class CheckoutDetailItem extends StatelessWidget {
  final String title;
  final String description;
  final Color dfColor;
  const CheckoutDetailItem({
    Key? key,
    required this.title,
    required this.description,
    this.dfColor = const Color(0xFF1F1449),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(
                width: 16,
                height: 16,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(
                      'assets/icons/icon_check.png',
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: 6,
              ),
              Text(
                title,
                style: regular.copyWith(
                  fontSize: 14,
                  color: blackColor,
                ),
              ),
            ],
          ),
          Row(
            children: [
              Text(
                description,
                style: semiBold.copyWith(
                  color: dfColor,
                ),
                overflow: TextOverflow.ellipsis,
              ),
            ],
          )
        ],
      ),
    );
  }
}
