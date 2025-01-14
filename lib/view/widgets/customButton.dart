part of 'widgets.dart';

class Custombutton extends StatelessWidget {
  final Future<void> Function()? submitForm;
  final String detail;
  final String route;
  final GlobalKey<FormState>? formKey;
  final bool shouldNavigate;


  const Custombutton({
    super.key,
    this.submitForm,
    required this.detail,
    required this.route,
    this.formKey,
    this.shouldNavigate=false,

  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 43,
      child: ElevatedButton(
        onPressed:() async {
          if (shouldNavigate) {
            Navigator.pushNamed(context, route);
          } else {
            // Jika tombol digunakan untuk validasi dan submit form
            if (formKey?.currentState?.validate() ?? false) {
              if (submitForm != null) {
                try{
                  await submitForm!();

                  Navigator.pushNamed(context, route);
                }catch(e){
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text(e.toString())),
                  );
                }
              }
            } else {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text("Please fill all fields correctly")),
              );
            }
          }
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.green,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),

          ),
        ),
        child: Text(
          detail,
          style: GoogleFonts.archivo(
            fontSize: 20,
            color: AppColors.textColor,
            fontWeight: FontWeight.bold

          ),
        ),
      ),
    );
  }
}
