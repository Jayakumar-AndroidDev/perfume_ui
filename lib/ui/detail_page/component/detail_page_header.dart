import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class DetailPageHeader extends StatelessWidget {
  const DetailPageHeader({super.key});
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: (){
              Navigator.of(context).pop();
            },
            child: Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: const Color.fromARGB(41, 0, 0, 0)),
              child: const Icon(Icons.arrow_back_ios_new_rounded,color: Colors.white,),
            ),
          ),
          const Text(
            'Details',
            style: TextStyle(
                fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
          ),
          Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: const Color.fromARGB(41, 0, 0, 0)),
            child: const Icon(Icons.card_travel_rounded,color: Colors.white,),
          ),
        ],
      ),
    );
  }
}
