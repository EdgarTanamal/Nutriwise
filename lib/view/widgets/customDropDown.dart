part of 'widgets.dart';

class Customdropdown extends StatefulWidget {
  final String question;
  final List<String> activities;
  final String hint;
  final ValueChanged<String?> onChanged;  // Callback untuk mengembalikan nilai yang dipilih

  const Customdropdown({
    super.key,
    required this.question,
    required this.activities,
    required this.hint,
    required this.onChanged,


  });

  @override
  State<Customdropdown> createState() => _CustomdropdownState();
}

class _CustomdropdownState extends State<Customdropdown> {
  String? selectedActivity;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
            widget.question,
            style: GoogleFonts.archivo(
                fontSize: 15,
                fontWeight: FontWeight.bold)
        ),
        SizedBox(height: 8),
        DropdownButtonFormField<String>(
          value: selectedActivity,
          items: widget.activities
              .map((activity) => DropdownMenuItem(
            value: activity,
            child: Text(
                activity,
              style: GoogleFonts.archivo(
                color: AppColors.textColor,
                fontWeight: FontWeight.w500
              ),
            ),
          ))
              .toList(),
          onChanged: (value) {
            setState(() {
              selectedActivity = value;
            });
            widget.onChanged(value); // Mengirim nilai kembali ke widget induk
          },
          decoration: InputDecoration(
            enabledBorder:  OutlineInputBorder(
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
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
                borderSide: const BorderSide(
                  color: AppColors.button,
                  width: 2
                ),
              )),
          validator: (value){
            if(value == null){
              return "Please select an option";
            }
            return null;
          },
          hint: Text(
              widget.hint,
            style: GoogleFonts.archivo(
              color: AppColors.subText,
              fontSize: 14,
              fontWeight: FontWeight.w500
            ),
          ),
        ),
      ],
    );
  }
}
