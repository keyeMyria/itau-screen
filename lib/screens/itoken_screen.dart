import 'package:flutter/material.dart';

class ITokenScreem extends StatefulWidget {
  @override
  _ITokenScreemState createState() => _ITokenScreemState();
}

class _ITokenScreemState extends State<ITokenScreem> {
  int circleWidth = 0;

@override
void didChangeDependencies(){
  super.didChangeDependencies();

}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              SizedBox(
                width: 25,
              ),
              Text(
                "iToken",
                style: TextStyle(fontSize: 20),
              ),
              IconButton(
                icon: Icon(
                  Icons.close,
                  size: 25,
                ),
                onPressed: Navigator.of(context).pop,
              )
            ],
          ),
          Container(
            decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.white,
                ),
                borderRadius: BorderRadius.circular(5)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Container(
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(5)),
                  width: (MediaQuery.of(context).size.width * 0.8) / 2,
                  height: 100,
                  child: Text("Aplicativo"),
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: Colors.transparent,
                  ),
                  width: (MediaQuery.of(context).size.width * 0.8) / 2,
                  height: 100,
                  child: Text(
                    "QR Code",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                Expanded(
                  child: Container(
                    child: Stack(
                      children: <Widget>[
                        AnimatedContainer(
                          duration: Duration(seconds: 30),
                          width: 10,
                          height: 100,
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
