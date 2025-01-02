import 'package:flutter/material.dart'; 
import 'MyGrid.dart';

class MainMenu extends StatelessWidget {
  const MainMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.count(
          crossAxisCount: 3,
          children: List.generate(9, (index) {
            index = index+2;

            return GestureDetector(
              onTap: () {
                Navigator.push(context , MaterialPageRoute(builder: (context) => MyGrid(n:index)));
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
        );
  }
}
