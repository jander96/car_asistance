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
  const CustomDropDown({super.key});

  @override
  State<CustomDropDown> createState() {
    
    return _CustomDropDownState();
  }
}

class _CustomDropDownState extends State<CustomDropDown> {
  String _selectedState = "Florida";
  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      icon: const Icon(Icons.keyboard_arrow_down_outlined),
      value: _selectedState,
      items: _states.map((String state) {
        return DropdownMenuItem<String>(
         
          value: state,
          child: Column(
            children: [
              FadeIn(child: Text(state)),
              
            ],
          ),
        );
      }).toList(),
      onChanged: (value) {
        setState(() {
          if (value != null) {
            _selectedState = value;
          }
        });
      },
    );
  }
}
