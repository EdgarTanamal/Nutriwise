part of 'widgets.dart';

class ArticleCard extends StatelessWidget {
  final String picture;
  final String keywords;
  final String title;
  final String description;
  final bool isArticle;
  final String food;
  final double calorie;
  final bool isFull;

  const ArticleCard({
    super.key,
    required this.picture,
    required this.isArticle,
    this.keywords = "",
    this.title = "",
    this.description = "",
    this.food = "",
    this.calorie = 0,
    this.isFull =false
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.centerRight,
      children: [
        IntrinsicHeight(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                width: 10,
                decoration: BoxDecoration(
                  color: isArticle ? AppColors.red : AppColors.lightPurple,
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(5),
                      topLeft: Radius.circular(5)),
                ),
              ),
              Column(
                children: [
                  Container(
                    width: isFull?350:192,
                    height: 108,
                    color: AppColors.grey,
                    child: Image.network(
                      picture,
                      fit: BoxFit.cover, // Menyesuaikan gambar dengan ukuran container
                    ),
                  ),
                  Container(
                    width: isFull?350:187,
                    height: isArticle ? 120 : null,
                    color: AppColors.backgroundCard,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            isArticle ? "Keywords: $keywords" : "Food: $food",
                            style: GoogleFonts.archivo(
                              color: isArticle ? AppColors.subText : AppColors.textColor,
                              fontSize: isArticle ? 10 : 18,
                              fontWeight: FontWeight.w600,
                            ),
                            overflow: TextOverflow.ellipsis, // Overflow handler
                            maxLines: 1, // Limit to one line
                          ),
                          SizedBox(height: 8),
                          Text(
                            isArticle ? "$title" : "Calorie: $calorie Kcal",
                            style: GoogleFonts.archivo(
                              fontSize: isArticle ? 15 : 10,
                              color: isArticle ? AppColors.textColor : AppColors.subText,
                              fontWeight: FontWeight.w600,
                            ),
                            overflow: TextOverflow.ellipsis, // Overflow handler
                            maxLines: 2, // Limit to 2 lines for title
                          ),
                          SizedBox(height: 8),
                          isArticle
                              ? Text(
                            "Description: $description",
                            style: GoogleFonts.archivo(
                              fontSize: 10,
                              color: AppColors.subText,
                            ),
                            overflow: TextOverflow.ellipsis, // Overflow handler
                            maxLines: 2, // Limit to 2 lines for description
                          )
                              : SizedBox.shrink(),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(width: 12),
            ],
          ),
        )
      ],
    );
  }
}
