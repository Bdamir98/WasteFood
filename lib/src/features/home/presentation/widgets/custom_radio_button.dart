import 'package:flutter/material.dart';

class CustomRadioButton extends StatefulWidget {
  final Function(String selectedRole) onSelected;
  const CustomRadioButton({required this.onSelected, Key? key}) : super(key: key);

  @override
  State<CustomRadioButton> createState() => _CustomRadioButtonState();
}

enum Role { admin, donner, volunteer }

class _CustomRadioButtonState extends State<CustomRadioButton> {
  Role? role = Role.donner;
  @override
  void initState() {
    widget.onSelected('Donner');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Expanded(
          child: ListTile(
            title: const Text('Donor'),
            leading: Radio<Role>(
              value: Role.donner,
              groupValue: role,
              onChanged: (value) {
                setState(() {
                  role = value;
                  widget.onSelected('Donner');
                });
              },
            ),
          ),
        ),
        Expanded(
          child: ListTile(
            title: const Text('Volunteer'),
            leading: Radio<Role>(
              value: Role.volunteer,
              groupValue: role,
              onChanged: (value) {
                setState(() {
                  role = value;
                  widget.onSelected('Volunteer');
                });
              },
            ),
          ),
        ),
      ],
    );
  }
}
