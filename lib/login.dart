import 'package:flutter/material.dart';

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DSC World',
      debugShowCheckedModeBanner: false,
      home: login(),
    );
  }
}

class login extends StatefulWidget {
  login({Key key,this.title}):super(key: key);
  final String title;
  @override
  _loginState createState()=> _loginState();
}
class _login extends StatefulWidget{
  @override
  _loginState createState()=> _loginState();
}
class _loginState extends State<login>{
  bool hide = true;
  GlobalKey<FormState> formkey=  GlobalKey<FormState>();

  void validate(){
    if(formkey.currentState.validate()){
      print("validated");
    }else{
      print("Not Validated");
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child:Center(
          child:Column(
            children: [
              Padding(padding: EdgeInsets.only(top: 100)),
              Text('Log in',
                style: TextStyle(fontSize: 40,fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              Padding(padding: EdgeInsets.only(top: 50)),
              Container(
                child: TextField(decoration: InputDecoration(
                  icon: Icon(Icons.email_sharp,color: Colors.pink,),
                  hintText: "Email",
                  border: InputBorder.none,
                ),),
                margin: EdgeInsets.symmetric(vertical: 10),
                padding:EdgeInsets.symmetric(horizontal: 20,vertical: 5),
                width: 350,
                height: 50,
                decoration: BoxDecoration(color: Colors.white,
                  borderRadius: BorderRadius.circular(29),),
              ),
              Text('Required',style: TextStyle(color: Colors.white70,),),

              Container(
                child: TextField(
                  obscureText: hide,
                  decoration: InputDecoration(
                    icon: Icon(Icons.lock,color: Colors.pink),
                    suffixIcon:InkWell(
                      onTap: _passord,
                      child: Icon(Icons.visibility,color:Colors.pink ),
                    ),
                    hintText: "Password",
                    border: InputBorder.none,
                  ),
                ),
                margin: EdgeInsets.symmetric(vertical: 10),
                padding:EdgeInsets.symmetric(horizontal: 20,vertical: 5),
                width: 350,
                height: 50,
                decoration: BoxDecoration(color: Colors.white,
                  borderRadius: BorderRadius.circular(29),),
              ),
              Text('Required',style: TextStyle(color: Colors.white70),),
              Padding(padding: EdgeInsets.only(top: 50),),
              RaisedButton(onPressed: () {
                showDialog(context: context,
                    barrierDismissible: false,
                    builder: (context) {
                      return AlertDialog(
                        title: Text('Log in',
                          style: TextStyle(fontSize: 30,
                              fontWeight: FontWeight.bold),),
                        content: Container(
                          height: 80,
                          width: 250,
                          child: Text(
                            'Are you sure you want to sign in ?',
                            style: TextStyle(fontSize: 20),
                          ),
                        ),
                        actions: [
                          Padding(padding: EdgeInsets.only(left: 50)),
                          InkWell(
                            child:FlatButton(
                              onPressed: (){
                                Navigator.of(context).pop();
                                final bar =SnackBar(
                                  content: Expanded(
                                    child: Text ('Your Successfully Login'),
                                  ),
                                  action: SnackBarAction(
                                    label: 'OK',
                                    onPressed: (){},
                                  ),
                                );
                                ScaffoldMessenger.of(context).showSnackBar(bar);
                              },
                              child: Text('OK',
                                style: TextStyle(color: Colors.pink,
                                    fontWeight: FontWeight.bold,fontSize: 15),),
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.pushReplacement(context,
                                  MaterialPageRoute(
                                      builder: (context) => login()));
                            },
                            child: Text('Cancel',
                              style: TextStyle(color: Colors.pink,
                                  fontWeight: FontWeight.bold,fontSize: 15),),),
                        ],
                      );
                    }
                );
              }
                  // validate
                  , child: Text('Log in',
                    style: TextStyle(fontSize: 20),)
              ),
            ],
          ),
        ),
      ),
      backgroundColor: Colors.pink,
    );
  }
  void _passord(){
    setState(() {
      hide = !hide;
    });
  }
}