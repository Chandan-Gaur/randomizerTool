// ignore_for_file: prefer_const_constructors, non_constant_identifier_names

import 'package:auto_size_text/auto_size_text.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';

class DropDownWidgetCoustom extends StatelessWidget {
  DropDownWidgetCoustom({
    super.key,
    // ignore: non_constant_identifier_names
    required this.selectedValue,
  });

  // ignore: non_constant_identifier_names
  final ValueNotifier<String> selectedValue;
  final List<String> items_list = [
    'Item1',
    'Item2',
    'Item3',
    'Item4',
  ];
  @override
  Widget build(BuildContext context) {
    var wsize = MediaQuery.of(context).size.width;
    var hsize = MediaQuery.of(context).size.height;
    return DropdownButtonHideUnderline(
      child: DropdownButton2<String>(
        hint: Text(
          'Select Item',
          style: TextStyle(
            fontSize: 14,
            color: Theme.of(context).hintColor,
          ),
        ),
        items: items_list
            .map((String item) => DropdownMenuItem<String>(
                  value: item,
                  child: AutoSizeText(
                    item,
                    style: TextStyle(
                      fontSize: 14,
                    ),
                    maxLines: 1,
                    minFontSize: 8,
                    wrapWords: false,
                  ),
                ))
            .toList(),
        value: selectedValue.value,
        onChanged: (String? val) {
          selectedValue.value = val!;
        },
        buttonStyleData: ButtonStyleData(
          padding: EdgeInsets.symmetric(horizontal: 16),
          height: hsize / 19,
          width: wsize / 8,
        ),
        menuItemStyleData: MenuItemStyleData(
          height: 40,
        ),
      ),
    );
  }
}
