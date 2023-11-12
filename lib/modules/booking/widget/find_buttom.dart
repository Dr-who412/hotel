import 'package:flutter/material.dart';
import 'package:hotels/controller/booking_cubit.dart';
import 'package:hotels/utils/const/fonts.dart';

class FindButtom extends StatelessWidget {
  FindButtom({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        BookingCubit.get(context).checkValidate();
      },
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.all(2),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'find hotels',
              style: Appfonts.bold.copyWith(color: Colors.white),
            ),
            Icon(
              Icons.search,
              color: Colors.white,
              size: 42,
            )
          ],
        ),
      ),
    );
  }
}
