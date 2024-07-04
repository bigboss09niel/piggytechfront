import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final formKey = GlobalKey<FormState>();
  String email = '';
  String password = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false, //about bottom overflowed by pixel error
      backgroundColor: Colors.white70,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.fromLTRB(15.0, 50.0, 10.0, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                'Welcome to Oink-oink!',
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  letterSpacing: 2.0,
                  fontSize: 25.0,
                ),
              ),
              SizedBox(height: 30.0,),
              Form(
                key: formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    TextFormField(
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                          label: Text('Email'),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0)
                          )
                      ),
                      validator: (value){
                        if(value == null || value.isEmpty){
                          return 'Please provide an email';
                        }
                        return null;
                      },
                      onSaved: (value){
                        email = value!;
                      },
                    ),
                    SizedBox(height: 20.0,),
                    TextFormField(
                      obscureText: true,
                      decoration: InputDecoration(
                          label: Text('Password'),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0)
                          )
                      ),
                      validator: (value){
                        if(value == null || value.isEmpty){
                          return 'Please provide a password';
                        }
                        if(value.length < 8){
                          return 'Password should be atleast 8 characters long';
                        }
                        if(value.length > 20){
                          return 'Password must be 20 characters long only';
                        }
                        return null;
                      },
                      onSaved: (value){
                        password = value!;
                      },
                    ),
                    SizedBox(height: 30.0,),
                    ElevatedButton(
                      onPressed: (){
                        if(formKey.currentState!.validate()){
                          formKey.currentState!.save();
                          print(email);
                          print(password);
                          Navigator.pushReplacementNamed(context, '/');
                        }
                      },
                      child: Text('Login'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white70,
                        foregroundColor: Colors.black,
                      ),
                    ),
                    SizedBox(height: 20.0,),
                    Row(
                      children: <Widget>[
                        Expanded(
                          child: Divider(
                            color: Colors.grey[600],
                            height: 50,
                          ),
                        ),
                        SizedBox(width: 5.0,),
                        Text(
                          'Or Login with',
                          style: TextStyle(
                            color: Colors.grey[600],
                          ),
                        ),
                        SizedBox(width: 5.0,),
                        Expanded(
                          child: Divider(
                            color: Colors.grey[600],
                            height: 50,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20.0,),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        ElevatedButton(
                          onPressed: (){},
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              Icon(Icons.g_mobiledata),
                              SizedBox(width: 90.0,),
                              Text('Login with Google')
                            ],
                          ),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.red[400],
                            foregroundColor: Colors.grey[200],
                          ),
                        ),
                        SizedBox(height: 10.0,),
                        ElevatedButton(
                          onPressed: (){},
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              Icon(Icons.facebook),
                              SizedBox(width: 90.0,),
                              Text('Login with Facebook')
                            ],
                          ),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blue[400],
                            foregroundColor: Colors.grey[200],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20.0,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'Dont have an account?',
                          style: TextStyle(
                            color: Colors.grey[600],
                          ),
                        ),
                        SizedBox(width: 5.0,),
                        InkWell(
                          child: Text(
                            'Signup here',
                            style: TextStyle(
                              color: Colors.black,
                            ),
                          ),
                          onTap: ()=> Navigator.pushReplacementNamed(context, '/signup'),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}