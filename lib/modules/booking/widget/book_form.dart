import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_date_range_picker/flutter_date_range_picker.dart';
import 'package:hotels/controller/booking_cubit.dart';
import 'package:hotels/controller/booking_state.dart';
import 'package:hotels/model/country.dart';
import 'package:hotels/modules/booking/room_details.dart';
import 'package:hotels/modules/booking/widget/range_date/pick_range_dialog.dart';
import 'package:hotels/modules/booking/widget/white_card.dart';
import 'package:hotels/utils/const/colors.dart';
import 'package:hotels/utils/const/fonts.dart';
import 'package:hotels/utils/data/countrys.dart';
import 'country_picker.dart';
import 'custom_textfaild.dart';
import 'range_date/footerPickerCustom.dart';

class BookingForm extends StatelessWidget {
  BookingForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Form(
      key: BookingCubit.get(context).formKay,
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.all(12),
        decoration: ShapeDecoration(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            gradient: LinearGradient(colors: [
              AppColors.blueAc,
              AppColors.blue,
              AppColors.blueLg,
              AppColors.blueLgAc,
            ])),
        child: Column(
          children: [
            const SizedBox(
              height: 6,
            ),
            WhiteCard(
              hight: 64,
              child: Padding(
                padding: const EdgeInsets.all(4.0),
                child: CustomTextFaild(
                  controller: BookingCubit.get(context).selectCity,
                  validation: (val) {
                    if (val?.trim()?.isEmpty == true) return;
                  },
                  padding: 4.0,
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(18),
                      borderSide: BorderSide(
                        color: AppColors.blueLg,
                        width: 1.5,
                      )),
                  hint: 'Select city',
                  hintStyle: Appfonts.small.copyWith(fontSize: 16),
                ),
              ),
            ),
            SizedBox(
              height: 6,
            ),
            //select reange date
            WhiteCard(
              hight: 64,
              child: Padding(
                padding: const EdgeInsets.all(4.0),
                child: Container(
                    decoration: ShapeDecoration(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18),
                            side: BorderSide(
                              color: AppColors.blueLg,
                              width: 1.5,
                            ))),
                    child: Row(
                      children: [
                        Expanded(
                          child: BlocConsumer<BookingCubit, BookingState>(
                            listener: (context, state) {
                              // TODO: implement listener
                            },
                            builder: (context, state) {
                              return GestureDetector(
                                onTap: () {
                                  showDateRangePickerDialog(
                                    context: context,
                                    builder: datePickerBuilder,
                                    offset: Offset(0.0,
                                        MediaQuery.of(context).size.height / 4),
                                    footerBuilder: ({selectedDateRange}) =>
                                        footerPicker(
                                      selectedDateRange: selectedDateRange,
                                    ),
                                  );
                                },
                                child: Text(
                                  BookingCubit.get(context)
                                          .periodBooking
                                          .text
                                          .isEmpty
                                      ? 'Period Time'
                                      : BookingCubit.get(context)
                                          .periodBooking
                                          .text,
                                  style: Appfonts.small.copyWith(
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold),
                                  textAlign: TextAlign.center,
                                ),
                              );
                            },
                          ),
                        ),
                        IconButton(
                            onPressed: () {
                              BookingCubit.get(context).clearpickDate();
                            },
                            icon: Icon(
                              Icons.close,
                              color: Colors.grey.withOpacity(.7),
                            ))
                      ],
                    )),
              ),
            ),
            SizedBox(
              height: 6,
            ),
            WhiteCard(
              hight: 64,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12.0, vertical: 1.0),
                child: CountryPickerWidget(),
              ),
            ),
            SizedBox(
              height: 6,
            ),
            WhiteCard(
              hight: 64,
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.all(8.0),
                child: BlocConsumer<BookingCubit, BookingState>(
                  listener: (context, state) {
                    // TODO: implement listener
                  },
                  builder: (context, state) {
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          '${BookingCubit.get(context).bookingRooms?.num ?? 0} Room, ${BookingCubit.get(context).bookingRooms?.adults ?? 0} Adults, ${BookingCubit.get(context).bookingRooms?.childern ?? 0} Children',
                          style: Appfonts.small.copyWith(fontSize: 16),
                        ),
                        Spacer(),
                        Align(
                          alignment: Alignment.centerRight,
                          child: GestureDetector(
                              onTap: () {
                                showBottomSheet(
                                    elevation: 0,
                                    context: context,
                                    backgroundColor: Colors.transparent,
                                    builder: (context) => RoomDetails());
                              },
                              child: Icon(
                                Icons.keyboard_arrow_down,
                                color: Colors.grey.withOpacity(.7),
                              )),
                        )
                      ],
                    );
                  },
                ),
              ),
            ),
            SizedBox(
              height: 6,
            )
          ],
        ),
      ),
    );
  }
}
