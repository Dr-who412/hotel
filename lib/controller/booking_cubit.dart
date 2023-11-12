import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_date_range_picker/flutter_date_range_picker.dart';
import 'package:hotels/model/booked_Room.dart';
import 'package:hotels/model/country.dart';

import 'booking_state.dart';

class BookingCubit extends Cubit<BookingState> {
  BookingCubit() : super(InitState());
  static BookingCubit get(context) => BlocProvider.of(context);
  TextEditingController selectCity = TextEditingController();
  TextEditingController periodBooking = TextEditingController();
  var formKay = GlobalKey<FormState>();
  void checkValidate() {
    formKay.currentState?.validate();
  }

  CountryItem? selectedCountry;
  BookedRoom bookingRooms =
      BookedRoom(num: 1, childern: 0, adults: 1, agesOfChildern: []);
  DateRange? pickedrange;
  pickDate(DateRange? range) {
    if (range?.start != null && range?.end != null) {
      pickedrange = range;
      periodBooking.text =
          '${range?.start.year}-${range?.start.month}-${range?.start.day}=>${range?.end.year}-${range?.end.month}-${range?.end.day}';
      emit(PickRangeState());
    }
  }

  clearpickDate() {
    periodBooking.text = 'period';
    emit(ClearPickRangeState());
  }

  //ADD bew details room
  addRoom() {
    bookingRooms.num = bookingRooms.num + 1;
    emit(ChangeRoomCountState());
  }

  removeRoom() {
    if (bookingRooms.num > 1) {
      bookingRooms.num = bookingRooms.num - 1;
      emit(ChangeRoomCountState());
    }
  }

//add addults to room
  addAdults() {
    bookingRooms.adults = bookingRooms.adults + 1;
    emit(ChangeAdultsState());
  }
//remove addults to room

  removeAdults() {
    if (bookingRooms.adults >= 1) {
      bookingRooms.adults = bookingRooms.adults - 1;
      emit(ChangeAdultsState());
    }
  }
//add child to room

  addChildern() {
    bookingRooms.childern = bookingRooms.childern + 1;
    bookingRooms.agesOfChildern.add(12);
    emit(ChangeChildernState());
  }
//remove child to room

  removeChildern() {
    if (bookingRooms.childern >= 1) {
      bookingRooms.childern = bookingRooms.childern - 1;
      bookingRooms.agesOfChildern.removeLast();

      emit(ChangeChildernState());
    }
  }

  switchPet(bool value) {
    bookingRooms.pet = value;
    emit(ChangePetState());
  }
}
