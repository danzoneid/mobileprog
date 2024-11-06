import 'package:flutter/material.dart';
import 'detail_screen.dart'; // Import halaman detail

class DestinationScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          "Get Best Room!",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.notifications, color: Colors.black),
            onPressed: () {},
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              decoration: InputDecoration(
                hintText: 'Search...',
                prefixIcon: Icon(Icons.search),
                suffixIcon: Icon(Icons.filter_list),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none,
                ),
                filled: true,
                fillColor: Colors.grey[200],
              ),
            ),
            SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ChoiceChip(label: Text("Best Offers"), selected: true),
                ChoiceChip(label: Text("Top Rates"), selected: false),
                ChoiceChip(label: Text("Popular"), selected: false),
                ChoiceChip(label: Text("Nearby"), selected: false),
              ],
            ),
            SizedBox(height: 16),
            // List of Destination Cards
            Expanded(
              child: ListView(
                children: [
                  buildDestinationCard(
                    context,
                    title: "Bedugul Temple",
                    location: "Bali, Indonesia",
                    price: "\$80 / Day",
                    description:
                        "In addition to the standards of Indonesia Care, all guests will receive free Wi-Fi in all rooms and free parking if arriving by car. Strategically located in Banjar.",
                  ),
                  SizedBox(height: 16),
                  buildDestinationCard(
                    context,
                    title: "Uluwatu Temple",
                    location: "Bali, Indonesia",
                    price: "\$90 / Day",
                    description:
                        "A mesmerizing temple with a view of the sea, located at the top of a cliff. Visitors can enjoy traditional Kecak dance performances here.",
                  ),
                  SizedBox(height: 16),
                  buildDestinationCard(
                    context,
                    title: "Tanah Lot Temple",
                    location: "Bali, Indonesia",
                    price: "\$85 / Day",
                    description:
                        "One of Bali’s most important landmarks, famous for its unique offshore setting and sunset views.",
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Explore'),
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite), label: 'Favorites'),
        ],
      ),
    );
  }

  // Helper method to build a destination card with navigation
  Widget buildDestinationCard(BuildContext context,
      {required String title,
      required String location,
      required String price,
      required String description}) {
    return GestureDetector(
      onTap: () {
        // Navigasi ke DetailScreen dengan data destinasi
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailScreen(
              title: title,
              location: location,
              price: price,
              description: description,
            ),
          ),
        );
      },
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.asset(
                'lib/assets/app.webp', // Menggunakan gambar dari asset
                height: 200,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 4),
                  Text(
                    location,
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 16,
                    ),
                  ),
                  SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        price,
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.green,
                        ),
                      ),
                      IconButton(
                        icon: Icon(Icons.favorite_border),
                        onPressed: () {},
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(Icons.access_time, size: 16, color: Colors.grey),
                      SizedBox(width: 4),
                      Text("35 mins"),
                      SizedBox(width: 16),
                      Icon(Icons.location_on, size: 16, color: Colors.grey),
                      SizedBox(width: 4),
                      Text("15 km"),
                      SizedBox(width: 16),
                      Icon(Icons.people, size: 16, color: Colors.grey),
                      SizedBox(width: 4),
                      Text("4 Guest"),
                      SizedBox(width: 16),
                      Icon(Icons.star, size: 16, color: Colors.grey),
                      SizedBox(width: 4),
                      Text("4.8 Ratings"),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
