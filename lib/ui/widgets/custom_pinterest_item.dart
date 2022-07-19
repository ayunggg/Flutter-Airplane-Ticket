import 'package:flutter/material.dart';

import '../../shared/theme.dart';

class PinterestItem extends StatelessWidget {
  final String text;
  const PinterestItem({
    Key? key,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Row(
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
            width: 8,
          ),
          Text(
            text,
            style: regular.copyWith(
              color: blackColor,
            ),
          ),
        ],
      ),
    );
  }
}
