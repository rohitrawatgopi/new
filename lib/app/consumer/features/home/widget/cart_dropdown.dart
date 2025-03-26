import 'package:flutter/material.dart';

class CartDropdown extends StatelessWidget {
  const CartDropdown({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.red,
        borderRadius: BorderRadius.circular(12),
      ),
      height: 43,
      width: 90,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            height: 40,
            width: 60,
            decoration: const BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
            ),
            child: Image.asset("assets/images/cart.home.png"),
          ),
          const Icon(Icons.arrow_drop_down, size: 30, color: Colors.white),
        ],
      ),
    );
  }
}
