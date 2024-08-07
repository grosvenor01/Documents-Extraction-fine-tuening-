import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class result extends StatefulWidget {
  final question;
  final doc;
  result({required this.question, required this.doc, super.key});

  @override
  State<result> createState() => _resultState();
}

class _resultState extends State<result> {
  var isLoaded = false;
  var response;
  var data;
  Future<void> sendPostRequest() async {
    final url = "http://localhost:8000";
    response = await http.post(Uri.parse(url),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode({
          "question": widget.question,
          "doc": widget.doc,
        }));
    data = json.decode(response.body);
    isLoaded = true;
    setState(() {});
  }

  @override
  void initState() {
    sendPostRequest();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (isLoaded) {
      return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          actions: const [
            SizedBox(
              width: 20,
            ),
            
            SizedBox(
              width: 20,
            ),
            Text(
              "Results",
              style: TextStyle(
                fontFamily: "LilitaOne",
                fontSize: 30,
                color: Colors.black,
              ),
            ),
            Spacer()
          ],
        ),
        body: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            Container(
              height: MediaQuery.of(context).size.height * 0.25,
              width: MediaQuery.of(context).size.width * 0.95,
              padding: const EdgeInsets.all(20),
              margin: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width * 0.025,
              ),
              decoration: BoxDecoration(
                color: Colors.teal.shade400,
                borderRadius: BorderRadius.circular(15),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Icon(
                    Icons.check_circle_outline,
                    color: Colors.white,
                    size: 40,
                  ),
                  const SizedBox(height: 10),
                  Expanded(
                    child: SingleChildScrollView(
                      child: Text(
                        data["answer0"],
                        style: const TextStyle(
                          color: Colors.white,
                          fontFamily: "Poppins",
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20,),
                  Text(
                    "Accuracy: ${data["score0"]}%",
                    style: const TextStyle(
                      color: Colors.white,
                      fontFamily: "Poppins",
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(height: 10,),
                ],
              ),
            ),
            const SizedBox(height: 10),
            Container(
              height: MediaQuery.of(context).size.height * 0.25,
              width: MediaQuery.of(context).size.width * 0.95,
              padding: const EdgeInsets.all(20),
              margin: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width * 0.025,
              ),
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 252, 178, 68),
                borderRadius: BorderRadius.circular(15),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Icon(
                    Icons.check_circle_outline,
                    color: Colors.white,
                    size: 40,
                  ),
                  const SizedBox(height: 10),
                  Expanded(
                    child: SingleChildScrollView(
                      child: Text(
                        data["answer1"],
                        style: const TextStyle(
                          color: Colors.white,
                          fontFamily: "Poppins",
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20,),
                  Text(
                    "Accuracy: ${data["score1"]}%",
                    style: const TextStyle(
                      color: Colors.white,
                      fontFamily: "Poppins",
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(height: 10,),
                ],
              ),
            ),
            const SizedBox(height: 10),
            Container(
              height: MediaQuery.of(context).size.height * 0.25,
              width: MediaQuery.of(context).size.width * 0.95,
              padding: const EdgeInsets.all(20),
              margin: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width * 0.025,
              ),
              decoration: BoxDecoration(
                color: Colors.red.shade400,
                borderRadius: BorderRadius.circular(15),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Icon(
                    Icons.cancel_outlined,
                    color: Colors.white,
                    size: 40,
                  ),
                  const SizedBox(height: 10),
                  Expanded(
                    child: SingleChildScrollView(
                      child: Text(
                        data["answer2"],
                        style: const TextStyle(
                          color: Colors.white,
                          fontFamily: "Poppins",
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20,),
                  Text(
                    "Accuracy: ${data["score2"]}%",
                    style: const TextStyle(
                      color: Colors.white,
                      fontFamily: "Poppins",
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(height: 10,)
                ],
              ),
            ),
          ],
        ),
      );
    } else{
      return const Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
            child: CircularProgressIndicator(
              backgroundColor: Color.fromARGB(87, 33, 149, 243),
              strokeWidth: 4,
              color: Colors.blue,
            ),
          ),
          Text("Document processing")
        ]
        )  
      );
    }
      
  }
}
