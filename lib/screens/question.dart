import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:internshipproject1/screens/answer.dart';

import '../models/question.dart';

class QuestionPage extends StatelessWidget {
  const QuestionPage({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
    ));

    final List<QuestionModel> questions = [
      QuestionModel(
        name: "Fareeha Sadaqat",
        time: "30 mins ago",
        question: "I have an issue regarding this vehicle",
        avatarPath: 'assets/images/flutter1.jpg',
        imagePath: 'assets/images/trac.jpg',
      ),
      QuestionModel(
        name: "Muhammad Ali Nizami",
        time: "20 mins ago",
        question: "What is the process of purchasing Vehicle from hardware store?",
        avatarPath: 'assets/images/p2.jpg',
      ),
      QuestionModel(
        name: "Masab Mehmood",
        time: "20 mins ago",
        question: "What is the process of purchasing Vehicle from hardware store?",
        avatarPath: 'assets/images/p3.jpg',
      ),
      QuestionModel(
        name: "Muhammad Ali Nizami",
        time: "20 mins ago",
        question: "What is the process of purchasing Vehicle from hardware store?",
        avatarPath: 'assets/images/p4.jpg',
      ),
    ];

    return DefaultTabController(
      length: 3,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          title: const Text(
            "Questions",
            style: TextStyle(
              fontSize: 23.04,
              fontWeight: FontWeight.bold,
              fontFamily: 'Raleway',
              color: Colors.black,
            ),
          ),
          actions: const [
            Padding(
              padding: EdgeInsets.only(right: 16.0),
              child: Icon(Icons.search, color: Color(0xff339D44), size: 24),
            ),
          ],
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(56),
            child: Padding(
              padding: const EdgeInsets.only(right: 30, left: 30),
              child: TabBar(
                dividerColor: Colors.white,
                indicator: BoxDecoration(
                  color: Color(0xff339D44),
                  borderRadius: BorderRadius.circular(8),
                ),
                labelColor: Colors.white,
                unselectedLabelColor: Colors.grey,
                labelStyle: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
                indicatorSize: TabBarIndicatorSize.tab,
                tabs: const [
                  Tab(
                    height: 38,
                    child: Text("All"),
                  ),
                  Tab(
                    height: 38,
                    child: Text("Pending"),
                  ),
                  Tab(
                    height: 38,
                    child: Text("Answered"),
                  ),
                ],
              ),
            ),
          ),
        ),
        body: TabBarView(
          children: [
            // All Tab
            ListView.builder(
              itemCount: questions.length,
              itemBuilder: (context, index) {
                final q = questions[index];
                return Padding(
                  padding: const EdgeInsets.only(bottom: 12),
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 30, left: 30),
                          child: Row(
                            children: [
                              CircleAvatar(
                                radius: 20,
                                backgroundImage: AssetImage(q.avatarPath),
                              ),
                              const SizedBox(width: 12),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      q.name,
                                      style: const TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 11.11,
                                        color: Colors.black87,
                                      ),
                                    ),
                                    Text(
                                      q.time,
                                      style: const TextStyle(
                                        fontSize: 9.26,
                                        color: Colors.grey,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              TextButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => answered(),
                                    ),
                                  );
                                },
                                style: TextButton.styleFrom(
                                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                                  minimumSize: Size.zero,
                                  tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                  visualDensity: VisualDensity.compact,
                                ),
                                child: const Text(
                                  "Answer",
                                  style: TextStyle(
                                    color: Color(0xff339D44),
                                    fontWeight: FontWeight.w600,
                                    fontSize: 13,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 10),
                        Padding(
                          padding: const EdgeInsets.only(right: 30, left: 30),
                          child: Text(
                            q.question,
                            style: const TextStyle(
                              fontSize: 15,
                              color: Colors.black,
                              height: 1.4,
                            ),
                          ),
                        ),
                        if (q.imagePath != null) ...[
                          const SizedBox(height: 12),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: ClipRRect(
                              borderRadius: const BorderRadius.vertical(
                                bottom: Radius.circular(12),
                              ),
                              child: Image.asset(
                                q.imagePath!,
                                width: MediaQuery.of(context).size.width,
                                height: 179,
                              ),
                            ),
                          ),
                        ],
                      ],
                    ),
                  ),
                );
              },
            ),

            // Pending Tab
            const Center(
              child: Text(
                "Pending",
                style: TextStyle(fontSize: 18, color: Colors.grey),
              ),
            ),

            // Answered Tab (Custom UI)
            SingleChildScrollView(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                   SizedBox(height: 53),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.asset(
                      'assets/images/answer111.jpg', // Make sure this image exists in assets
                      height: 206,
                      width: 190,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    "No Data Found",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 23.04,
                        fontWeight: FontWeight.w500,fontFamily: "Raleway"),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    "You have not answered any \n questions yet",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 16,
                        fontWeight: FontWeight.w400,fontFamily: "Raleway",color: Colors.grey),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
