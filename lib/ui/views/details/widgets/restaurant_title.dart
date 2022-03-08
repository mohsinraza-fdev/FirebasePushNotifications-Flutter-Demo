import 'package:flutter/material.dart';

class RestaurantTitle extends StatelessWidget {
  const RestaurantTitle({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: const [
        Text(
          'XYZ Restaurant',
          style: TextStyle(
              color: Colors.black, fontSize: 30, fontWeight: FontWeight.w600),
        ),
      ],
    );
  }
}
