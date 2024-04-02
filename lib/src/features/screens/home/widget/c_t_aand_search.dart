import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:realest_app/src/constants/icon_strings.dart';
import 'package:realest_app/src/constants/text_strings.dart';
import 'package:realest_app/src/features/screens/swipe/property_swipe_screen.dart';

class CTAandSearch extends StatelessWidget {
  const CTAandSearch({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          const Text(
            kHomeDiscover,
            style: TextStyle(
              color: Color(0xFF808080),
              fontSize: 24.0,
            ),
          ),
          Text(
            kHomePerfectPlace,
            style: textTheme.displayLarge?.copyWith(
              fontSize: 24.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 10),
          GestureDetector(
            onTap: () => Get.to(
              () => PropertySwipeScreen(),
              transition: Transition.leftToRightWithFade,
            ),
            child: Container(
                height: 58.0,
                padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 15),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: const Color(0xFFEFEFEF),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: 200,
                      child: Row(
                        children: [
                          const ImageIcon(
                            AssetImage(ksearchIcon),
                            size: 20,
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          Text(
                            kHomeSearch,
                            style: textTheme.bodySmall?.copyWith(
                              color: Colors.black.withOpacity(0.5),
                              fontSize: 16.0,
                            ),
                          )
                        ],
                      ),
                    ),
                    Container(
                      width: 50,
                      height: 50,
                      padding: const EdgeInsets.all(5),
                      margin: const EdgeInsets.only(left: 20),
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                      ),
                      child: const ImageIcon(
                        AssetImage(kfilterIcon),
                        size: 20,
                      ),
                    ),
                  ],
                )),
          )
        ],
      ),
    );
  }
}
