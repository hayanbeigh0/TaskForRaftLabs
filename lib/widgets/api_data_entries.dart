import 'package:flutter/material.dart';

class ApiDataEntriesWidget extends StatelessWidget {
  const ApiDataEntriesWidget({
    Key? key,
    required this.title,
    required this.info,
  }) : super(key: key);
  final String title;
  final String info;
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(
          width: 5,
        ),
        Expanded(
          child: Text(
            info,
            style: const TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
      ],
    );
  }
}
