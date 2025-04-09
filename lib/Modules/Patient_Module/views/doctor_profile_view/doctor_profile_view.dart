import 'package:get/get.dart';
import 'package:uba_doctor/Modules/Patient_Module/consts/consts.dart';
import 'package:uba_doctor/Modules/Patient_Module/res/components/custom_button.dart';

class DoctorProfileView extends StatelessWidget {
  const DoctorProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgDarkColor,
      appBar: AppBar(
        title: AppStyles.bold(
            title: "Doctor name",
            color: AppColors.whiteColor,
            size: AppSizes.size18),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.all(12),
                height: 100,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    // CircleAvatar(radius: 30,child: ClipOval(child: Image.asset(AppAssets.realF1),),),
                    CircleAvatar(
                        radius: (40),
                        backgroundColor: Colors.white,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(50),
                          child: Image.asset(AppAssets.realM1),
                        )),
                    10.widthBox,
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          AppStyles.bold(
                              title: "Doctor 1",
                              color: AppColors.textColor,
                              size: AppSizes.size16),
                          AppStyles.bold(
                              title: "Category",
                              color: AppColors.textColor.withOpacity(0.65),
                              size: AppSizes.size12),
                          const Spacer(),
                          VxRating(
                            selectionColor: AppColors.yellowColor,
                            onRatingUpdate: (value) {},
                            maxRating: 5,
                            value: 4,
                            count: 5,
                            // isSelectable: false,
                            stepInt: true,
                          )
                        ],
                      ),
                    ),
                    AppStyles.bold(
                        title: "See all Reviews",
                        color: AppColors.navcolor,
                        size: AppSizes.size12),
                  ],
                ),
              ),
              10.heightBox,
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: AppColors.whiteColor,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ListTile(
                      title: AppStyles.bold(
                        title: "Phone Number",
                        color: AppColors.textColor,
                      ),
                      subtitle: AppStyles.normal(
                        title: "+91 987654321",
                        color: AppColors.textColor.withOpacity(0.65),
                        size: AppSizes.size12,
                      ),
                      trailing: Container(
                          width: 50,
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: AppColors.yellowColor,
                          ),
                          child: Icon(
                            Icons.phone,
                            color: AppColors.whiteColor,
                          )),
                    ),
                    10.heightBox,
                    AppStyles.bold(
                        title: "About",
                        color: AppColors.textColor,
                        size: AppSizes.size16),
                    5.heightBox,
                    AppStyles.normal(
                      title: "This is the information about the doctor",
                      color: AppColors.textColor.withOpacity(0.65),
                      size: AppSizes.size12,
                    ),
                    10.heightBox,
                    AppStyles.bold(
                        title: "Address",
                        color: AppColors.textColor,
                        size: AppSizes.size16),
                    5.heightBox,
                    AppStyles.normal(
                      title: "Address of the doctor",
                      color: AppColors.textColor.withOpacity(0.65),
                      size: AppSizes.size12,
                    ),
                    10.heightBox,
                    AppStyles.bold(
                        title: "Working Time",
                        color: AppColors.textColor,
                        size: AppSizes.size16),
                    5.heightBox,
                    AppStyles.normal(
                      title: "9:00 AM - 2:00 PM",
                      color: AppColors.textColor.withOpacity(0.65),
                      size: AppSizes.size12,
                    ),
                    10.heightBox,
                    AppStyles.bold(
                        title: "Services",
                        color: AppColors.textColor,
                        size: AppSizes.size16),
                    5.heightBox,
                    AppStyles.normal(
                      title: "This section tells the services of the doctor",
                      color: AppColors.textColor.withOpacity(0.65),
                      size: AppSizes.size12,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      // bottomNavigationBar: Padding(
      //   padding: const EdgeInsets.all(10.0),
      //   child: CustomButton(
      //       buttonText: "Book Appointnment",
      //       onTap: () {
      //         Get.to(() => const BookAppointmentView());
      //       }),
      // ),
    );
  }
}
