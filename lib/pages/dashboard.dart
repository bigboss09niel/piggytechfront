import 'package:flutter/material.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white60,
      appBar: AppBar(
        title: Text(
          'Dashboard',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      bottomNavigationBar: BottomNavigationBar(
        elevation: 3.0,
        onTap: (int val){
          switch(val){
            case 0:
              Navigator.pushNamed(context, '/');
              break;
            case 1:
              Navigator.pushNamed(context, '/menu');
              break;
            case 2:
              Navigator.pushNamed(context, '/profile');
              break;
          }
        },
        currentIndex: 0,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.fastfood),
            label: 'Menu',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),

      //appBar: AppBar(
      //  title: Text(
      //    'Dashboard',
      //    style: TextStyle(
      //      fontWeight: FontWeight.bold,
      //    ),
      //  ),
      //  backgroundColor: Colors.white,
      //  centerTitle: true,
      //),
      //body: Container(
      //  child: SafeArea(
      //    child: Center(
      //      child: Column(
      //        mainAxisAlignment: MainAxisAlignment.center,
      //        children: [
      //          ElevatedButton(
      //            onPressed: (){
      //              Navigator.pushNamed(context, '/menu');
      //            },
      //            child: Text('Go to menu'),
      //          ),
      //          SizedBox(height: 16.0,),
      //          ElevatedButton(
      //            onPressed: (){
      //              Navigator.pushNamed(context, '/profile');
      //            },
      //            child: Text('Go to profile'),
      //          ),
      //        ],
      //      ),
      //    )
      //  ),
      //),

    );
  }
}
