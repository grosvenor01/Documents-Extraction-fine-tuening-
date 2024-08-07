import 'package:dotted_border/dotted_border.dart';
import 'package:extractor/Result.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class home extends StatefulWidget {
  const home({super.key});

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {
  PlatformFile? selectedFile;
  String? fileContent;
  var response;
  var question = "";

  Future<void> _pickFile() async {
    var result = await FilePicker.platform.pickFiles();
    if (result != null) {
      setState(() {
        selectedFile = result.files.first;
        fileContent = String.fromCharCodes(selectedFile!.bytes!);
      });
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: 
      
      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: 100,
          ),
          const Text(
            "Extractor App",
            style: TextStyle(
                color: Colors.black, fontFamily: "LilitaOne", fontSize: 30),
          ),
          const Padding(
            padding: EdgeInsets.all(10.0),
            child: Text(
              "Drop the file and a question depend on what you need to extract from the docs",
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontFamily: "Poppins", fontSize: 15, color: Colors.grey),
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.1,
          ),
          Container(
            height: MediaQuery.of(context).size.height * 0.07,
            width: MediaQuery.of(context).size.width * 0.9,
            padding: EdgeInsets.only(
                top: MediaQuery.of(context).size.height * 0.005, left: 10),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Color.fromARGB(181, 158, 158, 158))),
            child: TextField(
              onChanged: (value) {
                setState(() {
                  question = value;
                });
              },
              decoration: const InputDecoration(
                border: InputBorder.none,
                hintText: "Write you question here please!",
                hintStyle: TextStyle(
                  color: Color.fromARGB(169, 158, 158, 158),
                  fontFamily: "Poppins",
                  fontSize: 17,
                ),
              ),
              style: TextStyle(),
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.02,
          ),
          DottedBorder(
              color: Color.fromARGB(181, 158, 158, 158),
              radius: Radius.circular(10),
              strokeWidth: 1,
              dashPattern: [8, 4],
              child: Container(
                  height: MediaQuery.of(context).size.height * 0.4,
                  width: MediaQuery.of(context).size.width * 0.88,
                  padding: EdgeInsets.all(
                      MediaQuery.of(context).size.height * 0.022),
                  child: Column(
                    children: [
                      Container(
                        height: 100,
                        width: 100,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                                color: Color.fromARGB(33, 158, 158, 158),
                                width: 5)),
                        child: const Icon(
                          Icons.upload_file_rounded,
                          size: 50,
                          color: Colors.blue,
                        ),
                      ),
                      Spacer(),
                      Container(
                        height: 50,
                        width: 200,
                        child: ElevatedButton(
                          onPressed: () => {_pickFile()},
                          style: ElevatedButton.styleFrom(
                              shadowColor: null,
                              elevation: 0,
                              backgroundColor: Colors.blue),
                          child: const Text(
                            "Upload File",
                            style: TextStyle(
                              color: Colors.white,
                              fontFamily: "Poppins",
                              fontSize: 17,
                            ),
                          ),
                        ),
                      ),
                      selectedFile!=null?
                      Text(selectedFile!.name):Text(""),
                      const SizedBox(
                        height: 5,
                      )
                    ],
                  ))),
          Spacer(),
          Container(
            height: MediaQuery.of(context).size.height * 0.07,
            width: MediaQuery.of(context).size.width * 0.9,
            child: ElevatedButton(
              onPressed: () async {
                
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => result(question: question, doc : fileContent)));
              },
              style: ElevatedButton.styleFrom(
                  shadowColor: null,
                  elevation: 0,
                  backgroundColor: Colors.blue),
              child: const Text(
                "Submit",
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: "Poppins",
                  fontSize: 20,
                ),
              ),
            ),
          ),
          SizedBox(height: 5,)
        ],
      ),
    
    ));
  }
}
