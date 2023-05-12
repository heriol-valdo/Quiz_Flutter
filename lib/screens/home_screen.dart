import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:quiz/models/quiz.dart';
import 'package:quiz/services/quiz_service.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomeScreenState();
  }
}

class _HomeScreenState extends State<HomeScreen> {
  // instanciation du service API
  QuizService _quizService = QuizService();
  List<Quiz> jsonDataList = [];

  int conteurdata = 0;
  int niveau = 1;
  int score = 1;

  @override
  void initState() {
    super.initState();
    loadJsonData();
  }

  Future<void> loadJsonData() async {
    List<Quiz> data = await _quizService.loadJsonData();
    setState(() {
      jsonDataList = data;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          alignment: Alignment.center,
          child: Column(children: [
            const SizedBox(
              height: 80,
            ),
            const Center(
              child: Text(
                "la Grece Antique",
                style: TextStyle(fontSize: 50, color: Colors.blueAccent),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Center(
              child: Text("$niveau/10",
                  style: const TextStyle(color: Colors.white10)),
            ),
            const SizedBox(
              height: 20,
            ),
            Center(child: Text(jsonDataList[conteurdata].question)),
            const SizedBox(
              height: 20,
            ),
            const Divider(),
            const SizedBox(
              width: 40,
            ),
            Center(
              child: Container(
                margin: const EdgeInsets.only(bottom: 20, left: 40, top: 20),
                padding: const EdgeInsets.symmetric(
                    vertical: 20.4, horizontal: 20.4),
                alignment: Alignment.center,
                child: Center(
                  child: Row(
                    children: [
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.green),
                        onPressed: () {
                          setState(() {
                            if (conteurdata >= jsonDataList.length - 1) {
                              // Reached the end of the list
                              showDialog<String>(
                                context: context,
                                builder: (BuildContext context) => AlertDialog(
                                  title: const Text('Merci pour vos reponses'),
                                  content: Text("Score $score"),
                                  actions: <Widget>[
                                    IconButton(
                                      onPressed: () {
                                        setState(() {
                                          conteurdata = 0;
                                          score = 0;
                                          niveau = 1;
                                          Navigator.pop(context, 'OK');
                                        });
                                      },
                                      icon: const Icon(Icons.refresh),
                                      tooltip: "recommencer",
                                    )
                                  ],
                                ),
                              );
                            } else {
                              // Increment the counters and move to the next question
                              if (jsonDataList[conteurdata].answer == true) {
                                score++;
                              }

                              conteurdata++;
                              niveau++;
                            }
                          });
                        },
                        child: const Text("vrai",
                            style:
                                TextStyle(color: Colors.white, fontSize: 30.0)),
                      ),
                      const SizedBox(
                        width: 40,
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.red),
                        onPressed: () {
                          setState(() {
                            if (conteurdata >= jsonDataList.length - 1) {
                              showDialog<String>(
                                context: context,
                                builder: (BuildContext context) => AlertDialog(
                                  title: const Text('Merci pour vos reponses'),
                                  content: Text("Score $score"),
                                  actions: <Widget>[
                                    IconButton(
                                      onPressed: () {
                                        setState(() {
                                          conteurdata = 0;
                                          score = 0;
                                          niveau = 1;
                                          Navigator.pop(context, 'OK');
                                        });
                                      },
                                      icon: const Icon(Icons.refresh),
                                      tooltip: "recommencer",
                                    )
                                  ],
                                ),
                              );
                            } else {
                              if (jsonDataList[conteurdata].answer == false) {
                                score++;
                              }
                              conteurdata++;
                              niveau++;
                            }
                          });
                        },
                        child: const Text("faux",
                            style:
                                TextStyle(color: Colors.white, fontSize: 30.0)),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
