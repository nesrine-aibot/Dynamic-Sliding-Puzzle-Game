import 'package:flutter/material.dart';
import 'MyCard.dart';
import 'GameOver.dart';
import 'timer.dart';

class MyGrid extends StatefulWidget {
  final int n;
  const MyGrid({Key? key, required this.n}) : super(key: key);

  @override
  State<MyGrid> createState() => _MyGridState();
}

class _MyGridState extends State<MyGrid> {
  late int n;
  late List<int> myArray;

  @override
  void initState() {
    super.initState();
    n = widget.n;
    myArray = List.generate(n * n, (index) => index);
    myArray.shuffle();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Sliding Puzzle Game"),
        backgroundColor: Colors.pinkAccent,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 50,
              ),
              Text(
                "Current Grid: $n x $n",
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.purple,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              TimerGame(),
              SizedBox(
                height: 20,
              ),
              const SizedBox(height: 20),
              Expanded(
                child: GridView.count(
                  crossAxisCount: n,
                  children: List.generate(n * n, (index) {
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          HandleTap(index);
                          if (isWinner()) {
                            showDialog(
                              context: context,
                              builder: (context) => AlertDialog(
                                title: const Text("You Win!"), // yeeeyyyy
                                content: const Text("Congratulations!"),
                                actions: [
                                  TextButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                      _resetGame();
                                    },
                                    child: const Text("Play Again"),
                                  ),
                                  TextButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                      Navigator.pop(context);
                                    },
                                    child: const Text("Main Menu"),
                                  ),
                                ],
                              ),
                            );
                          }
                        });
                      },
                      child: Card(
                        elevation: 4,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        color:
                            (Colors.pink[100] ?? Colors.pink).withOpacity(1.0),
                        child: Container(
                          width: 60,
                          height: 60,
                          alignment: Alignment.center,
                          child: Text(
                            myArray[index] != 0
                                ? myArray[index].toString()
                                : '',
                            style: const TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),
                    );
                  }),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(bottom: 50),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text("Main Menu"),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.pinkAccent,
                    foregroundColor: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      backgroundColor: Colors.pink[50],
    );
  }

  void swap(int index1, int index2) {
    int temp = myArray[index1];
    myArray[index1] = myArray[index2];
    myArray[index2] = temp;
  }

  void HandleTap(int index) {
    if (myArray[index] == 0) return;

    int emptyIndex = myArray.indexOf(0);

    if ((index == emptyIndex - 1 && index % n != n - 1) || // Right
        (index == emptyIndex + 1 && emptyIndex % n != n - 1) || // Left
        (index == emptyIndex - n) || // Up
        (index == emptyIndex + n)) // Down
    {
      swap(index, emptyIndex);
    }
  }

  bool isWinner() {
    for (int i = 0; i < n * n - 1; i++) {
      if (myArray[i] > myArray[i + 1]) {
        if (i + 1 == n * n - 1 && myArray[i + 1] == 0) {
        } else {
          return false;
        }
      }
    }
    return true;
  }

  void _resetGame() {
    setState(() {
      myArray = List.generate(n * n, (index) => index);
      myArray.shuffle();
    });
  }
}
