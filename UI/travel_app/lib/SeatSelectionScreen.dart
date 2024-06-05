// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'jadwal.dart';
import 'payment.dart';

class SeatSelectionScreen extends StatefulWidget {
  const SeatSelectionScreen({super.key});

  @override
  _SeatSelectionScreenState createState() => _SeatSelectionScreenState();
}

class _SeatSelectionScreenState extends State<SeatSelectionScreen> {
  List<bool> seats = List.generate(12, (index) => true);
  int selectedSeat = -1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF121111),
      appBar: AppBar(
        backgroundColor: const Color(0xFF121111),
        elevation: 0,
        title: const Text(
          "Pilih Kursi",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        leading: Container(
          margin: const EdgeInsets.all(8.0),
          child: FloatingActionButton(
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => Jadwal()),
              );
            },
            backgroundColor: const Color(0xFF1A1B1F), // Background color of FAB
            foregroundColor: Colors.white, // Icon color of FAB
            tooltip: 'Back', // Tooltip on FAB hold
            shape: const CircleBorder(), // Circular shape
            child: ColorFiltered(
              colorFilter:
                  const ColorFilter.mode(Colors.white, BlendMode.srcIn),
              child: Image.asset('assets/icon/back.png'),
            ),
          ),
        ),
      ),
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.symmetric(vertical: 20.0, horizontal: 16.0),
            padding: EdgeInsets.all(16.0),
            decoration: BoxDecoration(
              color: Color.fromRGBO(48, 46, 46, 1),
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Rp 45.000/Kursi",
                      style: TextStyle(color: Colors.white),
                    ),
                    Text(
                      "14 Kursi Tersisa",
                      style: TextStyle(color: Colors.grey),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Image.asset(
                      'assets/icon/bus.png', // Change to your garis image path
                    ),
                    SizedBox(height: 4),
                    Image.asset(
                      'assets/icon/garis.png', // Change to your garis image path
                    ),
                    SizedBox(height: 4),
                    Text(
                      "08:00 AM - 11:00 AM",
                      style: TextStyle(color: Colors.grey),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Text(
                      " Jogjakarta",
                      style: TextStyle(color: Colors.white),
                    ),
                    Text(
                      " Semarang",
                      style: TextStyle(color: Colors.white),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              margin: EdgeInsets.symmetric(vertical: 20.0, horizontal: 30.0),
              padding: EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: Color.fromRGBO(48, 46, 46, 1),
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: GridView.builder(
                padding: const EdgeInsets.all(16.0),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  childAspectRatio: 2.0,
                  crossAxisSpacing: 10.0,
                  mainAxisSpacing: 10.0,
                ),
                itemCount: seats.length,
                itemBuilder: (context, index) {
                  if (index == 2) {
                    return Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      child: Center(
                        child: Text(
                          "Driver",
                          style: TextStyle(color: Colors.black),
                        ),
                      ),
                    );
                  } else if (index == 4 || index == 7 || index == 8) {
                    return Container(
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      child: Center(
                        child: Text(
                          (index + 1).toString(),
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    );
                  }

                  return GestureDetector(
                    onTap: seats[index]
                        ? () {
                            setState(() {
                              selectedSeat = index;
                            });
                          }
                        : null,
                    child: Container(
                      decoration: BoxDecoration(
                        color: selectedSeat == index
                            ? Color(0xFF12D1DD)
                            : seats[index]
                                ? Colors.white
                                : Colors.black,
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      child: Center(
                        child: Text(
                          (index + 1).toString(),
                          style: TextStyle(
                            color: selectedSeat == index || !seats[index]
                                ? Colors.white
                                : Colors.black,
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                LegendItem(color: Colors.white, text: "Available"),
                LegendItem(color: Colors.black, text: "Unavailable"),
                LegendItem(color: Color(0xFF12D1DD), text: "Selected"),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ElevatedButton(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => PaymentScreen()),
                );
              },
              style: TextButton.styleFrom(
                  backgroundColor: Color(0xFF12D1DD),
                  minimumSize: const Size(double.infinity, 50),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0))),
              child: const Text('Pilih', style: TextStyle(color: Colors.white)),
            ),
          ),
        ],
      ),
    );
  }
}

class LegendItem extends StatelessWidget {
  final Color color;
  final String text;

  const LegendItem({Key? key, required this.color, required this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 20,
          height: 20,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(5),
          ),
        ),
        SizedBox(width: 8),
        Text(
          text,
          style: TextStyle(color: Colors.white),
        ),
      ],
    );
  }
}
