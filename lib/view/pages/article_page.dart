part of 'pages.dart';

class ArticlePage extends StatelessWidget {  
  @override  
  Widget build(BuildContext context) {  
    return Scaffold(  
      appBar: const Header(),
      body: Padding(  
        padding: const EdgeInsets.all(16.0),  
        child: Column(  
          crossAxisAlignment: CrossAxisAlignment.start,  
          children: [  
            // Search Bar  
            TextField(  
              decoration: InputDecoration(  
                hintText: 'Find Out Information About Healthy Life',  
                border: OutlineInputBorder(  
                  borderRadius: BorderRadius.circular(8),  
                ),  
                prefixIcon: Icon(Icons.search, color: Colors.grey[600]),  
              ),  
            ),  
            const SizedBox(height: 16),  
  
            // Article List  
            Expanded(  
              child: ListView(  
                children: [
                  ArticleCard(
                    picture: "https://asset.kompas.com/crops/nP95wO9Z1PUhZojPylVBPkIGraM=/29x22:748x502/1200x800/data/photo/2024/08/15/66bdc41574ef3.jpg",
                    keywords: "health",
                    title: "Dokter: Konsumsi Gula Berlebih Tingkatkan Risiko Depresi",
                    description: "Mengonsumsi gula tinggi atau berlebih berhubungan dengan peningkatan risiko depresi atau gangguan mental lainnya. Ternyata sayangnya iya, gula terkait sekali dengan depresi. Kadang jadi orang menyebutkan karena saya depresi maka kita suka makan banyak minum",
                    isArticle: true,
                    isFull: true,
                  ),
                  SizedBox(height: 16),
                  ArticleCard(
                      picture: "https://asset.kompas.com/crops/xiPV-d1ESKCBkc-GNe2WvilTflw=/19x247:4502x3236/1200x800/data/photo/2021/12/19/61bead1d7f13f.jpg",
                      keywords: "sleep, health, diabetes",
                      title: "Sering Terbangun untuk Pipis Malam, Tanda Diabetes?",
                      description: "Jika kita sering terbangun di malam hari untuk buang air kecil, kita mungkin bertanya-tanya apakah ada masalah kesehatan yang mendasari. Kebanyakan orang saat tidur malam tidak ingin pipis lebih dari sekali dalam",
                      isArticle: true,
                    isFull: true,

                  ),
                ],  
              ),  
            ),  
          ],  
        ),  
      ),  
      bottomNavigationBar: Navbar(),
    );  
  }  
  
  Widget _buildArticleCard({required String title, required String imageUrl, required String description}) {  
    return Card(  
      elevation: 2,  
      shape: RoundedRectangleBorder(  
        borderRadius: BorderRadius.circular(16),  
      ),  
      child: Column(  
        crossAxisAlignment: CrossAxisAlignment.start,  
        children: [  
          ClipRRect(  
            borderRadius: BorderRadius.circular(16),  
            child: Image.network(imageUrl, fit: BoxFit.cover),  
          ),  
          Padding(  
            padding: const EdgeInsets.all(16.0),  
            child: Column(  
              crossAxisAlignment: CrossAxisAlignment.start,  
              children: [  
                Text(  
                  title,  
                  style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),  
                ),  
                const SizedBox(height: 8),  
                Text(  
                  description,  
                  style: const TextStyle(color: Colors.grey),  
                ),  
                const SizedBox(height: 8),  
                ElevatedButton(  
                  onPressed: () {  
                    // Action when button pressed  
                  },  
                  child: const Text('Health Post'),  
                  style: ElevatedButton.styleFrom(  
                    shape: RoundedRectangleBorder(  
                      borderRadius: BorderRadius.circular(8),  
                    ),  
                  ),  
                ),  
              ],  
            ),  
          ),  
        ],  
      ),  
    );  
  }  
}  
