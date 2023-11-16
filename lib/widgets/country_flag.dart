import 'package:flutter/material.dart';
import 'package:country_flags/country_flags.dart';

class CountryFlags extends StatelessWidget {
  final String countryCode;
  final double width;
  final double height;

  CountryFlags({
    required this.countryCode,
    this.width = 30,
    this.height = 30,
  });

  @override
  Widget build(BuildContext context) {
    return CountryFlag.fromCountryCode(
      countryCode,
      height: height,
      width: width,
      borderRadius: 8,
    );
  }
}
