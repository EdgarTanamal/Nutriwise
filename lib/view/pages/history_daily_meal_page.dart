part of 'pages.dart';

class HistoryDailyMealPage extends StatefulWidget {
const HistoryDailyMealPage({super.key});


@override
State<HistoryDailyMealPage> createState() => _HistoryDailyMealsState();
}


class _HistoryDailyMealsState extends State<HistoryDailyMealPage> {
// List data makanan
List<Map<String, String>> meals = [
{"title": "Coffee with milk 100 g", "kcal": "56 Kcal"},
{"title": "Sandwich 100 g", "kcal": "250 Kcal"},
{"title": "Walnuts 20 g", "kcal": "100 Kcal"},
{"title": "Ayam Goreng", "kcal": "129 Kcal"},
];


// Fungsi untuk menampilkan dialog konfirmasi
void _showDeleteConfirmation(int index) {
showDialog(
context: context,
builder: (context) {
return AlertDialog(
title: const Text("Delete this Meal?"),
actions: [
// Tombol No
TextButton(
onPressed: () {
Navigator.pop(context); // Tutup dialog
},
child: const Text(
"No",
style: TextStyle(color: Colors.red),
),
),
// Tombol Yes
TextButton(
onPressed: () {
setState(() {
meals.removeAt(index); // Hapus item dari list
});
Navigator.pop(context); // Tutup dialog
},
child: const Text(
"Yes",
style: TextStyle(color: Colors.green),
),
),
],
);
},
);
}


@override
Widget build(BuildContext context) {
return Scaffold(
appBar: AppBar(
backgroundColor: Colors.white,
elevation: 0,
leading: IconButton(
icon: const Icon(Icons.arrow_back, color: Colors.black),
onPressed: () {
Navigator.pop(context);
},
),
title: const Text(
"Breakfast",
style: TextStyle(color: Colors.black),
),
centerTitle: true,
actions: [
Padding(
padding: const EdgeInsets.only(right: 16.0),
child: CircleAvatar(
backgroundColor: Colors.grey[300],
radius: 20,
),
),
],
),
body: Padding(
padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
child: Column(
children: [
// Search Bar
Container(
padding: const EdgeInsets.symmetric(horizontal: 16),
decoration: BoxDecoration(
color: Colors.grey[200],
borderRadius: BorderRadius.circular(8),
),
child: TextField(
decoration: InputDecoration(
hintText: "Food or meal",
border: InputBorder.none,
icon: Icon(Icons.search, color: Colors.grey[600]),
),
),
),
const SizedBox(height: 16),


        // Summary Card
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.2),
                spreadRadius: 1,
                blurRadius: 5,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Breakfast  Kcal",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.green,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 4),
              const Text(
                "Recommended  Kcal",
                style: TextStyle(fontSize: 14, color: Colors.grey),
              ),
              const Divider(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _buildNutrientInfo("Carbs", "14 g / 142 g", Colors.cyan),
                  _buildNutrientInfo("Protein", "14 g / 142 g", Colors.grey),
                  _buildNutrientInfo("Fat", "14 g / 142 g", Colors.grey),
                  _buildNutrientInfo("Fibre", "14 g / 142 g", Colors.red),
                ],
              ),
            ],
          ),
        ),
        const SizedBox(height: 16),

        // Meals List
        Expanded(
          child: ListView.builder(
            itemCount: meals.length,
            itemBuilder: (context, index) {
              final meal = meals[index];
              return _buildMealItem(
                meal["title"]!,
                meal["kcal"]!,
                index,
              );
            },
          ),
        ),
      ],
    ),
  ),
  backgroundColor: const Color(0xFFF5F5F5),
);

}


Widget _buildNutrientInfo(String title, String value, Color color) {
return Column(
children: [
Icon(Icons.circle, color: color, size: 24),
const SizedBox(height: 4),
Text(
title,
style: const TextStyle(fontSize: 14, color: Colors.black),
),
const SizedBox(height: 4),
Text(
value,
style: const TextStyle(fontSize: 12, color: Colors.grey),
),
],
);
}


Widget _buildMealItem(String title, String kcal, int index) {
return Container(
margin: const EdgeInsets.only(bottom: 8),
padding: const EdgeInsets.all(16),
decoration: BoxDecoration(
color: Colors.white,
borderRadius: BorderRadius.circular(8),
boxShadow: [
BoxShadow(
color: Colors.grey.withOpacity(0.2),
spreadRadius: 1,
blurRadius: 5,
offset: const Offset(0, 2),
),
],
),
child: Row(
mainAxisAlignment: MainAxisAlignment.spaceBetween,
children: [
Column(
crossAxisAlignment: CrossAxisAlignment.start,
children: [
Text(
title,
style: const TextStyle(fontSize: 16, color: Colors.black),
),
const SizedBox(height: 4),
Text(
kcal,
style: TextStyle(fontSize: 14, color: Colors.grey[600]),
),
],
),
IconButton(
onPressed: () => _showDeleteConfirmation(index),
icon: const Icon(Icons.close, color: Colors.grey),
),
],
),
);
}
}