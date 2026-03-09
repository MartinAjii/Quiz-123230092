import 'package:flutter/material.dart';
import '../models/food_list.dart';

class FoodDetailPage extends StatelessWidget {

  final Food food;

  const FoodDetailPage({super.key, required this.food});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Movie Detail"),
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.network(
                  food.image,
                  height: 300
                ),
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 20),

                Text(
                  "${food.name}, ${food.category}",
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                Text(
                  "Harga ${food.price}, Kalori ${food.calories}",
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                Text(
                  "${food.description} ",
                  style: const TextStyle(
                    fontSize: 16,
                  ),
                ),

                Text(
                  "Komposisi ${food.ingredients} ",
                  style: const TextStyle(
                    fontSize: 16,
                  ),
                ),

              const SizedBox(height: 4),

                SizedBox(
                  width: 500,
                  child: ElevatedButton(
                    onPressed: () {

                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text("Membuat pesanan"),
                        ),
                      );
                    },
                    child: const Text("Checkout"),
                  ),
                )
              ]
            )
          ],
        ),
      ),
    );
  }
}