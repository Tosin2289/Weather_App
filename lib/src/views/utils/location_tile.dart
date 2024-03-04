// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class LocationTile extends StatelessWidget {
  final void Function()? onTap;
  final String location;
  final String icon;
  final String condition;
  final String temperature;
  const LocationTile({
    Key? key,
    this.onTap,
    required this.location,
    required this.icon,
    required this.condition,
    required this.temperature,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              location,
              style: const TextStyle(color: Colors.white, fontSize: 18),
            ),
            Row(
              children: [
                Image.asset(
                  icon,
                  width: 50,
                  height: 50,
                ),
                Text(
                  condition,
                  style: const TextStyle(color: Colors.white, fontSize: 18),
                ),
              ],
            ),
            Text(
              temperature,
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 28,
                  fontWeight: FontWeight.w700),
            ),
          ],
        ),
      ),
    );
  }
}
