 
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:portion_app_ui/model/perfume_model.dart';
import 'package:portion_app_ui/ui/home_page/component/home_page_header.dart';
import 'package:portion_app_ui/ui/home_page/component/sanitizer_list_component.dart';
import 'package:portion_app_ui/util/util.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin {

  late AnimationController animationController;
  late Animation<RelativeRect> positionAnimation;
  late Animation<double> fadeInAnimation;

  RelativeRectTween tween = RelativeRectTween(
    begin: const RelativeRect.fromLTRB(0, 50, 0, 0),
    end: const RelativeRect.fromLTRB(0, 0, 0, 0)
  );

  Tween<double> fadeIn = Tween(begin: 0.0,end: 1.0);

  @override
  void initState() {
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );
    positionAnimation = tween.animate(animationController);
    fadeInAnimation = fadeIn.animate(animationController);
    animationController.forward();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        width: size.width,
        height: size.height,
        padding: const EdgeInsets.all(10),
        decoration: const BoxDecoration(
            gradient: LinearGradient(colors: [
          Color.fromARGB(255, 247, 215, 122),
          Color.fromARGB(255, 253, 202, 60)
        ], begin: Alignment.topLeft, end: Alignment.bottomCenter)),
        child: SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const HomePageHeader(),
              const Gap(10),
              SizedBox(
                width: size.width,
                height: 50,
                child: TextField(
                  textAlignVertical: TextAlignVertical.center,
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.only(left: 10),
                    isCollapsed: true,
                    suffixIcon: Padding(
                      padding: const EdgeInsets.all(12),
                      child: SvgPicture.asset(
                        'images/search_pic.svg',
                        width: 10,
                        height: 10,
                      ),
                    ),
                    enabledBorder: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        borderSide: BorderSide(
                          color: Colors.transparent,
                        )),
                    focusedBorder: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        borderSide: BorderSide(
                          color: Colors.transparent,
                        )),
                    hintText: 'Perfume',
                    filled: true,
                    fillColor: const Color.fromARGB(255, 253, 233, 172),
                  ),
                ),
              ),
              const Gap(10),
              Expanded(
                  child: Stack(
                children: [
                  PositionedTransition(
                    rect: positionAnimation,
                    child: FadeTransition(
                      opacity: fadeInAnimation,
                      child: SingleChildScrollView(
                        child: StaggeredGrid.count(
                          mainAxisSpacing: 10,
                          crossAxisSpacing: 10,
                          crossAxisCount: 2,
                          children: [
                            const Text(
                              '14 items \n found',
                              style: TextStyle(
                                  fontSize: 30, fontWeight: FontWeight.bold),
                            ),
                            for (var i = 0; i <= listOfPerfume.length - 1; i++)
                              GestureDetector(
                                onTap: () {
                                  Navigator.of(context).pushNamed(Util.detailPage,arguments: listOfPerfume[i]);
                                },
                                child: SanitizerListComponent(
                                  name: listOfPerfume[i].name,
                                  ingredients: listOfPerfume[i].ingredients,
                                  price: listOfPerfume[i].price,
                                  image: listOfPerfume[i].perfumeImage,
                                ),
                              )
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ))
            ],
          ),
        ),
      ),
    );
  }
}
