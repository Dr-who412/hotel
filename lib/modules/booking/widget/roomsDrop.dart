import 'package:fcountry_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:hotels/controller/booking_cubit.dart';
import 'package:hotels/model/booked_Room.dart';
import 'package:hotels/model/country.dart';
import 'package:hotels/utils/const/colors.dart';
import 'package:hotels/utils/const/fonts.dart';
import 'package:hotels/utils/data/countrys.dart';

class RoomsDropWidget extends StatefulWidget {
  const RoomsDropWidget({Key? key}) : super(key: key);

  @override
  State<RoomsDropWidget> createState() => _RoomsDropWidget();
}

class _RoomsDropWidget extends State<RoomsDropWidget> {
  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<BookedRoom>(
      menuMaxHeight: MediaQuery.of(context).size.height / 2,
      alignment: AlignmentDirectional.topCenter,
      value: BookingCubit.get(context).bookingRooms.first,
      dropdownColor: Colors.white.withOpacity(.9),
      iconEnabledColor: AppColors.blueLgAc,
      validator: (value) {
        if (value == null) {
          return "choose your country please";
        }
        return null;
      },
      elevation: 0,
      focusColor: Colors.transparent,
      borderRadius: BorderRadius.circular(16),
      decoration: InputDecoration(
        border: InputBorder.none,
        fillColor: Colors.transparent,
      ),
      onChanged: (BookedRoom? newValue) {
        BookingCubit.get(context).selectedRoom = newValue;
      },
      padding: EdgeInsets.zero,
      icon: Icon(
        Icons.keyboard_arrow_down,
        color: Colors.grey.withOpacity(.7),
      ),
      isExpanded: true,
      items: BookingCubit.get(context).bookingRooms?.map<DropdownMenuItem<BookedRoom>>(
              (BookedRoom? room) {
            return DropdownMenuItem<BookedRoom>(
value: BookedRoom(
  adults: room!.adults,
  childern: room!.childern,
  num: room!.num,
  agesOfChildern: room!.agesOfChildern,
   pet: room!.pet,

),
              child: Text(
                '${room?.num ?? 0} Room, ${room?.adults ?? 0} Adults, ${room?.childern ?? 0} Children',

                style: Appfonts.small.copyWith(fontSize: 12),
              ),
            );
          }).toList(),
    );
  }
}
