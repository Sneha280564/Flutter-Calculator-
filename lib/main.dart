// import 'package:calculator_app/colors.dart';
// import 'package:flutter/material.dart';
// import 'package:math_expressions/math_expressions.dart';

// void main() {
//   runApp(const MaterialApp(
//     debugShowCheckedModeBanner: false,
//     home: CalculatorApp(),
//   ));
// }

// const Color colorDark = Color(0xFF374352);
// const Color colorLight = Color(0xFFe6eeff);

// class CalculatorApp extends StatefulWidget {
//   const CalculatorApp({Key? key}) : super(key: key);

//   @override
//   State<CalculatorApp> createState() => _CalculatorAppState();
// }

// class _CalculatorAppState extends State<CalculatorApp> {
//   double firstNum = 0.0;
//   double secondNum = 0.0;
//   var input = '';
//   var output = '';
//   var operation = '';
//   var hideInput = false;
//   var outputSize = 34.0;

//   void onButtonClick(String value) {
//     if (value == "AC") {
//       input = '';
//       output = '';
//     } else if (value == "DEL") {
//       if (input.isNotEmpty) {
//         input = input.substring(0, input.length - 1);
//       }
//     } else if (value == "=") {
//       if (input.isNotEmpty) {
//         var userinput = input;
//         userinput = input.replaceAll("x", "*");
//         Parser p = Parser();
//         Expression expression = p.parse(userinput);
//         ContextModel cm = ContextModel();
//         var finalValue = expression.evaluate(EvaluationType.REAL, cm);
//         output = finalValue.toString();
//         if (output.endsWith(".0")) {
//           output = output.substring(0, output.length - 2);
//         }
//         input = output;
//         hideInput = true;
//         outputSize = 52;
//       }
//     } else if (value == "+/-") {
//       if (input.isNotEmpty) {
//         if (input.startsWith('-')) {
//           input = input.substring(1);
//         } else {
//           input = '-' + input;
//         }
//         output = input;
//       }
//     } else {
//       input = input + value;
//       hideInput = false;
//       outputSize = 34;
//     }
//     setState(() {});
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.black,
//       body: Column(
//         children: [
//           Expanded(
//             child: Container(
//               width: double.infinity,
//               padding: const EdgeInsets.all(12),
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.end,
//                 crossAxisAlignment: CrossAxisAlignment.end,
//                 children: [
//                   Text(
//                     hideInput ? '' : input,
//                     style: const TextStyle(
//                       fontSize: 48,
//                       color: Colors.white,
//                     ),
//                   ),
//                   const SizedBox(height: 20),
//                   Text(
//                     output,
//                     style: TextStyle(
//                       fontSize: outputSize,
//                       color: Colors.white70,
//                     ),
//                   ),
//                   const SizedBox(height: 30),
//                 ],
//               ),
//             ),
//           ),
//           Row(
//             children: [
//               button(
//                 text: "AC",
//                 buttonBgColor: operatorColor,
//                 tColor: orangeColor,
//               ),
//               button(
//                 text: "DEL",
//                 buttonBgColor: operatorColor,
//                 tColor: orangeColor,
//               ),
//               button(
//                 text: "+/-",
//                 buttonBgColor: operatorColor,
//                 tColor: orangeColor,
//               ),
//               button(
//                 text: "/",
//                 buttonBgColor: operatorColor,
//                 tColor: orangeColor,
//               ),
//             ],
//           ),
//           Row(
//             children: [
//               button(text: "7"),
//               button(text: "8"),
//               button(text: "9"),
//               button(
//                 text: "x",
//                 tColor: orangeColor,
//                 buttonBgColor: operatorColor,
//               ),
//             ],
//           ),
//           Row(
//             children: [
//               button(text: "4"),
//               button(text: "5"),
//               button(text: "6"),
//               button(
//                 text: "-",
//                 tColor: orangeColor,
//                 buttonBgColor: operatorColor,
//               ),
//             ],
//           ),
//           Row(
//             children: [
//               button(text: "1"),
//               button(text: "2"),
//               button(text: "3"),
//               button(
//                 text: "+",
//                 tColor: orangeColor,
//                 buttonBgColor: operatorColor,
//               ),
//             ],
//           ),
//           Row(
//             children: [
//               button(
//                 text: "%",
//                 tColor: orangeColor,
//                 buttonBgColor: operatorColor,
//               ),
//               button(text: "0"),
//               button(text: "."),
//               button(
//                 text: "=",
//                 buttonBgColor: orangeColor,
//               ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }

