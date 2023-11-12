import 'package:flutter/material.dart';
import 'package:flutter_date_range_picker/flutter_date_range_picker.dart';
import 'package:hotels/controller/booking_cubit.dart';
import 'package:hotels/utils/const/colors.dart';
import 'package:hotels/utils/const/fonts.dart';

class footerPicker extends StatelessWidget {
  DateRange? selectedDateRange;
  footerPicker({
    Key? key,
    this.selectedDateRange,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          BookingCubit.get(context).pickDate(this.selectedDateRange);
          Navigator.pop(context);
        },
        child: Container(
            margin: EdgeInsets.all(4),
            padding: EdgeInsets.all(6),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                gradient: LinearGradient(colors: [
                  AppColors.blueAc,
                  AppColors.blue,
                  AppColors.blueLg,
                  AppColors.blueLgAc,
                ])),
            child: Text(
              'Save',
              style: Appfonts.small.copyWith(color: Colors.white),
            )));
  }
}
