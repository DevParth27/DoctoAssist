import 'package:uba_doctor/Modules/Patient_Module/consts/consts.dart';

class CustomTextField extends StatefulWidget {
  final String hint;
  final TextEditingController?
      controller; // Changed from textController to controller
  final Color textColor;
  final Color borderColor;

  const CustomTextField({
    super.key,
    required this.hint,
    this.controller, // Updated parameter name
    this.textColor = Colors.black,
    this.borderColor = Colors.black,
  });

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller, // Updated to use controller
      cursorColor: AppColors.blueColor,
      decoration: InputDecoration(
        isDense: true,
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: widget.borderColor),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: widget.borderColor),
        ),
        border: OutlineInputBorder(
          borderSide: BorderSide(color: widget.borderColor),
        ),
        hintText: widget.hint,
        hintStyle: TextStyle(color: widget.textColor),
      ),
    );
  }
}
