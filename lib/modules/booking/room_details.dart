import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hotels/controller/booking_cubit.dart';
import 'package:hotels/controller/booking_state.dart';
import 'package:hotels/modules/booking/widget/child_data.dart';
import 'package:hotels/modules/booking/widget/count_widget.dart';
import 'package:hotels/modules/booking/widget/white_card.dart';
import 'package:hotels/utils/const/colors.dart';
import 'package:hotels/utils/const/fonts.dart';

class RoomDetails extends StatelessWidget {
  const RoomDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 50),
      decoration: const BoxDecoration(
          color: Color.fromRGBO(235, 236, 238, 1),
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(16), topRight: Radius.circular(16))),
      clipBehavior: Clip.hardEdge,
      child: Scaffold(
        extendBody: true,
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          elevation: 3,
          centerTitle: true,
          leading: const SizedBox(),
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(
                  Icons.close,
                  color: Colors.black,
                )),
          ],
          backgroundColor: Colors.white,
          title: Text(
            'Rooms and Guests',
            style: Appfonts.boldBlack,
          ),
        ),
        body: SingleChildScrollView(
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.all(14),
            child: Column(
              children: [
                //rooms count
                WhiteCard(
                    elevet: 4,
                    radues: 12,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12.0),
                      child: Row(
                        children: [
                          Text(
                            'Rooms',
                            style: Appfonts.smallBlack,
                          ),
                          Spacer(),
                          BlocConsumer<BookingCubit, BookingState>(
                            listener: (context, state) {
                              // TODO: implement listener
                            },
                            buildWhen: (pre, current) {
                              if (current is ChangeRoomCountState)
                                return true;
                              else
                                return false;
                            },
                            builder: (context, state) {
                              return CountWidget(
                                addFun: () {
                                  BookingCubit.get(context).addRoom();
                                },
                                addEnable: true,
                                count:
                                    BookingCubit.get(context).bookingRooms.num,
                                removeEnable:
                                    BookingCubit.get(context).bookingRooms.num >
                                        1,
                                removeFun: () {
                                  BookingCubit.get(context).removeRoom();
                                },
                              );
                            },
                          ),
                        ],
                      ),
                    )),
                const SizedBox(
                  height: 16,
                ),
                //rooms details
                WhiteCard(
                    elevet: 4,
                    radues: 12,
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Rooms',
                            style: Appfonts.boldBlack,
                          ),
                          SizedBox(
                            height: 6,
                          ),
                          //todo change adults count
                          Row(
                            children: [
                              Text(
                                'Adults',
                                style: Appfonts.smallBlack,
                              ),
                              Spacer(),
                              BlocConsumer<BookingCubit, BookingState>(
                                listener: (context, state) {
                                  // TODO: implement listener
                                },
                                buildWhen: (pre, current) {
                                  if (current is ChangeAdultsState)
                                    return true;
                                  else
                                    return false;
                                },
                                builder: (context, state) {
                                  return CountWidget(
                                    addFun: () {
                                      BookingCubit.get(context).addAdults();
                                    },
                                    addEnable: BookingCubit.get(context)
                                            .bookingRooms
                                            .adults <
                                        4,
                                    count: BookingCubit.get(context)
                                        .bookingRooms
                                        .adults,
                                    removeEnable: BookingCubit.get(context)
                                            .bookingRooms
                                            .adults >
                                        1,
                                    removeFun: () {
                                      BookingCubit.get(context).removeAdults();
                                    },
                                  );
                                },
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 6,
                          ),
                          Row(
                            children: [
                              Text(
                                'Childern',
                                style: Appfonts.smallBlack,
                              ),
                              Spacer(),
                              BlocConsumer<BookingCubit, BookingState>(
                                listener: (context, state) {
                                  // TODO: implement listener
                                },
                                buildWhen: (pre, current) {
                                  if (current is ChangeChildernState)
                                    return true;
                                  else
                                    return false;
                                },
                                builder: (context, state) {
                                  return CountWidget(
                                    addFun: () {
                                      BookingCubit.get(context).addChildern();
                                    },
                                    addEnable: BookingCubit.get(context)
                                            .bookingRooms
                                            .childern <
                                        4,
                                    count: BookingCubit.get(context)
                                        .bookingRooms
                                        .childern,
                                    removeEnable: BookingCubit.get(context)
                                            .bookingRooms
                                            .childern >
                                        0,
                                    removeFun: () {
                                      BookingCubit.get(context)
                                          .removeChildern();
                                    },
                                  );
                                },
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 6,
                          ),
                          BlocConsumer<BookingCubit, BookingState>(
                            listener: (context, state) {
                              // TODO: implement listener
                            },
                            buildWhen: (pre, current) {
                              if (current is ChangeChildernState)
                                return true;
                              else
                                return false;
                            },
                            builder: (context, state) {
                              return Visibility(
                                visible: BookingCubit.get(context)
                                        .bookingRooms
                                        .childern >
                                    0,
                                child: Column(
                                  children: [
                                    for (int i = 1;
                                        i <=
                                            BookingCubit.get(context)
                                                .bookingRooms
                                                .childern;
                                        i++)
                                      ChildData(
                                        age: BookingCubit.get(context)
                                            .bookingRooms
                                            .agesOfChildern[i - 1],
                                        childNum: i,
                                      ),
                                  ],
                                ),
                              );
                            },
                          )
                        ],
                      ),
                    )),
                const SizedBox(
                  height: 16,
                ),
                WhiteCard(
                    elevet: 4,
                    radues: 12,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 12.0, vertical: 4),
                      child: Row(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Text(
                                    'Pet-friendy',
                                    style: Appfonts.smallBlack,
                                  ),
                                  const SizedBox(
                                    width: 2,
                                  ),
                                  const Icon(
                                    Icons.info_outline,
                                  ),
                                ],
                              ),
                              Text(
                                'Only show stays that allow pets',
                                style: Appfonts.smallBlack.copyWith(
                                    fontSize: 12,
                                    color: Colors.black.withOpacity(.7)),
                              )
                            ],
                          ),
                          Spacer(),
                          Container(
                              width: 80,
                              child: BlocConsumer<BookingCubit, BookingState>(
                                listener: (context, state) {
                                  // TODO: implement listener
                                },
                                buildWhen: (pre, current) {
                                  if (current is ChangePetState)
                                    return true;
                                  else
                                    return false;
                                },
                                builder: (context, state) {
                                  return Switch(
                                    onChanged: (val) {
                                      BookingCubit.get(context).switchPet(val);
                                    },
                                    value: BookingCubit.get(context)
                                        .bookingRooms
                                        .pet,
                                    activeColor: AppColors.blue,
                                    inactiveThumbColor: Colors.blueGrey,
                                    inactiveTrackColor:
                                        const Color.fromRGBO(235, 236, 238, .6),
                                  );
                                },
                              ))
                        ],
                      ),
                    )),
                const SizedBox(
                  height: 80,
                ),
                Card(
                  elevation: 4,
                  color: AppColors.blueLg,
                  clipBehavior: Clip.hardEdge,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8)),
                  child: InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                      alignment: Alignment.center,
                      width: double.infinity,
                      height: 46,
                      margin: const EdgeInsets.symmetric(horizontal: 34),
                      child: Text(
                        'Apply',
                        style: Appfonts.boldBlack.copyWith(color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
