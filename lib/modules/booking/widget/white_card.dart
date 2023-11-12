import 'package:flutter/material.dart';

class WhiteCard extends StatelessWidget {
  Widget child;
  double? elevet;
  double? radues;

  double? hight;

  WhiteCard(
      {Key? key, required this.child, this.elevet, this.radues, this.hight})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: this.hight,
      child: Card(
        color: Colors.white,
        margin: EdgeInsets.all(8),
        elevation: this.elevet ?? 0.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(this.radues ?? 18),
        ),
        child: this.child,
      ),
    );
  }
}
