import 'package:get/get.dart';
import 'package:uba_doctor/Modules/Patient_Module/consts/consts.dart';
import 'package:uba_doctor/Modules/Patient_Module/res/components/custom_button.dart';
import 'package:uba_doctor/Modules/Patient_Module/res/components/custom_textfield.dart';
import 'package:uba_doctor/Modules/Patient_Module/views/home_view/home.dart';
import 'package:uba_doctor/Modules/Patient_Module/views/signup_view/signup_view.dart';
// ignore: unused_import

class Loginview extends StatelessWidget {
  const Loginview({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: const EdgeInsets.only(top: 40),
        // height: context.screenHeight,
        // width: context.screenWidth,
        padding: const EdgeInsets.all(15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(AppAssets.icLoginPageBoy, width: 250),
                10.heightBox,
                AppStyles.bold(
                    title: AppStrings.welcomeBack, size: AppSizes.size18),
                AppStyles.bold(title: AppStrings.weAreExcited),
                // AppStrings.welcomeBack.text.make(),
                // AppStrings.weAreExcited.text.make(),
              ],
            ), // Expanded
            20.heightBox,
            Expanded(
              // flex: 2,
              child: Form(
                  child: SingleChildScrollView(
                child: Column(
                  // mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomTextField(hint: AppStrings.email),
                    10.heightBox,
                    CustomTextField(hint: AppStrings.password),
                    20.heightBox,
                    AppStyles.normal(title: AppStrings.forgetPassword),
                    20.heightBox,
                    CustomButton(
                        buttonText: AppStrings.login,
                        onTap: () {
                          Get.to(() => const Home());
                        }),
                    20.heightBox,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        AppStyles.normal(title: AppStrings.dontHaveAccount),
                        5.widthBox,
                        GestureDetector(
                          onTap: () {
                            Get.to(() => const SignupView());
                          },
                          child: AppStyles.bold(title: AppStrings.signUp),
                        )
                      ],
                    )
                  ],
                ),
              )),
            ), // Expanded
          ], // Column children
        ), // Column
      ), // Container
    ); // Scaffold
  } // build
}
