import 'package:flutter/material.dart';

class WeatherTile1 extends StatelessWidget {
  const WeatherTile1({
    Key? key,
    required this.time,
    required this.image,
    required this.title,
  }) : super(key: key);
  final String image, title;
  final time;
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
            Text(time.toString(),
                style: const TextStyle(
                    color: Colors.white, fontWeight: FontWeight.w700)),
          ],
        )
      ],
    );
  }
}
