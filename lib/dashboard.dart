import 'package:flutter/material.dart';



class DashboardPage extends StatefulWidget {
  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  int selectedDay = 4;
  List<int> mealLoggedDays = [2, 3, 5, 7];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF6F9FF),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Top Bar
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Calorie AI',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF6B4EFF),
                    ),
                  ),
                  Row(
                    children: [
                      Icon(Icons.notifications_none, color: Colors.black54),
                      SizedBox(width: 12),
                      Icon(Icons.settings, color: Colors.black54),
                      SizedBox(width: 12),
                      CircleAvatar(
                        backgroundColor: Color(0xFFE2DEFF),
                        child: Icon(Icons.person, color: Color(0xFF6B4EFF)),
                      ),
                    ],
                  )
                ],
              ),
              SizedBox(height: 16),

              // Calendar
              Container(
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 8)],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'December 2024',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                    SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: ['Sun', 'Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat']
                          .map((day) => Text(day,
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              color: Colors.black54)))
                          .toList(),
                    ),
                    SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: List.generate(7, (index) {
                        int date = index + 1;
                        bool isLogged = mealLoggedDays.contains(date);
                        bool isSelected = date == selectedDay;
                        return GestureDetector(
                          onTap: () {
                            setState(() {
                              selectedDay = date;
                            });
                          },
                          child: Container(
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              color: isSelected
                                  ? Color(0xFF6B4EFF)
                                  : Colors.grey[200],
                              shape: BoxShape.circle,
                            ),
                            child: Stack(
                              alignment: Alignment.center,
                              children: [
                                Text(
                                  '$date',
                                  style: TextStyle(
                                    color: isSelected
                                        ? Colors.white
                                        : Colors.black,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                if (isLogged)
                                  Positioned(
                                    top: 4,
                                    right: 4,
                                    child: Container(
                                      width: 6,
                                      height: 6,
                                      decoration: BoxDecoration(
                                        color: Colors.teal,
                                        shape: BoxShape.circle,
                                      ),
                                    ),
                                  )
                              ],
                            ),
                          ),
                        );
                      }),
                    )
                  ],
                ),
              ),
              SizedBox(height: 16),

              // Meal Card
              Container(
                width: double.infinity,
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 6)],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'December $selectedDay',
                      style: TextStyle(
                          color: Colors.black87, fontWeight: FontWeight.w500),
                    ),
                    SizedBox(height: 8),
                    Row(
                      children: [
                        Container(
                          padding: EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            color: Color(0xFFE2DEFF),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Icon(Icons.camera_alt, color: Color(0xFF6B4EFF)),
                        ),
                        SizedBox(width: 12),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'No meals logged yet',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16),
                              ),
                              SizedBox(height: 4),
                              Text(
                                'Take a photo of your meal to get AI-powered calorie tracking',
                                style:
                                TextStyle(fontSize: 13, color: Colors.grey),
                              ),
                            ],
                          ),
                        )
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
