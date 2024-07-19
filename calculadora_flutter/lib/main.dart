import 'package:calculadora_flutter/widgets/calcbutton.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:math_expressions/math_expressions.dart';

void main(List<String> args) {
  runApp(const CalculadoraApp());
}


class CalculadoraApp extends StatefulWidget {
  const CalculadoraApp({super.key});

  @override
  State<CalculadoraApp> createState() => _CalculadoraAppState();
}

class _CalculadoraAppState extends State<CalculadoraApp> {
  String _historial = '';
  String _expresion = '';
  void allClear(String text){
    setState(() {
      _historial= '';
      _expresion = '';
    });
  }

    void clear(String text){
    setState(() {
      _expresion = '';
    });
  } 

  void evaluate(String text){
    Parser p= Parser();
    Expression exp = p.parse(_expresion);
    ContextModel cm = ContextModel();
    setState(() {
      _historial= _expresion;
      _expresion = exp.evaluate(EvaluationType.REAL, cm).toString();
    });
  }

  void numClick(String text){
    setState(() {
      _expresion+= text;
    });
  }

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Calculadora',
      home:  Scaffold(
        backgroundColor: const Color.fromARGB(255, 24, 42, 61),
        body: 
          Container(
            padding: const EdgeInsets.all(15),
            child: 
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    alignment: const Alignment(1.0, 1.0),
                    child: 
                      Padding(
                        padding: const EdgeInsets.only(right: 12),
                        child: Text(_historial, style: GoogleFonts.rubik(
                            textStyle:  const  TextStyle(fontSize: 24,color: Color.fromARGB(255, 68, 96, 107)))
                          ),
                          ),
                    ),
                    Container(
                      alignment: const AlignmentDirectional(1.0, 1.0),
                      child: 
                        Padding(padding:  const EdgeInsets.all(12),
                        child: Text(_expresion,
                          style: GoogleFonts.rubik(
                            textStyle: const TextStyle(color: Colors.white)
                          ),),),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Calcbutton(
                          callback: allClear,
                          text: 'AC',
                          textSize: 20,
                          bgcolor: 0xffee1045,
                        ),
                        Calcbutton(
                          callback: clear,
                          text: 'C',
                          textSize: 20,
                          bgcolor: 0xfffcba03,
                        ),
                        Calcbutton(
                          callback: numClick,
                          text: '%',
                          textSize: 20,
                        ),
                        Calcbutton(
                          callback: numClick,
                          text: '/',
                          textSize: 20,
                        ),
                      ],
                    ),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Calcbutton(
                          callback: numClick,
                          text: '7',
                          textSize: 20,
                        ),
                        Calcbutton(
                          callback: numClick,
                          text: '8',
                          textSize: 20,
                        ),
                        Calcbutton(
                          callback: numClick,
                          text: '9',
                          textSize: 20,
                        ),
                        Calcbutton(
                          callback: numClick,
                          text: '*',
                          textSize: 20,
                        ),
                      ],
                    ),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Calcbutton(
                          callback: numClick,
                          text: '4',
                          textSize: 20,
                        ),
                        Calcbutton(
                          callback: numClick,
                          text: '5',
                          textSize: 20,
                        ),
                        Calcbutton(
                          callback: numClick,
                          text: '6',
                          textSize: 20,
                        ),
                        Calcbutton(
                          callback: numClick,
                          text: '+',
                          textSize: 20,
                        ),
                      ],
                    ),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Calcbutton(
                          callback: numClick,
                          text: '1',
                          textSize: 20,
                        ),
                        Calcbutton(
                          callback: numClick,
                          text: '2',
                          textSize: 20,
                        ),
                        Calcbutton(
                          callback: numClick,
                          text: '3',
                          textSize: 20,
                        ),
                        Calcbutton(
                          callback: numClick,
                          text: '-',
                          textSize: 20,
                        ),
                      ],
                    ),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Calcbutton(
                          callback: numClick,
                          text: '.',
                          textSize: 20,
                        ),
                        Calcbutton(
                          callback: numClick,
                          text: '0',
                          textSize: 20,
                        ),
                        Calcbutton(
                          callback: numClick,
                          text: '00',
                          textSize: 20,
                        ),
                        Calcbutton(
                          callback: evaluate,
                          text: '=',
                          textSize: 20,
                          bgcolor: 0xfffcba03,
                        ),
                      ],
                    )
                ],
              ),
          ),
      ),
      );
  }
}