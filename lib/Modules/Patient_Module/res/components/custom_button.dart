import 'package:uba_doctor/Modules/Patient_Module/consts/consts.dart';

class CustomButton extends StatelessWidget {
  final Function()? onTap;
  final String buttonText;
  const CustomButton(
      {super.key, required this.buttonText, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: context.screenWidth - 60,
      height: 44,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          shape: const StadiumBorder(),
          backgroundColor: AppColors.navcolor,
          foregroundColor: AppColors.whiteColor,
        ),
        onPressed: onTap,
        child: Text(
          buttonText,
          style: const TextStyle(
            fontSize: 18, // Increased font size
            fontWeight: FontWeight.bold, // Optional: Add bold font weight
          ),
        ),
      ),
    );
  }
}
