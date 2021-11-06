import 'package:flutter/material.dart';


class photoInRow extends StatelessWidget {
  const photoInRow({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: Image.network(
        "https://www.seoulkoreatour.net/wp-content/uploads/2017/08/9492_Jaein-Fall-1.jpg",
        width: 160,
      ),
    );
  }
}