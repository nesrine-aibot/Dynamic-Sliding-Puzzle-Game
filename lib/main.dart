import 'MyGrid.dart';
import 'package:flutter/material.dart';
import 'MainMenu.dart';

void main() => runApp(MaterialApp(
      title: "Dynamic Sliding Puzzle Game",
      home: MyGame(),
    ));

class MyGame extends StatelessWidget {
  const MyGame({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Dynamic Sliding Puzzle Game"),
        backgroundColor: Colors.pinkAccent, // the pink is cute :)
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 20),
              Text(
                "Welcome to my Cute Dynamic Sliding Puzzle Game!",
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.purple, // purpule is cute too :)
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 10),
              Text(
                "Choose the dimensions of the game",
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.black.withOpacity(0.7),
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20),
              Text(
                "Be careful, it can get very difficult if you increase the dimensions!",
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black.withOpacity(0.6),
                  fontStyle: FontStyle.italic,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 40),
              Expanded(  
                child: GridView.count(
                  crossAxisCount: 3,
                  children: List.generate(9, (index) {
                    index = index + 2;

                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => MyGrid(n: index)));
                      },
                      child: Card(
                        elevation: 4, 
                        child: Center(
                          child: Text(
                            '$index x $index ', 
                            style: TextStyle(fontSize: 24),
                          ),
                        ),
                      ),
                    );
                  }),
                ),
              ),
            ],
          ),
        ),
      ),
      backgroundColor: Colors.pink[50],
    );
  }
}
