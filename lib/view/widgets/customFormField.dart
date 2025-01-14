part of'widgets.dart';

class Customformfield extends StatelessWidget {
  final String question;
  final TextEditingController selectedController;
  final String hintText;
  final bool isUnit;
  final String unit;
  final bool isNumber;




  const Customformfield({
    super.key,
    required this.question,
    required this.selectedController,
    required this.hintText,
    this.isUnit = false,
    this.unit = "",
    this.isNumber=false,


  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
            question,
            style: GoogleFonts.archivo(
                fontSize: 15,
                fontWeight: FontWeight.bold,
              color: AppColors.textColor
            ),
        ),
        SizedBox(height: 8),
        TextFormField(
          controller: selectedController,
          keyboardType: isNumber?TextInputType.number:TextInputType.text,
          decoration: InputDecoration(
            suffixIcon: isUnit?
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  unit,
                  style: GoogleFonts.archivo(
                      fontSize:13,
                    fontWeight: FontWeight.bold,
                    color: AppColors.subText
                  ),
                ),
              ],
            ):null,
            border: OutlineInputBorder(
              borderSide: BorderSide(
                color: AppColors.green,
              ),
              borderRadius:BorderRadius.all(Radius.circular(16)) ,
            ),
            hintText: hintText,
            hintStyle: GoogleFonts.archivo(
              color: AppColors.subText,
              fontSize: 13,
              fontWeight: FontWeight.w500
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                color: AppColors.button, // Warna border saat enabled
                width: 2,          // Lebar border saat enabled
              ),
              borderRadius: const BorderRadius.all(Radius.circular(16)),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                color: AppColors.lightgreen, // Warna border saat focus
                width: 2.5,         // Lebar border saat focus
              ),
              borderRadius: const BorderRadius.all(Radius.circular(16)),
            ),
          ),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'This field cannot be empty';
            }

            // Check if number is required
            if (isNumber && int.tryParse(value) == null) {
              return 'Please enter a valid number';
            }

            return null; // If everything is valid
          },
        ),
      ],
    );
  }
}
