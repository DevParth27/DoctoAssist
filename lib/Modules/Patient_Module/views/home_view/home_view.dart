import 'package:get/get.dart';
import 'package:uba_doctor/Modules/Patient_Module/consts/consts.dart';
import 'package:uba_doctor/Modules/Patient_Module/consts/lists.dart';
import 'package:uba_doctor/Modules/Patient_Module/res/components/custom_textfield.dart';
import 'package:uba_doctor/Modules/Patient_Module/views/doctor_profile_view/doctor_profile_view.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false, //remove back arrow
        // iconTheme: IconThemeData(color: AppColors.whiteColor),
        elevation: 0.0, //upr ya niche , levels on page floor
        title: AppStyles.bold(
            title: "${AppStrings.welcome} User",
            color: AppColors.whiteColor,
            size: AppSizes.size18),
        backgroundColor: AppColors.navcolor,
      ),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(14),
            // height: 100,
            color: AppColors.navcolor,
            child: Row(
              children: [
                Expanded(
                    child: CustomTextField(
                  hint: AppStrings.search,
                  borderColor: AppColors.whiteColor,
                  textColor: AppColors.whiteColor,
                )),
                10.widthBox,
                IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.search,
                      color: AppColors.whiteColor,
                    ))
              ],
            ),
          ),
          20.heightBox,
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
                SizedBox(
                  height: 80,
                  child: ListView.builder(
                      physics: const BouncingScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      itemCount: 6,
                      itemBuilder: (BuildContext context, index) {
                        return GestureDetector(
                          onTap: () {},
                          child: Container(
                            decoration: BoxDecoration(
                                color: AppColors.navcolor,
                                borderRadius: BorderRadius.circular(12)),
                            padding: const EdgeInsets.all(12),
                            margin: const EdgeInsets.only(right: 8),
                            // height: 44,
                            // width: 44,
                            child: Column(
                              children: [
                                Image.asset(
                                  iconsList[index],
                                  width: 30,
                                  color: AppColors.whiteColor,
                                ),
                                5.heightBox,
                                AppStyles.normal(
                                    title: iconsTitleList[index],
                                    color: AppColors.whiteColor),
                              ],
                            ),
                          ),
                        );
                      }),
                ),
                20.heightBox,
                Align(
                    alignment: Alignment.centerLeft,
                    child: AppStyles.bold(
                        title: "Popular Doctors",
                        color: AppColors.navcolor,
                        size: AppSizes.size18)),
                10.heightBox,
                SizedBox(
                  height: 150,
                  child: ListView.builder(
                      physics: const BouncingScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      itemCount: 3,
                      itemBuilder: (BuildContext context, index) {
                        return GestureDetector(
                          onTap: () {
                            Get.to(() => const DoctorProfileView());
                          },
                          child: Container(
                            // color: AppColors.bgDarkColor,
                            decoration: BoxDecoration(
                              color: AppColors.bgDarkColor,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            clipBehavior: Clip.hardEdge,
                            margin: const EdgeInsets.only(right: 8),
                            // color: Colors.red,
                            height: 100,
                            width: 150,
                            child: Column(
                              children: [
                                Container(
                                    color: AppColors.navcolor,
                                    width: 150,
                                    alignment: Alignment.center,
                                    child: Image.asset(
                                      AppAssets.icFemale1,
                                      width: 100,
                                      fit: BoxFit.cover,
                                    )),
                                5.heightBox,
                                AppStyles.normal(title: "Doc name"),
                                // AppStyles.normal(title: iconsTitleList[index], color: AppColors.whiteColor),
                                5.heightBox,
                                AppStyles.normal(
                                    title: "Category", color: Colors.black54),
                              ],
                            ),
                          ),
                        );
                      }),
                ),
                5.heightBox,
                GestureDetector(
                    onTap: () {},
                    child: Align(
                        alignment: Alignment.centerRight,
                        child: AppStyles.normal(
                            title: "View all", color: AppColors.navcolor))),
                20.heightBox,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: List.generate(
                      4,
                      (index) => Container(
                            decoration: BoxDecoration(
                                color: AppColors.navcolor,
                                borderRadius: BorderRadius.circular(12)),
                            padding: const EdgeInsets.all(12),
                            child: SizedBox(
                              // height: 100,
                              // width: 100,
                              child: Column(
                                children: [
                                  Image.asset(
                                    AppAssets.icPatientBody,
                                    width: 25,
                                    color: AppColors.whiteColor,
                                  ),
                                  5.heightBox,
                                  AppStyles.normal(
                                      title: "Lab Test",
                                      color: AppColors.whiteColor),
                                ],
                              ),
                            ),
                          )),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
