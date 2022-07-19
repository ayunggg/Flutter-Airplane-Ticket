// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:airplane/cubit/auth_cubit.dart';
import 'package:airplane/cubit/destination_cubit.dart';
import 'package:airplane/models/destination.dart';
import 'package:airplane/shared/theme.dart';
import 'package:airplane/ui/widgets/custom_card_new_destination.dart';
import 'package:airplane/ui/widgets/custom_card_popular_destination.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    context.read<DestinationCubit>().fecthDestinations();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Widget header() {
      return BlocBuilder<AuthCubit, AuthState>(
        builder: (context, state) {
          if (state is AuthSuccess) {
            return Container(
              margin: EdgeInsets.symmetric(horizontal: 24),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Howdy,',
                          style: semiBold.copyWith(
                            fontSize: 24,
                            color: blackColor,
                          ),
                        ),
                        Text(
                          state.user.name,
                          style: semiBold.copyWith(
                            fontSize: 24,
                            color: blackColor,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                        SizedBox(
                          height: 6,
                        ),
                        Text(
                          'Where to fly today?',
                          style: light.copyWith(
                            fontSize: 16,
                            color: greyColor,
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    width: 60,
                    height: 60,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image: AssetImage('assets/images/image_profile.png'),
                      ),
                    ),
                  ),
                ],
              ),
            );
          } else {
            return SizedBox();
          }
        },
      );
    }

    Widget popularDestination(List<DestinationModel> destinationModel) {
      return Container(
        margin: EdgeInsets.only(top: 30),
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          padding: EdgeInsets.only(bottom: 10),
          child: Row(
            children: destinationModel.map((DestinationModel destinationModel) {
              return CardPopularDestination(destinationModel);
            }).toList(),
          ),
        ),
      );
    }

    Widget newDestination(List<DestinationModel> destination) {
      return Container(
        margin: EdgeInsets.only(top: 30, left: 24, right: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'New This Year',
              style: semiBold.copyWith(
                fontSize: 18,
                color: blackColor,
              ),
            ),
            SizedBox(
              height: 16,
            ),
            Column(
              children: destination.map((DestinationModel destinationModel) {
                return CustomCardNewDestination(destinationModel);
              }).toList(),
            ),
            SizedBox(
              height: 100,
            )
          ],
        ),
      );
    }

    return BlocConsumer<DestinationCubit, DestinationState>(
      listener: (context, state) {
        if (state is DestinationFailed) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              backgroundColor: redColor,
              content: Text(state.message),
            ),
          );
        }
      },
      builder: (context, state) {
        if (state is DestinationSuccess) {
          return ListView(
            children: [
              header(),
              popularDestination(state.destination),
              newDestination(state.destination),
            ],
          );
        }
        return Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}
