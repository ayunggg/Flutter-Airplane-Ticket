import 'package:airplane/models/destination.dart';
import 'package:airplane/shared/theme.dart';
import 'package:airplane/ui/pages/detail_pae.dart';
import 'package:flutter/material.dart';

class CustomCardNewDestination extends StatelessWidget {
  final DestinationModel destinationModel;
  const CustomCardNewDestination(
    this.destinationModel, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (() {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailPage(destinationModel),
          ),
        );
      }),
      child: Container(
        width: double.infinity,
        height: 90,
        margin: EdgeInsets.only(
          bottom: 16,
        ),
        padding: EdgeInsets.symmetric(
          horizontal: 10,
          vertical: 10,
        ),
        decoration: BoxDecoration(
            color: whiteColor, borderRadius: BorderRadius.circular(18)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Container(
                  width: 70,
                  height: 70,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(18),
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(
                        destinationModel.imageUrl,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 16,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      destinationModel.name,
                      style: medium.copyWith(
                        fontSize: 18,
                        color: blackColor,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      destinationModel.city,
                      style: light.copyWith(
                        color: greyColor,
                      ),
                      overflow: TextOverflow.ellipsis,
                    )
                  ],
                ),
              ],
            ),
            Row(
              children: [
                Container(
                  width: 20,
                  height: 20,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/icons/icon_start.png'),
                    ),
                  ),
                ),
                SizedBox(
                  width: 2,
                ),
                Text(
                  destinationModel.rating.toString(),
                  style: medium.copyWith(
                    color: blackColor,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
