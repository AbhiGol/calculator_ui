import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

class Calculator1 extends StatefulWidget {
  const Calculator1({super.key});

  @override
  State<Calculator1> createState() => CalculatorState();
}

class CalculatorState extends State<Calculator1> {
  String equation = '';
  String operand = '';
  int count = 0;
  bool isdark = true;
  String result = '';
  int flag = 0;
  String dividestring = '';
  bool divide = false;
  bool colon = false;

  ThemeMode _themeMode = ThemeMode.system;
  void changeTheme(ThemeMode themeMode) {
    setState(() {
      _themeMode = themeMode;
      if (_themeMode == ThemeMode.dark) {
        isdark = true;
      } else {
        isdark = false;
      }
    });
  }

  void equalPressed() {
    Parser p = Parser();
    Expression exp = p.parse(equation);
    ContextModel cm = ContextModel();
    double eval = exp.evaluate(EvaluationType.REAL, cm);
    result = eval.toString();
  }

  buttonPressed(btntext) {
    int len = equation.length;
    int rlen = result.length;

    setState(() {
      // For Clear Button
      if (btntext == 'C') {
        result = '';
        equation = '';
        flag = 0;
        count = 0;
        divide = false;
        dividestring = '';
        colon = false;
      }
      // For Equal Button
      else if (btntext == '=') {
        if (equation[len - 1] == '+' ||
            equation[len - 1] == '-' ||
            equation[len - 1] == '*' ||
            equation[len - 1] == '/' ||
            equation[len - 1] == '%' ||
            equation[len - 1] == '.') {
          equation = equation.replaceRange(len - 1, null, '');
          result = result.replaceRange(rlen - 1, null, '');
        }
        equalPressed();
      }
      // for Addition operation
      else if (btntext == '+') {
        flag = 1;
        count = 0;
        if (equation[len - 1] == '+' ||
            equation[len - 1] == '-' ||
            equation[len - 1] == '*' ||
            equation[len - 1] == '/' ||
            equation[len - 1] == '%' ||
            equation[len - 1] == '.' ||
            equation[len - 1] == '(') {
          if (len >= 5) {
            if (equation[len - 5] == '/' && equation[len - 1] == '*') {
              equation = equation.replaceRange(len - 5, null, '+');
              result = result.replaceRange(rlen - 1, null, '+');
            } else if (equation[len - 2] == '(' || equation[len - 1] == '(') {
            } else {
              if (equation[len - 1] == '.' &&
                  (equation[len - 2] == '+' ||
                      equation[len - 2] == '-' ||
                      equation[len - 2] == '*' ||
                      equation[len - 2] == '/' ||
                      equation[len - 5] == '/')) {
              } else {
                equation = equation.replaceRange(len - 1, null, '+');
                result = result.replaceRange(rlen - 1, null, '+');
              }
            }
          } else {
            if (equation[len - 1] == '.' &&
                (equation[len - 2] == '+' ||
                    equation[len - 2] == '-' ||
                    equation[len - 2] == '*' ||
                    equation[len - 2] == '/')) {
            } else if (equation[len - 2] == '(' || equation[len - 1] == '(') {
            } else {
              equation = equation.replaceRange(len - 1, null, '+');
              result = result.replaceRange(rlen - 1, null, '+');
            }
          }
        } else {
          equation = equation + btntext;
          result = result + btntext;
        }
      }
      // for Subtraction operation
      else if (btntext == '-') {
        flag = 1;
        count = 0;
        if (equation[len - 1] == '+' ||
            equation[len - 1] == '-' ||
            equation[len - 1] == '*' ||
            equation[len - 1] == '/' ||
            equation[len - 1] == '%' ||
            equation[len - 1] == '.') {
          if (len >= 5) {
            if (equation[len - 5] == '/' && equation[len - 1] == '*') {
              equation = equation.replaceRange(len - 5, null, '-');
              result = result.replaceRange(rlen - 1, null, '-');
            } else {
              if (equation[len - 1] == '.' &&
                  (equation[len - 2] == '-' ||
                      equation[len - 2] == '+' ||
                      equation[len - 2] == '*' ||
                      equation[len - 2] == '/')) {
              } else {
                equation = equation.replaceRange(len - 1, null, '-');
                result = result.replaceRange(rlen - 1, null, '-');
              }
            }
          } else {
            if (equation[len - 1] == '.' &&
                (equation[len - 2] == '-' ||
                    equation[len - 2] == '+' ||
                    equation[len - 2] == '*' ||
                    equation[len - 2] == '/')) {
            } else {
              equation = equation.replaceRange(len - 1, null, '-');
              result = result.replaceRange(rlen - 1, null, '-');
            }
          }
        } else {
          equation = equation + btntext;
          result = result + btntext;
        }
      }
      // For Multiplication  Operation
      else if (btntext == '*') {
        flag = 1;
        count = 0;
        if (equation[len - 1] == '+' ||
            equation[len - 1] == '-' ||
            equation[len - 1] == '*' ||
            equation[len - 1] == '/' ||
            equation[len - 1] == '%' ||
            equation[len - 1] == '.' ||
            equation[len - 1] == '(') {
          if (len >= 5) {
            if (equation[len - 5] == '/' && equation[len - 1] == '*') {
              equation = equation.replaceRange(len - 5, null, '*');
              result = result.replaceRange(rlen - 1, null, '*');
            } else if (equation[len - 2] == '(' || equation[len - 1] == '(') {
            } else {
              if (equation[len - 1] == '.' &&
                  (equation[len - 2] == '-' ||
                      equation[len - 2] == '+' ||
                      equation[len - 2] == '*' ||
                      equation[len - 2] == '/')) {
              } else {
                equation = equation.replaceRange(len - 1, null, '*');
                result = result.replaceRange(rlen - 1, null, '*');
              }
            }
          } else {
            if (equation[len - 1] == '.' &&
                (equation[len - 2] == '-' ||
                    equation[len - 2] == '+' ||
                    equation[len - 2] == '*' ||
                    equation[len - 2] == '/')) {
            } else if (equation[len - 2] == '(' || equation[len - 1] == '(') {
            } else {
              equation = equation.replaceRange(len - 1, null, '*');
              result = result.replaceRange(rlen - 1, null, '*');
            }
          }
        } else {
          equation = equation + btntext;
          result = result + btntext;
        }
      }
      // For Divition Operation
      else if (btntext == '/') {
        flag = 1;
        count = 0;
        if (equation[len - 1] == '+' ||
            equation[len - 1] == '-' ||
            equation[len - 1] == '*' ||
            equation[len - 1] == '/' ||
            equation[len - 1] == '%' ||
            equation[len - 1] == '.' ||
            equation[len - 1] == '(') {
          if (len >= 5) {
            if (equation[len - 5] == '/' && equation[len - 1] == '*') {
              equation = equation.replaceRange(len - 5, null, '/');
              result = result.replaceRange(rlen - 1, null, '/');
            } else if (equation[len - 2] == '(' || equation[len - 1] == '(') {
            } else {
              if (equation[len - 1] == '.' &&
                  (equation[len - 2] == '-' ||
                      equation[len - 2] == '+' ||
                      equation[len - 2] == '*' ||
                      equation[len - 2] == '/')) {
              } else {
                equation = equation.replaceRange(len - 1, null, '/');
                result = result.replaceRange(rlen - 1, null, '/');
              }
            }
          } else {
            if (equation[len - 1] == '.' &&
                (equation[len - 2] == '-' ||
                    equation[len - 2] == '+' ||
                    equation[len - 2] == '*' ||
                    equation[len - 2] == '/')) {
            } else if (equation[len - 2] == '(' || equation[len - 1] == '(') {
            } else {
              equation = equation.replaceRange(len - 1, null, '/');
              result = result.replaceRange(rlen - 1, null, '/');
            }
          }
        } else {
          equation = equation + btntext;
          result = result + btntext;
        }
      }
      // For  Modulus/Percentage Operation
      else if (btntext == '%') {
        flag = 1;
        count = 0;
        if (equation[len - 1] == '+' ||
            equation[len - 1] == '-' ||
            equation[len - 1] == '*' ||
            equation[len - 1] == '/' ||
            equation[len - 1] == '%' ||
            equation[len - 1] == '.' ||
            equation[len - 1] == '(') {
          if (len >= 5) {
            if (equation[len - 5] == '/' && equation[len - 1] == '*') {
              equation = equation.replaceRange(len - 5, null, ('/100') + ('*'));
              result = result.replaceRange(rlen - 1, null, '%');
            } else if (equation[len - 2] == '(' || equation[len - 1] == '(') {
            } else {
              if (equation[len - 1] == '.' &&
                      (equation[len - 2] == '-' ||
                          equation[len - 2] == '+' ||
                          equation[len - 2] == '*' ||
                          equation[len - 2] == '/') ||
                  equation[len - 5] == '/') {
              } else {
                equation =
                    equation.replaceRange(len - 1, null, ('/100') + ('*'));
                result = result.replaceRange(rlen - 1, null, '%');
              }
            }
          } else {
            if (equation[len - 1] == '.' &&
                (equation[len - 2] == '-' ||
                    equation[len - 2] == '+' ||
                    equation[len - 2] == '*' ||
                    equation[len - 2] == '/')) {
            } else if (equation[len - 2] == '(' ||
                equation[len - 1] == '(' ||
                equation[len - 1] == ')') {
            } else {
              equation = equation.replaceRange(len - 1, null, ('/100') + ('*'));
              result = result.replaceRange(rlen - 1, null, '%');
            }
          }
        } else {
          equation = equation + ('/100') + ('*');
          result = result + btntext;
        }
      }
      // For Positive or Negetive  Sign operation
      else if (btntext == '+/-') {
        if (result[0] != '-') {
          //if (result[0] != '-') {
          equation = '-$result';
          result = '-$result';
        } else {
          result = result.substring(1);
          equation = result;
        }
      }

      // For  Colon Operation
      else if (btntext == '( )') {
        if (colon == false &&
            (equation[len - 1] == '+' ||
                equation[len - 1] == '-' ||
                equation[len - 1] == '*' ||
                equation[len - 1] == '/' ||
                equation[len - 1] == ' ')) {
          result += '(';
          equation += '(';
          colon = true;
        } else if (colon == true &&
            (equation[len - 1] == '+' ||
                equation[len - 1] == '-' ||
                equation[len - 1] == '*' ||
                equation[len - 1] == '/' ||
                equation[len - 1] == '.' ||
                equation[len - 1] == '(')) {
        } else if (colon == true &&
            (equation[len - 1] != '+' ||
                equation[len - 1] != '-' ||
                equation[len - 1] != '*' ||
                equation[len - 1] != '/' ||
                equation[len - 1] != '.' ||
                equation[len - 1] != '(')) {
          result += ')';
          equation += ')';
          colon = false;
        }
      }

      // For Decimal Point operation
      else if (btntext == '.') {
        if (result[0] == '') {}

        if ((flag == 1 || count == 0)) {
          if (equation[len - 1] == ')') {
          } else {
            result = result + btntext;
            equation = equation + btntext;
            count = 1;
            flag = 0;
          }
        }
        if (equation[len - 1] == ')') {}
        if (equation[len - 1] == '.') {
          equation = equation.replaceRange(len - 1, null, '.');
          result = result.replaceRange(rlen - 1, null, '.');
        }
      }
      // Can't divided by 0
      else if (btntext == '0') {
        if (len > 0) {
          if (equation[len - 1] == '/') {
            divide = true;
            dividestring = 'Can not divide by 0';
          }
          equation += btntext;
          result += btntext;
        } else {
          equation += btntext;
          result += btntext;
        }
      } else {
        if (len > 0) {
          if (equation[len - 1] == ')') {
          } else {
            equation += btntext;
            result += btntext;
          }
        } else {
          equation += btntext;
          result += btntext;
        }
      }
    });
  }

