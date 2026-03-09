import 'package:flutter/material.dart';
import '../models/food_list.dart';
import 'food_detail.dart';

class HomePage extends StatefulWidget {
  final String usm;

  const HomePage({super.key, required this.usm});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Food Name"),
        centerTitle: true,
      ),

      body: Padding(
        padding: const EdgeInsets.all(12),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            Text(
              "Welcome, ${widget.usm}!",
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 10),

            Expanded(
              child: ListView.builder(
                itemCount: dummyFoods.length,

                itemBuilder: (context, index) {

                  final food = dummyFoods[index];

                  return InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => FoodDetailPage(food: food),
                        ),
                      );
                    },
                    child: Card(
                      elevation: 2,
                      margin: const EdgeInsets.symmetric(vertical: 8),

                      child: Padding(
                        padding: const EdgeInsets.all(10),

                        child: Row(
                          children: [

                            Container(
                              width: 60,
                              height: 80,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                image: DecorationImage(
                                  image: NetworkImage(food.image),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),

                            const SizedBox(width: 12),

                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [

                                  Text(
                                    "${food.name} ",
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                    ),
                                  ),
                                  Text(
                                    "${food.category} ",
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
                                            content: Text("Memesan"),
                                          ),
                                        );

                                      },
                                      child: const Text("Pesan"),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}