//   Widget button({
//     required String text,
//     Color buttonBgColor = buttonColor,
//     Color tColor = Colors.white,
//   }) {
//     return Expanded(
//       child: Container(
//         margin: const EdgeInsets.all(8),
//         child: ElevatedButton(
//           style: ElevatedButton.styleFrom(
//             shape: RoundedRectangleBorder(
//               borderRadius: BorderRadius.circular(12),
//             ),
//             padding: const EdgeInsets.all(22),
//             backgroundColor: buttonBgColor,
//           ),
//           onPressed: () => onButtonClick(text),
//           child: Text(
//             text,
//             style: TextStyle(
//               fontSize: 18,
//               color: tColor,
//               fontWeight: FontWeight.bold,
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
import 'package:calculator_app/colors.dart';
import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';
//import 'app/modules/history_entry';

void main() {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: CalculatorApp(),
  ));
}

const Color colorDark = Colors.black;
const Color colorLight = Color(0xFFe6eeff);
bool darkMode = false;

class CalculatorApp extends StatefulWidget {
  const CalculatorApp({Key? key}) : super(key: key);

  @override
  State<CalculatorApp> createState() => _CalculatorAppState();
}

class _CalculatorAppState extends State<CalculatorApp> {
  double firstNum = 0.0;
  double secondNum = 0.0;
  var input = '';
  var output = '';
  var operation = '';
  var hideInput = false;
  var outputSize = 34.0;

  void onButtonClick(String value) {
    if (value == "AC") {
      input = '';
      output = '';
    } else if (value == "DEL") {
      if (input.isNotEmpty) {
        input = input.substring(0, input.length - 1);
      }
    } else if (value == "=") {
      if (input.isNotEmpty) {
        var userinput = input;
        userinput = input.replaceAll("x", "*");
        Parser p = Parser();
        Expression expression = p.parse(userinput);
        ContextModel cm = ContextModel();
        var finalValue = expression.evaluate(EvaluationType.REAL, cm);
        output = finalValue.toString();
        if (output.endsWith(".0")) {
          output = output.substring(0, output.length - 2);
        }
        input = output;
        hideInput = true;
        outputSize = 52;
      }
    } else if (value == "+/-") {
      if (input.isNotEmpty) {
        if (input.startsWith('-')) {
          input = input.substring(1);
        } else {
          input = '-$input';
        }
        output = input;
      }
    } else {
      input = input + value;
      hideInput = false;
      outputSize = 34;
    }

    setState(() {
      // No theme change code here
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: darkMode ? colorDark : colorLight,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          IconButton(
            onPressed: () {
              setState(() {
                // Toggle dark mode
                darkMode = !darkMode;
              });
            },
            icon: Icon(
              darkMode ? Icons.light_mode : Icons.dark_mode,
              color: darkMode ? Colors.white : Colors.black,
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.all(12),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      hideInput ? '' : input,
                      style: TextStyle(
                        fontSize: 48,
                        color: darkMode ? Colors.white : Colors.black,
                      ),
                    ),
                    const SizedBox(height: 20),
                    Text(
                      output,
                      style: TextStyle(
                        fontSize: outputSize,
                        color: darkMode ? Colors.white70 : Colors.black,
                      ),
                    ),
                    const SizedBox(height: 30),
                  ],
                ),
              ),
            ),
            Row(
              children: [
                button(
                  text: "AC",
                  buttonBgColor: operatorColor,
                  tColor: orangeColor,
                ),
                button(
                  text: "DEL",
                  buttonBgColor: operatorColor,
                  tColor: orangeColor,
                ),
                button(
                  text: "+/-",
                  buttonBgColor: operatorColor,
                  tColor: orangeColor,
                ),
                button(
                  text: "/",
                  buttonBgColor: operatorColor,
                  tColor: orangeColor,
                ),
              ],
            ),
            Row(
              children: [
                button(text: "7"),
                button(text: "8"),
                button(text: "9"),
                button(
                  text: "x",
                  tColor: orangeColor,
                  buttonBgColor: operatorColor,
                ),
              ],
            ),
            Row(
              children: [
                button(text: "4"),
                button(text: "5"),
                button(text: "6"),
                button(
                  text: "-",
                  tColor: orangeColor,
                  buttonBgColor: operatorColor,
                ),
              ],
            ),
            Row(
              children: [
                button(text: "1"),
                button(text: "2"),
                button(text: "3"),
                button(
                  text: "+",
                  tColor: orangeColor,
                  buttonBgColor: operatorColor,
                ),
              ],
            ),
            Row(
              children: [
                button(
                  text: "%",
                  tColor: orangeColor,
                  buttonBgColor: operatorColor,
                ),
                button(text: "0"),
                button(text: "."),
                button(
                  text: "=",
                  buttonBgColor: orangeColor,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget button({
    required String text,
    Color buttonBgColor = buttonColor,
    Color tColor = Colors.white,
  }) {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.all(8),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            padding: const EdgeInsets.all(22),
            backgroundColor: buttonBgColor,
            disabledBackgroundColor: darkMode ? buttonBgColor : Colors.white,
            foregroundColor: darkMode ? tColor : Colors.black,
          ),
          onPressed: () => onButtonClick(text),
          child: Text(
            text,
            style: TextStyle(
              fontSize: 18,
              color: tColor,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