  Widget calbutton(
      String btntxt,
      Color lightbtncolor,
      Color lighttxtcolor,
      Color lightbrdcolor,
      Color darkbtncolor,
      Color darktxtcolor,
      Color darkbrdcolor,
      double btnwidth) {
    return InkWell(
        customBorder:
            const CircleBorder(eccentricity: 0, side: BorderSide.none),
        onTap: () {
          buttonPressed(btntxt);
        },
        child: Container(
          margin: const EdgeInsets.only(top: 15),
          alignment: Alignment.center,
          height: 80,
          width: btnwidth,
          decoration: BoxDecoration(
              border: Border.all(
                  color: isdark ? darkbrdcolor : lightbrdcolor, width: 3.5),
              color: isdark ? darkbtncolor : lightbtncolor,
              borderRadius: BorderRadius.circular(40.0)),
          child: Text(
            btntxt,
            style: TextStyle(
                color: isdark ? lightbtncolor : darkbtncolor, fontSize: 30),
            textAlign: TextAlign.center,
          ),
        ));
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        darkTheme: ThemeData.dark(),
        theme: ThemeData.light(),
        themeMode: _themeMode,
        home: Scaffold(
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    Padding(
                        padding: const EdgeInsets.only(right: 10),
                        child: IconButton(
                          icon: isdark
                              ? const Icon(
                                  Icons.light_mode_outlined,
                                  size: 45,
                                )
                              : const Icon(
                                  Icons.dark_mode_outlined,
                                  size: 45,
                                ),
                          onPressed: () {
                            isdark
                                ? changeTheme(ThemeMode.light)
                                : changeTheme(ThemeMode.dark);
                          },
                        )),
                  ],
                ),
                const SizedBox(
                  height: 25,
                ),
                Expanded(
                  flex: 1,
                  child: SingleChildScrollView(
                    reverse: true,
                    child: Container(
                      alignment: Alignment.bottomRight,
                      padding: const EdgeInsets.only(right: 45),
                      child: Text(
                        divide ? dividestring : equation,
                        textAlign: TextAlign.end,
                        style: const TextStyle(
                            color: Color.fromARGB(255, 158, 158, 158),
                            fontSize: 27),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: SingleChildScrollView(
                    reverse: true,
                    child: Container(
                      alignment: Alignment.bottomRight,
                      margin: const EdgeInsets.only(
                        right: 40,
                      ),
                      child: Text(
                        divide ? dividestring : result,
                        textAlign: TextAlign.end,
                        style: TextStyle(
                            color: isdark ? Colors.white : Colors.black87,
                            fontSize: 45),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    calbutton(
                        "C",
                        const Color.fromARGB(255, 238, 238, 238),
                        const Color.fromARGB(255, 150, 150, 150),
                        const Color.fromARGB(134, 200, 200, 200),
                        const Color.fromARGB(255, 112, 112, 112),
                        Colors.white,
                        const Color.fromARGB(135, 186, 186, 186),
                        80),
                    calbutton(
                        "+/-",
                        const Color.fromARGB(255, 238, 238, 238),
                        const Color.fromARGB(255, 150, 150, 150),
                        const Color.fromARGB(134, 200, 200, 200),
                        const Color.fromARGB(255, 112, 112, 112),
                        Colors.white,
                        const Color.fromARGB(135, 186, 186, 186),
                        80),
                    calbutton(
                        "%",
                        const Color.fromARGB(255, 238, 238, 238),
                        const Color.fromARGB(255, 150, 150, 150),
                        const Color.fromARGB(134, 200, 200, 200),
                        const Color.fromARGB(255, 112, 112, 112),
                        Colors.white,
                        const Color.fromARGB(135, 186, 186, 186),
                        80),
                    calbutton(
                        "/",
                        const Color.fromARGB(255, 238, 238, 238),
                        const Color.fromARGB(255, 150, 150, 150),
                        const Color.fromARGB(134, 200, 200, 200),
                        const Color.fromARGB(255, 112, 112, 112),
                        Colors.white,
                        const Color.fromARGB(135, 186, 186, 186),
                        80),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    calbutton(
                        "7",
                        Colors.white,
                        const Color.fromARGB(134, 77, 76, 76),
                        const Color.fromARGB(255, 215, 220, 219),
                        const Color.fromARGB(134, 77, 76, 76),
                        Colors.white,
                        const Color.fromARGB(255, 74, 74, 74),
                        80),
                    calbutton(
                        "8",
                        Colors.white,
                        const Color.fromARGB(134, 77, 76, 76),
                        const Color.fromARGB(255, 215, 220, 219),
                        const Color.fromARGB(134, 77, 76, 76),
                        Colors.white,
                        const Color.fromARGB(255, 74, 74, 74),
                        80),
                    calbutton(
                        "9",
                        Colors.white,
                        const Color.fromARGB(134, 77, 76, 76),
                        const Color.fromARGB(255, 215, 220, 219),
                        const Color.fromARGB(134, 77, 76, 76),
                        Colors.white,
                        const Color.fromARGB(255, 74, 74, 74),
                        80),
                    calbutton(
                        "*",
                        const Color.fromARGB(255, 238, 238, 238),
                        const Color.fromARGB(255, 150, 150, 150),
                        const Color.fromARGB(134, 200, 200, 200),
                        const Color.fromARGB(255, 112, 112, 112),
                        Colors.white,
                        const Color.fromARGB(135, 186, 186, 186),
                        80),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    calbutton(
                        "4",
                        Colors.white,
                        const Color.fromARGB(134, 77, 76, 76),
                        const Color.fromARGB(255, 215, 220, 219),
                        const Color.fromARGB(134, 77, 76, 76),
                        Colors.white,
                        const Color.fromARGB(255, 74, 74, 74),
                        80),
                    calbutton(
                        "5",
                        Colors.white,
                        const Color.fromARGB(134, 77, 76, 76),
                        const Color.fromARGB(255, 215, 220, 219),
                        const Color.fromARGB(134, 77, 76, 76),
                        Colors.white,
                        const Color.fromARGB(255, 74, 74, 74),
                        80),
                    calbutton(
                        "6",
                        Colors.white,
                        const Color.fromARGB(134, 77, 76, 76),
                        const Color.fromARGB(255, 215, 220, 219),
                        const Color.fromARGB(134, 77, 76, 76),
                        Colors.white,
                        const Color.fromARGB(255, 74, 74, 74),
                        80),
                    calbutton(
                        "-",
                        const Color.fromARGB(255, 238, 238, 238),
                        const Color.fromARGB(255, 150, 150, 150),
                        const Color.fromARGB(134, 200, 200, 200),
                        const Color.fromARGB(255, 112, 112, 112),
                        Colors.white,
                        const Color.fromARGB(135, 186, 186, 186),
                        80),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    calbutton(
                        "1",
                        Colors.white,
                        const Color.fromARGB(134, 77, 76, 76),
                        const Color.fromARGB(255, 215, 220, 219),
                        const Color.fromARGB(134, 77, 76, 76),
                        Colors.white,
                        const Color.fromARGB(255, 74, 74, 74),
                        80),
                    calbutton(
                        "2",
                        Colors.white,
                        const Color.fromARGB(134, 77, 76, 76),
                        const Color.fromARGB(255, 215, 220, 219),
                        const Color.fromARGB(134, 77, 76, 76),
                        Colors.white,
                        const Color.fromARGB(255, 74, 74, 74),
                        80),
                    calbutton(
                        "3",
                        Colors.white,
                        const Color.fromARGB(134, 77, 76, 76),
                        const Color.fromARGB(255, 215, 220, 219),
                        const Color.fromARGB(134, 77, 76, 76),
                        Colors.white,
                        const Color.fromARGB(255, 74, 74, 74),
                        80),
                    calbutton(
                        "+",
                        const Color.fromARGB(255, 238, 238, 238),
                        const Color.fromARGB(255, 150, 150, 150),
                        const Color.fromARGB(134, 200, 200, 200),
                        const Color.fromARGB(255, 112, 112, 112),
                        Colors.white,
                        const Color.fromARGB(135, 186, 186, 186),
                        80),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    calbutton(
                        "0",
                        Colors.white,
                        const Color.fromARGB(134, 77, 76, 76),
                        const Color.fromARGB(255, 215, 220, 219),
                        const Color.fromARGB(134, 77, 76, 76),
                        Colors.white,
                        const Color.fromARGB(255, 74, 74, 74),
                        80),
                    calbutton(
                        "( )",
                        Colors.white,
                        const Color.fromARGB(134, 77, 76, 76),
                        const Color.fromARGB(255, 215, 220, 219),
                        const Color.fromARGB(134, 77, 76, 76),
                        Colors.white,
                        const Color.fromARGB(255, 74, 74, 74),
                        80),
                    calbutton(
                        ".",
                        Colors.white,
                        const Color.fromARGB(134, 77, 76, 76),
                        const Color.fromARGB(255, 215, 220, 219),
                        const Color.fromARGB(134, 77, 76, 76),
                        Colors.white,
                        const Color.fromARGB(255, 74, 74, 74),
                        80),
                    calbutton(
                        "=",
                        const Color.fromARGB(255, 53, 217, 184),
                        Colors.white,
                        const Color.fromARGB(133, 4, 190, 163),
                        const Color.fromARGB(156, 1, 159, 136),
                        Colors.white,
                        const Color.fromARGB(156, 1, 159, 136),
                        80),
                  ],
                ),
                const SizedBox(
                  height: 20,
                )
              ],
            ),
          ),
        ));
  }
}
