import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
          style: GoogleFonts.lato(fontSize: 16, fontWeight: FontWeight.w600),
        ),
        const SizedBox(
          width: 5,
        ),
        Expanded(
          child: Text(
            info,
            style: GoogleFonts.lato(fontSize: 16),
          ),
        ),
      ],
    );
  }
}
