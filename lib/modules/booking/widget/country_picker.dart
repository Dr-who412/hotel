import 'package:fcountry_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:hotels/controller/booking_cubit.dart';
import 'package:hotels/model/country.dart';
import 'package:hotels/utils/const/colors.dart';
import 'package:hotels/utils/const/fonts.dart';
import 'package:hotels/utils/data/countrys.dart';

class CountryPickerWidget extends StatefulWidget {
  const CountryPickerWidget({Key? key}) : super(key: key);

  @override
  State<CountryPickerWidget> createState() => _CountryPickerWidgetState();
}

class _CountryPickerWidgetState extends State<CountryPickerWidget> {
  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<CountryItem>(
      menuMaxHeight: MediaQuery.of(context).size.height / 2,
      alignment: AlignmentDirectional.topCenter,
      value: CountryItem(
          name: 'Egypt', iso3Code: 'EGY', isoCode: 'EG', phoneCode: '20'),
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
      onChanged: (CountryItem? newValue) {
        BookingCubit.get(context).selectedCountry = newValue;
      },
      padding: EdgeInsets.zero,
      icon: Icon(
        Icons.keyboard_arrow_down,
        color: Colors.grey.withOpacity(.7),
      ),
      items: CountryItemList?.map<DropdownMenuItem<CountryItem>>(
          (CountryItem? country) {
        return DropdownMenuItem<CountryItem>(
          value: CountryItem(
              name: country?.name,
              phoneCode: country?.phoneCode,
              isoCode: country?.isoCode,
              iso3Code: country?.iso3Code),
          child: Text(
            country?.name ?? '',
            style: Appfonts.small.copyWith(fontSize: 12),
          ),
        );
      }).toList(),
    );
  }
}
