import 'package:flutter/material.dart';
import 'package:portion_app_ui/model/perfume_model.dart';
import 'package:portion_app_ui/ui/detail_page/screen/detail_page.dart';
import 'package:portion_app_ui/ui/home_page/screen/home_page.dart';
import 'package:portion_app_ui/util/util.dart';

class RouteSetting {
  static Route<dynamic>? routeFunction(RouteSettings settings){
    switch(settings.name){
          case Util.detailPage: {
            PerfumeModel image = settings.arguments as PerfumeModel;
            return MaterialPageRoute(builder: (context) => DetailPage(perfumeModel: image,),);
          }
          default: {
            return MaterialPageRoute(builder: (context) => const HomePage(),);
          }
        }
  }
}