import 'package:flutter/material.dart';

class CustomSingleSlider extends StatelessWidget {
  final double value;
  final double min;
  final double max;
  final int divisions;
  final ValueChanged<double>? onChanged;

  const CustomSingleSlider({
    super.key,
    required this.value,
    this.min = 0.0,
    this.max = 25000.0,
    this.divisions = 250,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Slider(
      value: value,
      onChanged: onChanged,
      min: min,
      max: max,
      divisions: divisions,
      label: value.toString(),
      activeColor: Colors.blue,
      inactiveColor: Colors.white,
    );
  }
}
