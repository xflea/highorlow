import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    title: 'High or Low',
    home: FirstRoute(),
  ));
}

class FirstRoute extends StatelessWidget {
  const FirstRoute({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green[100],
      appBar: AppBar(
          title: const Text('High or Low'), backgroundColor: Colors.green),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Select how many cards you wanna guess:',
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => GameScreen(
                            n_of_cards: 10,
                          )),
                );
              },
              child: const Text('10 Cards'),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.green),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => GameScreen(
                            n_of_cards: 15,
                          )),
                );
              },
              child: const Text('15 Cards'),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.green),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => GameScreen(
                            n_of_cards: 20,
                          )),
                );
              },
              child: const Text('20 Cards'),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.green),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class GameScreen extends StatefulWidget {
  GameScreen({Key? key, required this.n_of_cards}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  int n_of_cards;

  @override
  GameScreenState createState() => GameScreenState(n_of_cards);
}

class GameScreenState extends State<GameScreen> {
  String card_value = "---";
  var card_extracted = "---";
  int points = 2000;

  int n_of_cards;
  GameScreenState(this.n_of_cards);

  List<String> cards_already_extracted = [];

  Map cards = {
    // Key:    Value
    'A♠️': 'Low',
    '2♠️': 'Low',
    '3♠️': 'Low',
    '4♠️': 'Low',
    '5♠️': 'Low',
    '6♠️': 'High',
    '7♠️': 'High',
    '8♠️': 'High',
    '9♠️': 'High',
    '10♠️': 'High',
    'A♣️': 'Low',
    '2♣️': 'Low',
    '3♣️': 'Low',
    '4♣️': 'Low',
    '5♣️': 'Low',
    '6♣️': 'High',
    '7♣️': 'High',
    '8♣️': 'High',
    '9♣️': 'High',
    '10♣️': 'High',
    'A♥️': 'Low',
    '2♥️': 'Low',
    '3♥️': 'Low',
    '4♥️': 'Low',
    '5♥️': 'Low',
    '6♥️': 'High',
    '7♥️': 'High',
    '8♥️': 'High',
    '9♥️': 'High',
    '10♥️': 'High',
    'A♦️': 'Low',
    '2♦️': 'Low',
    '3♦️': 'Low',
    '4♦️': 'Low',
    '5♦️': 'Low',
    '6♦️': 'High',
    '7♦️': 'High',
    '8♦️': 'High',
    '9♦️': 'High',
    '10♦️': 'High'
  };

  void extractCard(String button_value, int points_bet) {
    setState(() {
      if (this.n_of_cards > 0) {
        final _random = Random();
        var all_cards_list = this.cards.keys.toList();
        this.card_extracted =
            all_cards_list[_random.nextInt(all_cards_list.length)];
        for (final mapEntry in this.cards.entries) {
          final key = mapEntry.key;
          final value = mapEntry.value;
          if (key == this.card_extracted) {
            this.card_value = value;
          }
        }
        if (this.card_value == button_value) {
          this.points += points_bet;
        } else {
          this.points -= points_bet;
        }
        this.cards.remove(this.card_extracted);
        this.cards_already_extracted.add(this.card_extracted);
        this.n_of_cards--;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green[100],
      appBar: AppBar(
          title: Text("Cards: $n_of_cards"), backgroundColor: Colors.green),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Text(
              "Points: $points",
            ),
            Text(
              "$card_extracted",
              style: TextStyle(height: 2, fontSize: 50),
            ),
            Text(
              "The card is: $card_value",
              style: TextStyle(height: 5),
            ),
            const Text(
              'Low Cards:',
              style: TextStyle(height: 5),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                ElevatedButton(
                  onPressed: () {
                    extractCard('Low', 150);
                  },
                  child: const Text('150'),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.green),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    extractCard('Low', 200);
                  },
                  child: const Text('200'),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.green),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    extractCard('Low', 250);
                  },
                  child: const Text('250'),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.green),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    extractCard('Low', 300);
                  },
                  child: const Text('300'),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.green),
                  ),
                ),
              ],
            ),
            const Divider(
              height: 20,
              thickness: 5,
              indent: 20,
              endIndent: 20,
            ),
            const Text(
              'High Cards:',
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                ElevatedButton(
                  onPressed: () {
                    extractCard('High', 150);
                  },
                  child: const Text('150'),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.green),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    extractCard('High', 200);
                  },
                  child: const Text('200'),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.green),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    extractCard('High', 250);
                  },
                  child: const Text('250'),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.green),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    extractCard('High', 300);
                  },
                  child: const Text('300'),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.green),
                  ),
                ),
              ],
            ),
            const Text(
              'Crads extracted:',
              style: TextStyle(height: 2),
            ),
            Text(
              '$cards_already_extracted',
              style: TextStyle(height: 1),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
