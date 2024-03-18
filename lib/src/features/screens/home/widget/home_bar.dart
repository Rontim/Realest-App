import 'package:flutter/material.dart';
import 'package:realest_app/src/constants/text_strings.dart';

class HomeBar extends StatelessWidget {
  const HomeBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
      margin: const EdgeInsets.only(top: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          /* -- Select Location -- */

          OutlinedButton(
            onPressed: () {},
            style: OutlinedButton.styleFrom(
              side: const BorderSide(color: Color(0xFF808080)),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            ),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(Icons.location_on, color: Color(0xFF808080)),
                SizedBox(width: 10),
                Text(
                  kLocation,
                  style: TextStyle(color: Color(0xFF808080), fontSize: 16.0),
                ),
                SizedBox(width: 10),
                Icon(
                  Icons.keyboard_arrow_down_rounded,
                  color: Color(0xFF808080),
                ),
              ],
            ),
          ),

          /* -- Notifications -- */
          Container(
            height: 40.0,
            width: 40.0,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.0),
                border: Border.all(color: const Color(0xFF808080))),
            child: IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.notifications_none,
                color: Color(0xFF808080),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
