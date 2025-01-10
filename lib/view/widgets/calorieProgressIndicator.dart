part of'widgets.dart';

class CalorieProgressIndicator extends StatelessWidget {
  final double calorieConsumed;
  final double calorieGoal;
  final Gradient gradient;
  final Gradient yellowGradient;
  final double strokeWidth;
  final double sized;
  final bool totalCalorie;
  final String picture;
  final String name;
  final Color color;
  final bool isSelected;

  const CalorieProgressIndicator({
    Key? key,
    required this.calorieConsumed,
    required this.calorieGoal,
    required this.strokeWidth,
    required this.sized,
    required this.name,
    required this.gradient,
    this.yellowGradient = AppGradients.yellowGradient,
    this.totalCalorie = true,
    this.picture = "",
    this.color = Colors.greenAccent,
    this.isSelected = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    double progress = calorieConsumed / calorieGoal;
    double leftCalorie = calorieGoal-calorieConsumed;
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          width: sized + (isSelected ? 10 : 0),
          height:  sized + (isSelected ? 10 : 0),
          decoration: BoxDecoration(
            color: totalCalorie ? null : color,
            borderRadius: BorderRadius.circular(50),
            border: isSelected
                ? Border.all(color: Colors.blue, width: 6) // Border biru jika aktif
                : null,
          ),
          child: CustomPaint(
            painter: ProgressPainter(progress, strokeWidth, yellowGradient, gradient, totalCalorie),
          ),
        ),

        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            totalCalorie?
            SizedBox.shrink() :
            Image.asset(
               picture,
               height: 20,
              width: 20,
              fit: BoxFit.fill,

            ),
            Text(
              "$leftCalorie", // Persentase
              style: GoogleFonts.archivo(
                  fontSize: totalCalorie?36:10,
                  color: calorieConsumed>calorieGoal?
                  AppColors.yellow: AppColors.green,
                  fontWeight: FontWeight.bold
              )
            ),
            Text(
              totalCalorie?"Kcal available":"Kcal",
              style: GoogleFonts.archivo(
                  fontSize: 10,
                  color: totalCalorie? AppColors.subText:AppColors.textColor
              ),
            ),
          ],
        )
      ],
    );
  }
}

class ProgressPainter extends CustomPainter {
  final double progress;
  final double strokeWidth;
  final Gradient greengradient;
  final Gradient yellowGradient;
  final bool totalCalorie;


  ProgressPainter(
      this.progress,
      this.strokeWidth,
      this.yellowGradient,
      this.greengradient,
      this.totalCalorie,
      );

  @override
  void paint(Canvas canvas, Size size) {
    // Paint for the background circle
    Paint backgroundPaint = Paint()
      ..color = AppColors.grey
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth;

    // Paint for the green progress circle (up to 100%) with gradient
    Paint progressPaintGreen = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth
      ..strokeCap = StrokeCap.round;

    // Apply a RadialGradient to the green progress
    progressPaintGreen.shader = greengradient.createShader(
        Rect.fromCircle(
            center: Offset(size.width / 2, size.height / 2),
            radius: size.width / 2));

    // Paint for the yellow progress circle (above 100%) with gradient
    Paint progressPaintYellow = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth
      ..strokeCap = StrokeCap.round;

    // Apply a RadialGradient to the yellow progress
    progressPaintYellow.shader = yellowGradient.createShader(
        Rect.fromCircle(
            center: Offset(size.width / 2, size.height / 2),
            radius: size.width / 2));

    // Draw the background circle
    canvas.drawCircle(Offset(size.width / 2, size.height / 2), size.width / 2, backgroundPaint);

    // Calculate the angle for the green progress (up to 100%)
    double sweepAngleGreen = 2 * 3.14159265359 * (progress < 1.0 ? progress : 1.0); // Green progress (max 100%)

    // Draw the green progress arc (up to 100%)
    canvas.drawArc(
      Rect.fromCircle(center: Offset(size.width / 2, size.height / 2), radius: size.width / 2),
      -3.14159265359 / 2, // Start angle (top of the circle)
      sweepAngleGreen, // Sweep angle based on progress
      false,
      progressPaintGreen,
    );

    // If progress exceeds 100%, draw the yellow part
    if (progress > 1.0) {
      double sweepAngleYellow = 2 * 3.14159265359 * (progress - 1.0); // Yellow progress (above 100%)

      // Draw the yellow progress arc (for progress above 100%)
      canvas.drawArc(
        Rect.fromCircle(center: Offset(size.width / 2, size.height / 2), radius: size.width / 2),
        -3.14159265359 / 2 + sweepAngleGreen, // Start angle after the green progress
        sweepAngleYellow, // Sweep angle for the yellow part
        false,
        progressPaintYellow,
      );
    }
  }

  @override
  bool shouldRepaint(covariant ProgressPainter oldDelegate) {
    return oldDelegate.progress != progress;
  }
}
