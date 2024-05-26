import 'package:flutter/material.dart';

class PerfumeBottomContent extends StatelessWidget {
  const PerfumeBottomContent({super.key});
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 1,
          child: listItem(icon: 'images/safty.png', title: 'High\nSafty'),
        ),
        Expanded(
          flex: 1,
          child: listItem(icon: 'images/discount.png', title: '55.5%\ndiscount'),
        ),
        Expanded(
          flex: 1,
          child: listItem(icon: 'images/heart.png', title: 'Most\nliked'),
        )
      ],
    );
  }

  Widget listItem({required String icon, required String title}) {
    return Column(
      children: [
        Image.asset(
          icon,
          width: 40,
          height: 40,
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          title,
          textAlign: TextAlign.center,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold
          ),
        ),
      ],
    );
  }
}
