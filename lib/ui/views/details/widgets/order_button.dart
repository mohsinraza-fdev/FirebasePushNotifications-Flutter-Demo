import 'package:flutter/material.dart';

class OrderButton extends StatelessWidget {
  const OrderButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: 60,
      decoration: BoxDecoration(
        color: Colors.amber[800],
        borderRadius: BorderRadius.circular(40),
        boxShadow: [
          BoxShadow(
            offset: const Offset(0, 1),
            blurRadius: 4,
            color: Colors.black.withOpacity(0.25),
          ),
        ],
      ),
      child: const Text(
        'Order Now',
        style: TextStyle(
            color: Colors.white, fontSize: 26, fontWeight: FontWeight.w500),
      ),
    );
  }
}
