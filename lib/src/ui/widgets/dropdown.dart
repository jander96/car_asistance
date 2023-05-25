import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';

List<String> _states = [
  'Alabama',
  'Alaska',
  'Arizona',
  'Arkansas',
  'California',
  'Colorado',
  'Connecticut',
  'Delaware',
  'Florida',
  'Georgia',
  'Hawaii',
  'Idaho',
  'Illinois',
  'Indiana',
  'Iowa',
  'Kansas',
  'Kentucky',
  'Louisiana',
  'Maine',
  'Maryland',
  'Massachusetts',
  'Michigan',
  'Minnesota',
  'Mississippi',
  'Missouri',
  'Montana',
  'Nebraska',
  'Nevada',
  'New Hampshire',
  'New Jersey',
  'New Mexico',
  'New York',
  'North Carolina',
  'North Dakota',
  'Ohio',
  'Oklahoma',
  'Oregon',
  'Pennsylvania',
  'Rhode Island',
  'South Carolina',
  'South Dakota',
  'Tennessee',
  'Texas',
  'Utah',
  'Vermont',
  'Virginia',
  'Washington',
  'West Virginia',
  'Wisconsin',
  'Wyoming',
];

class CustomDropDown extends StatefulWidget {
  final void Function(String?) onTap;
  final ColorScheme colors;
  const CustomDropDown({super.key, required this.onTap, required this.colors});

  @override
  State<CustomDropDown> createState() {
    // ignore: no_logic_in_create_state
    return _CustomDropDownState(onTap, colors);
  }
}

class _CustomDropDownState extends State<CustomDropDown> {
  String? _selectedState;
  final void Function(String?) onTap;
  final ColorScheme colors;

  _CustomDropDownState(this.onTap, this.colors);
  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      hint: const Text('Select state'),
      underline: null,
      elevation: 4,
      borderRadius: BorderRadius.circular(4),
      isDense: true,
      dropdownColor: colors.onPrimary,
      icon: const Icon(Icons.keyboard_arrow_down_outlined),
      value: _selectedState,
      items: _states.map((String state) {
        return DropdownMenuItem<String>(
          alignment: Alignment.centerLeft,
          value: state,
          child: Column(
            children: [
              FadeIn(child: Text(state)),
            ],
          ),
        );
      }).toList(),
      onChanged: (value) {
        onTap(value);

        setState(() {
          if (value != null) {
            _selectedState = value;
          }
        });
      },
    );
  }
}
