import 'package:flutter/material.dart';
import 'package:trade_app/view/components/custom_text/custom_text.dart';

class CustomRadioButton extends StatelessWidget {
  final String title;
  final List<String> options;
  final String selectedOption;
  final ValueChanged<String> onOptionChanged;

  const CustomRadioButton({
    super.key,
    required this.title,
    required this.options,
    required this.selectedOption,
    required this.onOptionChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomText(
          textAlign: TextAlign.start,
          text: title,
          fontSize: 16,
          fontWeight: FontWeight.w600,

        maxLines: 2,),
        Column(
          children: List.generate(options.length, (index) {
            return RadioListTile<String>(
              title: Text(options[index]),
              value: options[index],
              groupValue: selectedOption,
              onChanged: (value) => onOptionChanged(value!),
            );
          }),
        ),
      ],
    );
  }
}
