import 'package:flutter/material.dart';
import 'package:iynfluencer/core/utils/color_constant.dart';
import 'package:iynfluencer/core/utils/size_utils.dart';

class GetDropdownButtonFormField<Country> extends StatelessWidget {
  final List<DropdownMenuItem<Country>> items;
  final Country? value;
  final void Function(Country?) onChanged;
  final FormFieldValidator<Country?>? validator;

  GetDropdownButtonFormField({
    Key? key,
    required this.items,
    required this.value,
    required this.onChanged,
    this.validator,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<Country>(
      items: items,
      value: value,
      onChanged: onChanged,
      validator: validator,
      style: TextStyle(
        color: ColorConstant.gray900, // Text color
        fontSize: getFontSize(14),
        fontFamily: 'Satoshi',
        fontWeight: FontWeight.w300,
      ),
      decoration: InputDecoration(
        hintText: "Country", // Placeholder text
        hintStyle: TextStyle(
          color: ColorConstant.gray600Ab, // Placeholder text color
          fontSize: getFontSize(14),
          fontFamily: 'Satoshi',
          fontWeight: FontWeight.w300,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(6.0),
          borderSide: BorderSide.none,
        ),
        filled: true,
        fillColor: ColorConstant.gray200, // Background color
        contentPadding:
            EdgeInsets.symmetric(vertical: 10, horizontal: 14), // Padding
      ),
      isDense: true,
    );
  }
}
