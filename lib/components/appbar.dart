import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Appbar extends StatelessWidget {
  const Appbar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Good Morning",
                  style: GoogleFonts.mulish(
                      fontWeight: FontWeight.w300,
                      fontSize: 14,
                      color: Colors.grey.shade500)),
              Text("Jimmy Sullivan",
                  style: GoogleFonts.mulish(
                      fontWeight: FontWeight.w800, fontSize: 18))
            ],
          ),
          Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  border: Border.all()),
              child: IconButton(
                  onPressed: () {
                    // Navigator.push(
                    //     context,
                    //     MaterialPageRoute(
                    //       builder: (context) => const Profile(),
                    //     ));
                  },
                  icon: const Icon(
                    Icons.account_circle,
                    color: Colors.black,
                  )))
        ],
      ),
    );
  }
}
