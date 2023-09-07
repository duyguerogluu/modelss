import 'package:flutter/material.dart';

Widget discoverCard(int index) {
  double rotationFactor = 0.03;
  double rotationAngle = rotationFactor * index;

  return Container(
    width: 200,
    height: 300,
    margin: const EdgeInsets.symmetric(horizontal: 16),
    child: ClipRRect(
      borderRadius: BorderRadius.circular(16),
      child: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              color: Colors.blue,
              image: DecorationImage(
                image: NetworkImage(
                    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ9sy2uY07FIErlJ3n58xnuSv3Gzw1zctZv9g&usqp=CAU '),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Transform(
            alignment: Alignment.center,
            transform: Matrix4.identity()
              ..setEntry(3, 2, 0.001)
              ..rotateY(rotationAngle),
            child: Center(
              child: Text(
                'Kart $index',
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    ),
  );
}
