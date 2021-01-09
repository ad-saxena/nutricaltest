import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class WorkoutsTimerPage extends StatefulWidget {
  @override
  _WorkoutsTimerPageState createState() => _WorkoutsTimerPageState();
}

class _WorkoutsTimerPageState extends State<WorkoutsTimerPage> {
  CountDownController _controller = CountDownController();
  ConfettiController _confettiController=ConfettiController(duration: Duration(seconds: 1));
  bool _isPause = false;
  bool _isTicking=true;
  bool _isText=false;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: Colors.white,
        title:Text('Timer',style:TextStyle(color: Colors.black,
            fontWeight:FontWeight.w500,
            fontSize: 20,
            letterSpacing: 0.1),),),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 25.0,
            ),

            Visibility(
             visible: _isText?true:false,
              maintainSize:true,
              maintainAnimation: true,
              maintainState: true,
              child:Center
                (child: ColorizeAnimatedTextKit(
                  textStyle:TextStyle(color: Colors.red,
                  fontWeight: FontWeight.w500,
                  fontSize: 40,),
                  text: ['Congratulations'],
            colors: [Colors.red,
              Colors.purple,
              Colors.blue,
              Colors.yellow,
              Colors.grey],),),),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Align(alignment:Alignment.topCenter,
                 child: ConfettiWidget(
                  confettiController:_confettiController ,
                  emissionFrequency: 0.3,
                  blastDirectionality: BlastDirectionality.explosive,

            ),),
                Center(
                  child: CircularCountDownTimer(
                    duration: 2,
                    controller: _controller,
                    width: MediaQuery.of(context).size.width/2,
                    height: MediaQuery.of(context).size.height/2,
                    color: Colors.blueGrey[100],
                    fillColor: Color(0xFF00bcd4),
                    backgroundColor: null,
                    strokeWidth: 20,
                    textStyle: TextStyle(
                        fontSize: 22.0,
                        letterSpacing: 5.0,
                        color: Colors.black,
                        fontFamily: 'BebasNeue',
                        fontWeight: FontWeight.w600),
                    isReverse: true,
                    isReverseAnimation: true,
                    isTimerTextShown: true,
                    onComplete: () {
                      _confettiController.play();
                      setState(() {
                        _isPause=false;
                        _isTicking=false;
                        _isText=true;
                      });
                    },
                  ),
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(70.0),
                          color: Colors.blueGrey,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(9.0),
                          child: IconButton(
                              icon: Icon(
                                _isTicking?_isPause? Icons.play_arrow : Icons.pause:Icons.pause,
                                size: 30.0,
                                color: Colors.white,
                              ),
                              onPressed: () {
                                setState(() {
                                  if (_isPause) {
                                    _isPause = false;
                                    _controller.resume();
                                  } else {
                                    _isPause = true;
                                    _controller.pause();
                                  }
                                });
                                _isPause ? _controller.pause() : _controller.resume();
                              }),
                        ),
                      ),
                    SizedBox(
                      height: 25.0,
                    ),
                    Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(70.0),
                          color: Colors.blueGrey,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(9.0),
                          child: IconButton(
                            icon: Icon(
                              Icons.refresh_sharp,
                              size: 30.0,
                              color: Colors.white,
                            ),
                            onPressed: () {
                              _controller.restart();
                              setState(() {
                                _isPause=false;
                                _isTicking=true;
                                _isText=false;
                              });
                            }
                          ),
                        ),
                      ),

                  ],
                ),

              ],
            ),
          ],
        ),
      ),
      // floatingActionButton: FloatingActionButton.extended(
      //     onPressed: () {
      //       setState(() {
      //         if (_isPause) {
      //           _isPause = false;
      //           _controller.resume();
      //         } else {
      //           _isPause = true;
      //           _controller.pause();
      //         }
      //       });
      //     },
      //     icon: Icon(_isPause ? Icons.play_arrow : Icons.pause),
      //     label: Text(_isPause ? "Resume" : "Pause")),
    );
  }
}
