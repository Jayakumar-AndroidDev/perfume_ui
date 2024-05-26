import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:portion_app_ui/model/perfume_model.dart';
import 'package:portion_app_ui/ui/detail_page/component/count_button.dart';
import 'package:portion_app_ui/ui/detail_page/component/detail_page_header.dart';
import 'package:portion_app_ui/ui/detail_page/component/perfume_bottom_content.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({super.key, required this.perfumeModel});
  final PerfumeModel perfumeModel;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Column(
        children: [
          ClipPath(
            clipper: DetailContainerClip(),
            child: Container(
              width: size.width,
              height: size.height * 0.80,
              padding: const EdgeInsets.all(10),
              decoration: const BoxDecoration(
                  color: Colors.orange,
                  gradient: LinearGradient(colors: [
                    Color.fromARGB(183, 247, 110, 46),
                    Color.fromARGB(255, 255, 104, 34),
                    Color.fromARGB(183, 247, 110, 46),
                  ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const DetailPageHeader(),
                  Hero(
                    tag: perfumeModel.name,
                    child: Center(
                      child: Image.asset(
                        perfumeModel.perfumeImage,
                        width: double.maxFinite,
                        height: 350,
                      ),
                    ),
                  ),
                  const PerfumeBottomContent(),
                  const Text('')
                ],
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        perfumeModel.name,
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 30),
                      ),
                      Text(
                        perfumeModel.price,
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 30),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                        flex: 1,
                        child: SizedBox(
                          height: 60,
                          child: ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.black,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            child: const Text(
                              'Add to Cart',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      const CountButton()
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

 class DetailContainerClip extends CustomClipper<Path> {
  
  @override
  Path getClip(Size size) {
    final w = size.width;
    final h = size.height;

    final path = Path();

    path.lineTo(0, h * 0.95);

    path.quadraticBezierTo(w * 0.50,h,w, h * 0.95);

    path.lineTo(w, 0);

    path.close();

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;

 }
