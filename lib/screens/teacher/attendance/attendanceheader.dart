import 'package:flutter/material.dart';
import '../../../utils/colors.dart';

class AttendancePageHeader extends StatefulWidget {
  const AttendancePageHeader(
      {Key? key,
      required this.selectedCourse,
      required this.courses,
      required this.height,
      required this.width})
      : super(key: key);

  final String selectedCourse;
  final List<String> courses;
  final double height, width;

  @override
  State<AttendancePageHeader> createState() => _AttendancePageHeaderState();
}

class _AttendancePageHeaderState extends State<AttendancePageHeader> {
  @override
  Widget build(BuildContext context) {
    String currentCourse = widget.selectedCourse;

    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text("Select Course"),
          Container(
            width: widget.width,
            height: widget.height,
            decoration: const BoxDecoration(
              color: widgetBackgroundWhtie,
              borderRadius: BorderRadius.all(
                Radius.circular(10.0),
              ),
            ),
            padding: const EdgeInsets.all(8.0),
            child: DropdownButtonHideUnderline(
              child: DropdownButton<String>(
                focusColor: widgetBackgroundWhtie,
                dropdownColor: widgetBackgroundWhtie,
                isExpanded: true,
                borderRadius: BorderRadius.circular(10),
                icon: const Icon(
                  Icons.arrow_drop_down,
                  color: lightThemeDropDownIconColor,
                ),
                value: currentCourse,
                onChanged: (newValue) =>
                    setState(() => currentCourse = newValue as String),
                items: widget.courses
                    .map(
                      (e) => DropdownMenuItem<String>(
                        child: Text(e),
                        value: e,
                      ),
                    )
                    .toList(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
