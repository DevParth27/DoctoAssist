import 'package:uba_doctor/Modules/Patient_Module/consts/consts.dart';
import 'package:uba_doctor/Modules/Patient_Module/consts/lists.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: AppColors.whiteColor),
        backgroundColor: AppColors.navcolor,
        elevation: 0.0,
        title: AppStyles.bold(
            title: "User ${AppStrings.settings}",
            color: AppColors.whiteColor,
            size: AppSizes.size18),
      ),
      body: Column(
        children: [
          ListTile(
            leading: CircleAvatar(child: Image.asset(AppAssets.icSeniorFemale)),
            title: AppStyles.bold(title: "Username"),
            subtitle: AppStyles.normal(title: "User@gmail.com"),
          ),
          const Divider(),
          10.heightBox,
          ListView(
              shrinkWrap: true,
              children: List.generate(
                  settingsList.length,
                  (index) => ListTile(
                        onTap: () {},
                        leading: Icon(
                          settingsListIcon[index],
                          // color: AppColors.navcolor,
                        ),
                        title: AppStyles.bold(title: settingsList[index]),
                      ))),
        ],
      ),
    );
  }
}
