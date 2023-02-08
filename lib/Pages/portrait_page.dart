import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PortraitPage extends StatefulWidget {
  const PortraitPage({Key? key}) : super(key: key);

  @override
  State<PortraitPage> createState() => _PortraitPageState();
}

double height = 0;

double width = 0;

class _PortraitPageState extends State<PortraitPage> {
  Widget calbutton(String btntext, Color btncolor, Color textColor,) {
    return SizedBox(
      height: 80.h,
      // width: 6.w,
      child: ElevatedButton(
        onPressed: () {
          calculation(btntext);
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: btncolor,
          shape: const CircleBorder(),
          padding: const EdgeInsets.all(0),
        ),
        child: Text(
          "$btntext",
          style: TextStyle(fontSize: 14.sp, color: textColor),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, designSize: const Size(360, 690));
    Orientation currentOrientation = MediaQuery.of(context).orientation;
    if (currentOrientation == Orientation.portrait) {
      height = MediaQuery.of(context).size.height;
      width = MediaQuery.of(context).size.width;
    } else {
      width = MediaQuery.of(context).size.height;
      height = MediaQuery.of(context).size.width;
    }
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text("Calculator"),
        backgroundColor: Colors.black,
      ),
      body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10).w,
                    child: Text(
                      "$text",
                      style:  TextStyle(color: Colors.white, fontSize: 50.sp),
                      textAlign: TextAlign.left,
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  calbutton("AC" ,Colors.grey ,Colors.white),
                  calbutton("+/-" ,Colors.grey ,Colors.white),
                  calbutton("%" ,Colors.grey ,Colors.white),
                  calbutton("/" ,Colors.amber[700]! ,Colors.white),
                ],
              ),
              SizedBox(height: 2.h,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  calbutton("7" ,Colors.white38 ,Colors.white),
                  calbutton("8" ,Colors.white38 ,Colors.white),
                  calbutton("9" ,Colors.white38 ,Colors.white),
                  calbutton("x" ,Colors.amber[700]! ,Colors.white),
                ],
              ),
              SizedBox(height: 2.h,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  calbutton("4" ,Colors.white38 ,Colors.white),
                  calbutton("5" ,Colors.white38 ,Colors.white),
                  calbutton("6" ,Colors.white38 ,Colors.white),
                  calbutton("-" ,Colors.amber[700]! ,Colors.white),
                ],
              ),
              SizedBox(height: 2.h,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  calbutton("1" ,Colors.white38 ,Colors.white),
                  calbutton("2" ,Colors.white38 ,Colors.white),
                  calbutton("3" ,Colors.white38 ,Colors.white),
                  calbutton("+" ,Colors.amber[700]! ,Colors.white),
                ],
              ),
              SizedBox(height: 2.h,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(
                    width: 115.w,
                    height: 50.h,
                    child: ElevatedButton(
                        onPressed: () {
                          calculation('0');
                        },
                        style: ElevatedButton.styleFrom(shape: const StadiumBorder(),backgroundColor: Colors.white38),
                        child:  Text(
                          "0",
                          style: TextStyle(fontSize: 14.sp, color: Colors.white),
                        )),
                  ),

                  calbutton("." ,Colors.white38 ,Colors.white),
                  calbutton("=" ,Colors.amber[700]! ,Colors.white),
                ],
              ),
            ],
          )),
    );
  }

  dynamic text ='0';
  double numOne = 0;
  double numTwo = 0;

  dynamic result = '';
  dynamic finalResult = '';
  dynamic opr = '';
  dynamic preOpr = '';
  void calculation(btnText) {


    if(btnText  == 'AC') {
      text ='0';
      numOne = 0;
      numTwo = 0;
      result = '';
      finalResult = '0';
      opr = '';
      preOpr = '';

    } else if( opr == '=' && btnText == '=') {

      if(preOpr == '+') {
        finalResult = add();
      } else if( preOpr == '-') {
        finalResult = sub();
      } else if( preOpr == 'x') {
        finalResult = mul();
      } else if( preOpr == '/') {
        finalResult = div();
      }

    } else if(btnText == '+' || btnText == '-' || btnText == 'x' || btnText == '/' || btnText == '=') {

      if(numOne == 0) {
        numOne = double.parse(result);
      } else {
        numTwo = double.parse(result);
      }

      if(opr == '+') {
        finalResult = add();
      } else if( opr == '-') {
        finalResult = sub();
      } else if( opr == 'x') {
        finalResult = mul();
      } else if( opr == '/') {
        finalResult = div();
      }
      preOpr = opr;
      opr = btnText;
      result = '';
    }
    else if(btnText == '%') {
      result = numOne / 100;
      finalResult = doesContainDecimal(result);
    } else if(btnText == '.') {
      if(!result.toString().contains('.')) {
        result = result.toString()+'.';
      }
      finalResult = result;
    }

    else if(btnText == '+/-') {
      result.toString().startsWith('-') ? result = result.toString().substring(1): result = '-'+result.toString();
      finalResult = result;

    }

    else {
      result = result + btnText;
      finalResult = result;
    }


    setState(() {
      text = finalResult;
    });

  }


  String add() {
    result = (numOne + numTwo).toString();
    numOne = double.parse(result);
    return doesContainDecimal(result);
  }

  String sub() {
    result = (numOne - numTwo).toString();
    numOne = double.parse(result);
    return doesContainDecimal(result);
  }
  String mul() {
    result = (numOne * numTwo).toString();
    numOne = double.parse(result);
    return doesContainDecimal(result);
  }
  String div() {
    result = (numOne / numTwo).toString();
    numOne = double.parse(result);
    return doesContainDecimal(result);
  }


  String doesContainDecimal(dynamic result) {

    if(result.toString().contains('.')) {
      List<String> splitDecimal = result.toString().split('.');
      if(!(int.parse(splitDecimal[1]) > 0)) {
        return result = splitDecimal[0].toString();
      }
    }
    return result;
  }
}
