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
    // Ensure min is less than or equal to max
    final effectiveMin = min <= max ? min : max;
    final effectiveMax = max >= min ? max : min;
    final effectiveValue = value >= effectiveMin && value <= effectiveMax ? value : effectiveMin;

    return Slider(
      value: effectiveValue,
      onChanged: onChanged,
      min: effectiveMin,
      max: effectiveMax,
      divisions: divisions,
      label: effectiveValue.toString(),
      activeColor: Colors.blue,
      inactiveColor: Colors.white,
    );
  }
}