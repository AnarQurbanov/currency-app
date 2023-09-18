import "package:flutter/material.dart";
Widget customDropDown(List<String> items, String value, void onChange(val)) {
  return Container(
    padding: EdgeInsets.symmetric(vertical: 4,horizontal: 18),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(5),
    ),
    child: DropdownButton<String>(
      value: value,
      onChanged: (String? value) {
        onChange(value);
      },
      items: items.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    ),
  );
}
