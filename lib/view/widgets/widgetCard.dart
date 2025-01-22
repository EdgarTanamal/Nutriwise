part of 'widgets.dart';

class ArticleCard extends StatelessWidget {
  final String picture;
  final String keywords;
  final String title;
  final String description;
  final bool isArticle;
  final String food;
  final double calorie;


  const ArticleCard({
    super.key,
    required this.picture,
    required this.isArticle,
    this.keywords="",
    this.title="",
    this.description="",
    this.food ="",
    this.calorie=0,


  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.centerRight,
      children: [
        IntrinsicHeight(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            // Makes children stretch to the same height
            children: [
              Container(
                width: 10,
                decoration: BoxDecoration(
                  color: isArticle?AppColors.red:AppColors.lightPurple,
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(5),
                      topLeft: Radius.circular(5)
                  ),
                ),
              ),
              Column(
                children: [
                  Container(
                    width: 192,
                    height: 108,
                    color: AppColors.grey,
                  ),
                  Container(
                    width: 187,
                    height: isArticle?120:null,
                    color: AppColors.backgroundCard,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            isArticle?"Keywords: $keywords ":"Food: $food",
                            style: GoogleFonts.archivo(
                              color: isArticle?AppColors.subText:AppColors.textColor,
                              fontSize: isArticle?10:18,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          SizedBox(height: 8),
                          Text(
                            isArticle?"$title":"Calorie: $calorie Kcal",
                            style: GoogleFonts.archivo(
                              fontSize: isArticle?18:10,
                              color: isArticle?AppColors.textColor:AppColors.subText,
                              fontWeight: FontWeight.w600,

                            ),
                          ),
                          SizedBox(height: 8),
                          isArticle?
                          Text(
                            "Description: $description",
                            style: GoogleFonts.archivo(
                                fontSize: 10,
                                color: AppColors.subText
                            ),
                          ):SizedBox.shrink(),
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