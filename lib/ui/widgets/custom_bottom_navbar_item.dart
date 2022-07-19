import 'package:airplane/cubit/page_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../shared/theme.dart';

class CustomBottomNavbarItem extends StatelessWidget {
  final String imageUrl;
  final int index;
  const CustomBottomNavbarItem({
    Key? key,
    required this.index,
    required this.imageUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.read<PageCubit>().setPage(index);
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(),
          Container(
            width: 24,
            height: 24,
            child: Image.asset(
              imageUrl,
              color: context.read<PageCubit>().state == index
                  ? primaryColor
                  : greyColor,
            ),
          ),
          Container(
            width: 30,
            height: 2,
            decoration: BoxDecoration(
              color: context.read<PageCubit>().state == index
                  ? primaryColor
                  : Colors.transparent,
              borderRadius: BorderRadius.circular(18),
            ),
          )
        ],
      ),
    );
  }
}
