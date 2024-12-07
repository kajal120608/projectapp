import 'package:flutter/material.dart';
import 'package:shopirox_app/screen/bucategoris/categerioslist.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue.shade100.withOpacity(0.5),
      appBar: AppBar(
        centerTitle: true,
        leading: Icon(Icons.menu, color: Colors.black),
        title: Text(
          "Dashboard",
          style: TextStyle(
            color: Colors.black,
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
        flexibleSpace: Container(
           decoration: BoxDecoration(
            color: const Color.fromARGB(255, 155, 219, 250),
            
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 6,
                offset: Offset(0, 3),
              ),
            ],
          ),
        ),
        elevation: 1,
      ),
      body: ListView(
        padding: EdgeInsets.all(10),
        children: [
          buildMenuItem(
            context,
            icon: Icons.list,
            title: "Categories",
            subtitle: "Manage Categories",
             color: Colors.red.shade100,
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Categerioslist()),
            ),
          ),
          buildMenuItem(
            context,
            icon: Icons.calendar_month_rounded,
            title: "Business Period",
            subtitle: "Manage Business Period",
            color: const Color.fromARGB(255, 232, 206, 206),
            onTap: ()
            {}
          ),
          buildMenuItem(
            context,
            icon: Icons.layers,
            title: "Business Type",
            subtitle: "Manage Business Type",
             color: Colors.blue.shade100,
            onTap: () {
              
            },
          ),
          buildMenuItem(
            context,
            icon: Icons.shopping_cart_outlined,
            title: "Sell Options",
            subtitle: "Manage Sell Options",
             color: Colors.pink.shade100,
            onTap: () {},
          ),
          buildMenuItem(
            context,
            icon: Icons.wordpress,
            title: "Country",
            subtitle: "Manage Country",
             color: Colors.yellow.shade100,
            onTap: () {},
          ),
          buildMenuItem(
            context,
            icon: Icons.menu_book,
            title: "Dispute Subject",
            subtitle: "Manage Dispute Subject",
           color: Colors.green.shade100,
            onTap: () {},
          ),
        ],
      ),
    );
  }

  Widget buildMenuItem(BuildContext context,

      {required IconData icon,
      required String title,
      required String subtitle,
      required VoidCallback onTap,
      required  var color,
      }
      ) 
      {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        margin: EdgeInsets.symmetric(vertical: 8),
        elevation: 5,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 6,
                offset: Offset(0, 3),
              ),
            ],
          ),
          child: ListTile(
            contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            leading: Container(
              height: 50,
              width: 50,
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                color: color
              ),
              child: Icon(icon, color: Colors.blueAccent, size: 32),
            ),
            title: Text(
              title,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            subtitle: Text(
              subtitle,
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey[600],
              ),
            ),
            trailing: Icon(
              Icons.arrow_forward_ios_rounded,
              color: Colors.grey[600],
            ),
          ),
        ),
      ),
    );
  }
}