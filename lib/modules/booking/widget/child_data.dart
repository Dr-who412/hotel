import 'package:flutter/material.dart';
import 'package:hotels/utils/const/fonts.dart';

class ChildData extends StatelessWidget {
  int age;
  int childNum;
  ChildData({
    Key? key,
    required this.age,
    required this.childNum,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          SizedBox(width: 12),
          Text(
            'Age of child ${this.childNum}',
            style: Appfonts.smallBlack
                .copyWith(fontSize: 14, fontWeight: FontWeight.bold),
          ),
          Spacer(),
          Text(
            '${this.age} years',
            style: Appfonts.smallBlack
                .copyWith(fontSize: 16, color: Colors.black.withOpacity(.7)),
          ),
          SizedBox(width: 4),
        ],
      ),
    );
    ;
  }
}
