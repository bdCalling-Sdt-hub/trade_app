import 'package:flutter/material.dart';
import 'package:range_slider_flutter/range_slider_flutter.dart';

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
    return
    //   RangeSliderFlutter(
    //   values: [value],
    //   max: max,
    //   min: min,
    //   rangeSlider: false,
    //   tooltip: RangeSliderFlutterTooltip(
    //     alwaysShowTooltip: true,
    //     // boxStyle: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(4)),
    //     textStyle: TextStyle(color: Colors.blue),
    //   ),
    //   trackBar: RangeSliderFlutterTrackBar(
    //     activeTrackBarHeight: 6,
    //     activeTrackBar: BoxDecoration(color: Colors.blue),
    //     inactiveTrackBar: BoxDecoration(color: Colors.white),
    //   ),
    //   onDragging: (handlerIndex, lowerValue, upperValue) {
    //    // controller.updatePoints(lowerValue.toInt());
    //     onChanged
    //   },
    // );
      Slider(
        value: value >= min && value <= max ? value : min,
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
