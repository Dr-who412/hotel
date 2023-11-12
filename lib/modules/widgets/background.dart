import 'package:flutter/cupertino.dart';
import 'package:hotels/utils/const/assets.dart';

class BackGround extends StatelessWidget {
  Widget child;
  BackGround({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage(Assets.backGround), fit: BoxFit.cover)),
      child: child,
    );
  }
}
