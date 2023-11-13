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
  bool checkValidate() {
    return formKay.currentState?.validate()==true;
  }
  //list of rooms to booked
List <BookedRoom> bookingRooms=[
  BookedRoom(num: 1, childern: 0, adults: 1, agesOfChildern: []),
];
  BookedRoom? selectedRoom;

  CountryItem? selectedCountry;

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
    BookedRoom defultRooms =BookedRoom(num: bookingRooms.length+1, childern: 0, adults: 1, agesOfChildern: []);
    bookingRooms.add(defultRooms);
    emit(ChangeRoomCountState());
  }

  removeRoom() {
    if (bookingRooms.length > 1) {
      bookingRooms.removeLast();
      emit(ChangeRoomCountState());
    }
  }

//add addults to room
  addAdults({required int index}) {
    bookingRooms[index].adults = bookingRooms[index].adults + 1;
    emit(ChangeAdultsState());
  }
//remove addults to room

  removeAdults({required int index}) {
    if (bookingRooms[index].adults >= 1) {
      bookingRooms[index].adults = bookingRooms[index].adults - 1;
      emit(ChangeAdultsState());
    }
  }
//add child to room

  addChildern({required int index}) {
    bookingRooms[index].childern = bookingRooms[index].childern + 1;
    bookingRooms[index].agesOfChildern.add(12);
    emit(ChangeChildernState());
  }
//remove child to room

  removeChildern({required int index} ){
    if (bookingRooms[index].childern >= 1) {
      bookingRooms[index].childern = bookingRooms[index].childern - 1;
      bookingRooms[index].agesOfChildern.removeLast();

      emit(ChangeChildernState());
    }
  }
bool petFriendy=false;
  switchPet({required bool value}) {
    petFriendy = value;
    emit(ChangePetState());
  }
}
