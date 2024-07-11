import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int year = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white60,
      appBar: AppBar(
        title: Text(
          'User Profile',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.white,
        centerTitle: true,
      ),
      bottomNavigationBar: BottomNavigationBar(
        elevation: 3.0,
        onTap: (int val){
          switch(val){
            case 0:
              Navigator.pushNamed(context, '/dashboard');
              break;
            case 1:
              Navigator.pushNamed(context, '/menu');
              break;
            case 2:
              Navigator.pushNamed(context, '/');
              break;
          }
        },
        currentIndex: 2,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.smart_toy),
            label: 'Menu',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Center(
                  child: CircleAvatar(
                    backgroundImage: AssetImage('assets/image/kira.png'),
                    radius: 50.0,
                  ),
                ),
                Divider(
                  height: 55.0,
                  color: Colors.white70,
                  thickness: 5.0,
                ),
                Row(
                  children: [
                    Icon(
                      Icons.person,
                      color: Colors.white70,
                    ),
                    SizedBox(width: 8.0,),
                    Text(
                      'Name',
                      style: TextStyle(
                        fontSize: 16.0,
                        color: Colors.white70,
                        letterSpacing: 2.0,
                      ),
                    ),
                  ],
                ),
                Text(
                  'Roniel D. Madrigal',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: 20.0,
                  ),
                ),
                SizedBox(height: 30.0,),
                Row(
                  children: [
                    Icon(
                      Icons.school,
                      color: Colors.white70,
                    ),
                    SizedBox(width: 8.0,),
                    Text(
                      'Year',
                      style: TextStyle(
                        fontSize: 16.0,
                        color: Colors.white70,
                        letterSpacing: 2.0,
                      ),
                    ),
                  ],
                ),
                Text(
                  '$year Year',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: 20.0,
                  ),
                ),
                SizedBox(height: 30.0,),
                Row(
                  children: [
                    Icon(
                      Icons.email,
                      color: Colors.white70,
                    ),
                    SizedBox(width: 8.0,),
                    Text(
                      'Email',
                      style: TextStyle(
                        fontSize: 16.0,
                        color: Colors.white70,
                        letterSpacing: 2.0,
                      ),
                    ),
                  ],
                ),
                Text(
                  '21-16871@g.batstate-u.edu.ph',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: 20.0,
                  ),
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                ElevatedButton(
                    onPressed: (){
                      setState(() {
                        year += 1;
                      });
                    },
                    child: Text(
                        'Add Year',
                      style:  TextStyle(
                        fontSize: 16.0,
                        letterSpacing: 2.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
