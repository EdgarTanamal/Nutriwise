part of 'pages.dart';

class ArticlePage extends StatelessWidget {  
  @override  
  Widget build(BuildContext context) {  
    return Scaffold(  
      appBar: AppBar(  
        title: const Text('Article'),  
        centerTitle: true,  
        backgroundColor: Colors.white,  
        elevation: 0,  
        leading: IconButton(  
          icon: const Icon(Icons.arrow_back, color: Colors.black),  
          onPressed: () {  
            Navigator.pop(context);  
          },  
        ),  
      ),  
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
                  _buildArticleCard(  
                    title: 'How to Diet?',  
                    imageUrl: 'https://via.placeholder.com/150',  
                    description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',  
                  ),  
                  const SizedBox(height: 16),  
                  _buildArticleCard(  
                    title: 'How to Diet?',  
                    imageUrl: 'https://via.placeholder.com/150',  
                    description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',  
                  ),  
                ],  
              ),  
            ),  
          ],  
        ),  
      ),  
      bottomNavigationBar: BottomNavigationBar(  
        items: const [  
          BottomNavigationBarItem(  
            icon: Icon(Icons.home),  
            label: 'Home',  
          ),  
          BottomNavigationBarItem(  
            icon: Icon(Icons.camera_alt),  
            label: 'Camera',  
          ),  
          BottomNavigationBarItem(  
            icon: Icon(Icons.article),  
            label: 'Article',  
          ),  
        ],  
        currentIndex: 2, // Set current index to Article  
        selectedItemColor: Colors.green,  
        onTap: (index) {  
          // Handle navigation  
        },  
      ),  
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
