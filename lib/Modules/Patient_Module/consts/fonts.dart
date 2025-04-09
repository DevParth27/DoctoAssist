import 'package:uba_doctor/Modules/Patient_Module/consts/consts.dart';

class AppFonts {
  static String nunito = "Nunito-Regular";
  static String nunitoBold = "Nunito-Bold";
}

class AppSizes {
  static const size12 = 12.0;
  static const size14 = 14.0;
  static const size16 = 16.0;
  static const size18 = 18.0;
  static const size20 = 20.0;
  static const size34 = 34.0;
  static const size22 = 22.0;
}

class AppStyles {
  static normal(
      {String? title,
      Color? color = Colors.black,
      double? size = 14,
      TextAlign alignment = TextAlign.left}) {
    return title!.text.size(size).color(color).make();
  }

  static bold(
      {String? title,
      Color? color = Colors.black,
      double? size = 14,
      TextAlign alignment = TextAlign.left}) {
    return title!.text
        .size(size)
        .color(color)
        .fontFamily(AppFonts.nunitoBold)
        .align(alignment)
        .make();
  }
}
