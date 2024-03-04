import 'package:flutter/material.dart';

class WeatherTile2 extends StatelessWidget {
  const WeatherTile2({
    Key? key,
    required this.subtitle,
    required this.image,
    required this.title,
  }) : super(key: key);
  final String image, title, subtitle;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset(
          image,
          scale: 8,
        ),
        const SizedBox(
          width: 5,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(
                  color: Colors.white, fontWeight: FontWeight.w300),
            ),
            const SizedBox(
              height: 3,
            ),
            Text(subtitle,
                style: const TextStyle(
                    color: Colors.white, fontWeight: FontWeight.w700)),
          ],
        )
      ],
    );
  }
}
