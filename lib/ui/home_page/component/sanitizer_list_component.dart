import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class SanitizerListComponent extends StatelessWidget {
  const SanitizerListComponent({
    super.key,
    required  this.name,
    required  this.ingredients,
    required  this.price,
    required this.image,
  });
  final String name;
  final String ingredients;
  final String price;
  final String image;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 175,
      height: 320,
      child: Stack(
        children: [
          ClipPath(
            clipper: SanitizerClip(),
            child: Container(
                padding: const EdgeInsets.all(15),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(
                    Radius.circular(15),
                  ),
                ),
                child: Stack(
                  children: [
                    Column(
                      children: [

                         Hero(
                          tag: name,
                           child: Image.asset(
                              image,
                              width: double.maxFinite,
                              height: 150,
                            ),
                         ),
                     
                         Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            name,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 17,
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            ingredients,
                            style: const TextStyle(
                              color: Colors.black54,
                              fontWeight: FontWeight.normal,
                              fontSize: 15,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 6),
                      child: Align(
                        alignment: Alignment.bottomLeft,
                        child: Text(
                          price,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 25,
                          ),
                        ),
                      ),
                    ),
                  ],
                )),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8.0, left: 8.0),
            child: Align(
              alignment: Alignment.bottomRight,
              child: Container(
                width: 78,
                height: 85,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: const Icon(
                  Icons.add,
                  color: Colors.black,
                  size: 33,
                ),
              ),
            ),
          )
        ],
      ),
    );

    // Align(
    //   alignment: Alignment.bottomRight,
    //   child: Container(
    //     width: 73,
    //     height: 72,
    //     decoration: BoxDecoration(
    //       color: Colors.white,
    //       borderRadius: BorderRadius.circular(15),
    //     ),
    //     child: const Icon(Icons.add,color: Colors.black,size: 33,),
    //   ),
    // );
  }
}

class SanitizerClip extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    double w = size.width;
    double h = size.height;

    print('bar: width:$w height:$h');

    path.lineTo(0, h);
    path.lineTo(0.40 * w, h);
    path.quadraticBezierTo(0.56 * w, 0.99 * h, 0.55 * w, 0.95 * h);
    path.lineTo(0.55 * w, 0.75 * h);
    path.quadraticBezierTo(0.54 * w, 0.72 * h, 0.58 * w, 0.72 * h);
    path.lineTo(0.85 * w, 0.72 * h);
    path.quadraticBezierTo(w, 0.73 * h, w, 0.65 * h);
    path.lineTo(w, 0);

    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
}

// class SanitizerClip extends CustomClipper<Path> {
//   @override
//   Path getClip(Size size) {
//     Path path = Path();
//     double w = size.width;
//     double h = size.height;

//     print('bar: width:$w height:$h');

//     path.lineTo(0, h);
//     path.lineTo(0.6 * w, h);
//     path.lineTo(0.6 * w, 0.78 * h);
//     path.lineTo(w, 0.78 * h);
//     path.lineTo(w, 0);

//     path.close();
//     return path;
//   }

//   @override
//   bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
// }
