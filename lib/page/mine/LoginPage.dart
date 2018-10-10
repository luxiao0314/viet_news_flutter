import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _LoginPageStatus();
}

class _LoginPageStatus extends State<LoginPage> with TickerProviderStateMixin {

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Mine'),
      ),
      body: SingleChildScrollView(
        child: new Container(
          child: new Column(
            children: <Widget>[
              MaterialButton(onPressed: (){
                Navigator.of(context).push(new MaterialPageRoute(
                    builder: (context) {
                      return new LoginPage();
                    }
                ));
              },)
            ],
          ),
        ),
      )
//

//
    );
  }
}
