import 'package:flutter/material.dart';

class CountButton extends StatefulWidget {
  const CountButton({super.key});

  @override
  State<CountButton> createState() => _CountButtonState();
}

class _CountButtonState extends State<CountButton> {
  int count = 0;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: SizedBox(
          height: 60,
          child: Container(
            decoration: BoxDecoration(
                border: Border.all(color: Colors.black, width: 2),
                borderRadius: BorderRadius.circular(10)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                    onPressed: () {
                      setState(() {
                        if (count != 0) {
                          count--;
                        }
                      });
                    },
                    icon: const Icon(Icons.remove)),
                Text(count.toString(),style: const TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
                IconButton(
                    onPressed: () {
                      setState(() {
                        count++;
                      });
                    },
                    icon: const Icon(Icons.add)),
              ],
            ),
          )),
    );
  }
}
