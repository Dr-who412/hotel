import 'package:flutter/material.dart';
import 'package:hotels/utils/const/fonts.dart';

class CustomTextFaild extends StatelessWidget {
  TextEditingController controller;
  String? hint;
  TextStyle? inputStyle;
  TextStyle? hintStyle;
  TextStyle? centerStyle;
  double? padding;
  Widget? suffex;
  Widget? preffex;
  InputBorder? border;
  String? centerText;
  Widget? lableWidget;
  bool? enable;
  Function? onTap;
  Function(String?) validation;
  CustomTextFaild(
      {Key? key,
      this.inputStyle,
      this.enable,
      this.onTap,
      this.preffex,
      required this.validation,
      this.hintStyle,
      this.centerStyle,
      this.padding,
      this.suffex,
      this.hint,
      this.centerText,
      this.lableWidget,
      this.border,
      required this.controller})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLines: 1,
      enabled: this.enable ?? true,
      onTap: () {
        this.onTap;
      },
      textAlign: TextAlign.center,
      cursorHeight: 24,
      validator: (val) => this.validation(val),
      controller: this.controller,
      style: inputStyle ?? Appfonts.small.copyWith(fontSize: 16),
      decoration: InputDecoration(
          label: this.lableWidget,
          semanticCounterText: centerText ?? null,
          counterStyle: centerStyle ?? Appfonts.small,
          counterText: this.centerText ?? null,
          border: this.border ?? InputBorder.none,
          enabledBorder: this.border ?? InputBorder.none,
          hintText: this.hint ?? null,
          contentPadding: EdgeInsets.symmetric(horizontal: this.padding ?? 0.0),
          suffixIcon: this.suffex ?? null,
          prefix: this.preffex ?? null,
          hintStyle: this.hintStyle ??
              TextStyle(fontSize: 16, color: Colors.black.withOpacity(.6))),
    );
  }
}
