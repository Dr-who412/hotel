import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_date_range_picker/flutter_date_range_picker.dart';
import 'package:hotels/controller/booking_cubit.dart';
import 'package:hotels/utils/const/colors.dart';
import 'package:hotels/utils/const/fonts.dart';

Widget datePickerBuilder(
        BuildContext context, dynamic Function(DateRange) onDateRangeChanged) =>
    Container(
      margin: EdgeInsets.only(top: 14),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: DateRangePickerWidget(
                onDateRangeChanged: (dateRange) {
                  // Handle the selected dateRange here
                  BookingCubit.get(context).pickDate(dateRange);
                },
                height: MediaQuery.of(context).size.height / 2,
                theme: CalendarTheme(
                  selectedColor: Colors.blue,
                  dayNameTextStyle:
                      TextStyle(color: Colors.black45, fontSize: 10),
                  inRangeColor: Color(0xFFD9EDFA),
                  inRangeTextStyle: TextStyle(color: Colors.blue),
                  selectedTextStyle: TextStyle(color: Colors.white),
                  todayTextStyle: TextStyle(fontWeight: FontWeight.bold),
                  defaultTextStyle:
                      TextStyle(color: Colors.black, fontSize: 12),
                  radius: 10,
                  tileSize: 40,
                  disabledTextStyle: TextStyle(color: Colors.grey),
                ),
              ),
            ),
          ),
        ],
      ),
    );
