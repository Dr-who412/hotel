import 'package:flutter/material.dart';
import 'package:hotels/modules/booking/widget/book_form.dart';
import 'package:hotels/modules/booking/widget/cliper.dart';
import 'package:hotels/modules/booking/widget/find_buttom.dart';
import 'package:hotels/modules/widgets/background.dart';
import 'package:hotels/utils/const/colors.dart';
import 'package:hotels/utils/const/fonts.dart';

class BookingRoom extends StatelessWidget {
  const BookingRoom({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: BackGround(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              textDirection: TextDirection.ltr,
              children: [
                //lable
                ClipPath(
                  clipper: LableClipper(),
                  child: Container(
                    margin: const EdgeInsets.only(left: 12),
                    decoration: BoxDecoration(
                      // border:
                      //     Border(right: BorderSide(color: Colors.white, width: 6)),
                      gradient: LinearGradient(colors: [
                        AppColors.blueAc,
                        AppColors.blue,
                        AppColors.blueLg,
                        AppColors.blueLgAc,
                      ]),
                    ),
                    padding: const EdgeInsets.only(left: 8, right: 40),
                    child: Text('Hotels Search',
                        style: Appfonts.bold.copyWith(color: Colors.white)),
                  ),
                ),

                //form booking
                Container(
                  margin: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                      color: Colors.deepOrangeAccent,
                      borderRadius: BorderRadius.circular(16)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      //booking room form
                      BookingForm(),
                      //find hotels buttom
                      FindButtom(),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
