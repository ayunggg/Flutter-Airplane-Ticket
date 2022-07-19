import 'package:airplane/cubit/seat_cubit_cubit.dart';
import 'package:airplane/shared/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SeatItem extends StatelessWidget {
  final String id;
  final bool isAvaliable;
  const SeatItem({
    Key? key,
    this.isAvaliable = true,
    required this.id,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool isSelected = context.watch<SeatCubit>().isSelected(id);

    return GestureDetector(
      onTap: () {
        context.read<SeatCubit>().selectSeat(id);
      },
      child: Container(
        width: 48,
        height: 48,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: (!isAvaliable)
              ? unAvailableColor
              : (isSelected)
                  ? primaryColor
                  : availableColor,
          border: Border.all(
            color: (isAvaliable) ? primaryColor : Colors.transparent,
          ),
        ),
        child: (isSelected)
            ? Center(
                child: Text(
                  'YOU',
                  style: semiBold.copyWith(
                    fontSize: 14,
                    color: whiteColor,
                  ),
                ),
              )
            : SizedBox(),
      ),
    );
  }
}
