part of'widgets.dart';

class CalorieProgressIndicator extends StatelessWidget {
  final double calorieConsumed;
  final double calorieGoal;
  final Gradient greengradient;
  final Gradient yellowGradient;
  final double strokeWidth;
  final double sized;

  const CalorieProgressIndicator({
    Key? key,
    required this.calorieConsumed,
    required this.calorieGoal,
    this.greengradient = AppGradients.greenGradient,
    this.yellowGradient = AppGradients.yellowGradient,
    this.strokeWidth = 10.0,
    this.sized = 150,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    double progress = calorieConsumed / calorieGoal;
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          width: sized,
          height: sized,
          child: CustomPaint(
            painter: ProgressPainter(progress, strokeWidth),
          ),
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "$calorieConsumed", // Persentase
              style: GoogleFonts.archivo(fontSize: 36, color: calorieConsumed>calorieGoal? AppColors.yellow: AppColors.green, fontWeight: FontWeight.bold)
            ),
            Text(
              "Kcal available",
              style: GoogleFonts.archivo(fontSize: 10, color: AppColors.subText),
            ),
          ],
        ),
      ],
    );
  }
}

class ProgressPainter extends CustomPainter {
  final double progress;
  final double strokeWidth;

  ProgressPainter(this.progress, this.strokeWidth);

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
    progressPaintGreen.shader = LinearGradient(
      colors: [AppColors.lightgreen, AppColors.green], // Green gradient
      begin: Alignment.center, // Gradient starts from the center
      end: Alignment.centerRight, // Gradient ends at the right edge
    ).createShader(Rect.fromCircle(center: Offset(size.width / 2, size.height / 2), radius: size.width / 2));

    // Paint for the yellow progress circle (above 100%) with gradient
    Paint progressPaintYellow = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth
      ..strokeCap = StrokeCap.round;

    // Apply a RadialGradient to the yellow progress
    progressPaintYellow.shader = LinearGradient(
      colors: [AppColors.lightyellow, AppColors.yellow], // Yellow gradient
      begin: Alignment.centerLeft, // Gradient starts from the center
      end: Alignment.centerRight, // Gradient ends at the right edge
    ).createShader(Rect.fromCircle(center: Offset(size.width / 2, size.height / 2), radius: size.width / 2));

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
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false; // No need to repaint unless progress changes
  }
}
