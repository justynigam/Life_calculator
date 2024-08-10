import 'package:flutter/material.dart';

class HeightCalorieMeasurePage extends StatefulWidget {
  @override
  _HeightCalorieMeasurePageState createState() => _HeightCalorieMeasurePageState();
}

class _HeightCalorieMeasurePageState extends State<HeightCalorieMeasurePage> {
  final TextEditingController _heightController = TextEditingController();
  final TextEditingController _weightController = TextEditingController();
  final TextEditingController _ageController = TextEditingController();
  final TextEditingController _activityLevelController = TextEditingController();

  double? _height;
  double? _calories;

  void _measureHeight() {
    // Example logic to measure height, you can adjust as per your need
    double height = double.parse(_heightController.text);
    setState(() {
      _height = height; // Assuming height is directly given in cm
    });
  }

  void _measureCalories() {
    double weight = double.parse(_weightController.text);
    int age = int.parse(_ageController.text);
    double activityLevel = double.parse(_activityLevelController.text);

    // Example BMR calculation using Harris-Benedict equation (for men)
    // BMR = 88.362 + (13.397 * weight in kg) + (4.799 * height in cm) - (5.677 * age in years)
    double bmr = 88.362 + (13.397 * weight) + (4.799 * _height!) - (5.677 * age);
    double calories = bmr * activityLevel;

    setState(() {
      _calories = calories;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.menu),
          onPressed: () {
            // Handle menu button press
          },
        ),
        title: Text(
          'Height & Calorie Measure',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 24,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(Icons.message),
            onPressed: () {
              // Handle message button press
            },
          ),
          IconButton(
            icon: Icon(Icons.account_circle),
            onPressed: () {
              // Handle account button press
            },
          ),
        ],
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.purple, Colors.blue],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),

          ),
        ),
        elevation: 0,
      ),
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              'assets/nets.jpg',
              fit: BoxFit.cover,
            ),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextField(
                      controller: _heightController,
                      decoration: InputDecoration(
                        labelText: 'Enter height (cm)',
                        labelStyle: TextStyle(color: Colors.white),
                        border: OutlineInputBorder(),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                        ),
                      ),
                      style: TextStyle(color: Colors.white),
                      keyboardType: TextInputType.number,
                    ),
                    SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: _measureHeight,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.purple, // Background color
                      ),
                      child: Text('Measure Height', style: TextStyle(color: Colors.white)),
                    ),
                    SizedBox(height: 20),
                    if (_height != null)
                      Text(
                        'Your Height: $_height cm',
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      ),
                    SizedBox(height: 20),
                    TextField(
                      controller: _weightController,
                      decoration: InputDecoration(
                        labelText: 'Enter weight (kg)',
                        labelStyle: TextStyle(color: Colors.white),
                        border: OutlineInputBorder(),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                        ),
                      ),
                      style: TextStyle(color: Colors.white),
                      keyboardType: TextInputType.number,
                    ),
                    SizedBox(height: 20),
                    TextField(
                      controller: _ageController,
                      decoration: InputDecoration(
                        labelText: 'Enter age (years)',
                        labelStyle: TextStyle(color: Colors.white),
                        border: OutlineInputBorder(),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                        ),
                      ),
                      style: TextStyle(color: Colors.white),
                      keyboardType: TextInputType.number,
                    ),
                    SizedBox(height: 20),
                    TextField(
                      controller: _activityLevelController,
                      decoration: InputDecoration(
                        labelText: 'Activity Level (1.2 - 1.9)',
                        labelStyle: TextStyle(color: Colors.white),
                        border: OutlineInputBorder(),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                        ),
                      ),
                      style: TextStyle(color: Colors.white),
                      keyboardType: TextInputType.number,
                    ),
                    SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: _measureCalories,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.purple, // Background color
                      ),
                      child: Text('Measure Calories', style: TextStyle(color: Colors.white)),
                    ),
                    SizedBox(height: 20),
                    if (_calories != null)
                      Text(
                        'Estimated Calories Burned: $_calories',
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
