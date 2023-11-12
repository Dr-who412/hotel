import 'package:flutter/material.dart';
import 'package:hotels/utils/const/colors.dart';
import 'package:hotels/utils/const/fonts.dart';

class CountWidget extends StatelessWidget {
  bool addEnable;
  bool removeEnable;
  int count;
  Function removeFun;
  Function addFun;
  CountWidget(
      {Key? key,
      required this.count,
      required this.addEnable,
      required this.removeEnable,
      required this.addFun,
      required this.removeFun})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        IconButton(
            onPressed: () {
              if (removeEnable) removeFun();
            },
            icon: Opacity(
              opacity: removeEnable == true ? 1 : 0.4,
              child: Container(
                  decoration: ShapeDecoration(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(28),
                        side: BorderSide(color: AppColors.blueLg)),
                  ),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  child: Icon(
                    Icons.remove,
                    color: AppColors.blueLgAc,
                  )),
            )),
        Text(
          count.toString(),
          style: Appfonts.smallBlack,
        ),
        Opacity(
          opacity: addEnable == true ? 1 : 0.4,
          child: IconButton(
              onPressed: () {
                if (addEnable) addFun();
              },
              icon: Container(
                  decoration: ShapeDecoration(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(28),
                        side: BorderSide(color: AppColors.blueLg)),
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  child: Icon(
                    Icons.add,
                    color: AppColors.blueLgAc,
                  ))),
        ),
      ],
    );
  }
}
