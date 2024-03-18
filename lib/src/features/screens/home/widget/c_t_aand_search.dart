import 'package:flutter/material.dart';
import 'package:realest_app/src/constants/text_strings.dart';

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
          TextField(
            decoration: InputDecoration(
              hintText: kHomeSearch,
              hintStyle: const TextStyle(color: Color(0xFF808080)),
              prefixIcon: const Icon(
                Icons.search_rounded,
                color: Color(0xFF808080),
                size: 40.0,
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30.0),
                borderSide: BorderSide.none,
              ),
              filled: true,
              fillColor: const Color(0xFFEFEFEF),
            ),
          ),
        ],
      ),
    );
  }
}
