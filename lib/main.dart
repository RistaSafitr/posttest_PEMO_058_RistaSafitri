import 'dart:ui';

import 'package:flutter/material.dart';
import 'landingPage.dart';
import 'form.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Posttest 4',
      home: const halamanLanding(),
      initialRoute: '/landingPage',
      routes: {
        '/landingPage': (context) => halamanLanding(),
        '/mainPage': (context) => HalamanUtama(),

      },
    );
  }
}

class halamanLanding extends StatelessWidget {
  const halamanLanding({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 123, 150, 163),
          title: Text("Fabric Shop",
          style: TextStyle(color: Colors.black),
          ),
          centerTitle: true,
          leading: IconButton(
            onPressed: () {
              Navigator.pushNamed(context, '/mainPage');
            },
            icon: Icon(Icons.home, color: Colors.black),
          ),
        ),
        body: const landingPage(),
    );
  }
}

class HalamanUtama extends StatelessWidget {
  const HalamanUtama({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 123, 150, 163),
          title: const Text("HOME",
          style: TextStyle(
            color: Colors.black
            ),
          ),
          centerTitle: true,
        ),
        body: GridView.count(
          crossAxisCount: 2,
          children: [
            jenisKain(judul: "Satin", gambar: "https://cdn.pixabay.com/photo/2014/11/21/03/49/fabric-540136_1280.jpg"),
            jenisKain(judul: "Batik", gambar: "https://cdn.pixabay.com/photo/2016/04/11/08/12/indonesia-1321504_1280.jpg"),
            jenisKain(judul: "Denim", gambar: "https://cdn.pixabay.com/photo/2016/11/29/02/04/denim-1866725_1280.jpg"),
            jenisKain(judul: "Linen", gambar: "https://cdn.pixabay.com/photo/2017/08/07/20/10/woven-2607340_1280.jpg"),
            jenisKain(judul: "Polyester", gambar: "https://cdn.pixabay.com/photo/2022/11/16/07/41/twill-7595378_1280.jpg"),
            jenisKain(judul: "Rajut", gambar: "https://cdn.pixabay.com/photo/2021/11/12/13/14/sweater-6788998_1280.jpg"),
          ],
        ),
        drawer: Drawer(
          backgroundColor: Color.fromRGBO(213, 213, 213, 1),
          child: Column(
            children: [
              const UserAccountsDrawerHeader(
                accountName: Text("Rista Safitri"), 
                accountEmail: Text("r@gmail.com"),
                currentAccountPicture: CircleAvatar(
                  backgroundImage: AssetImage('assets/satin.jpeg'),
                ),
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 123, 150, 163),
                ),
              ),
              ListTile(
                leading: const Icon(Icons.shopping_cart_outlined),
                title: const Text("Cart"),
                onTap: () {},
              ),
              ListTile(
                leading: const Icon(Icons.settings),
                title: const Text("Settings"),
                onTap: () {},
              ),
              ListTile(
                leading: const Icon(Icons.arrow_back),
                title: const Text("Back"),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class jenisKain extends StatelessWidget {
  jenisKain({required this.judul, required this.gambar});
    
  String judul;
  String gambar;
    
  @override
   Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 15),
      child: Card(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 150,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(
                    gambar,
                  ),
                  fit: BoxFit.cover
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Text(judul),
            ),
         ],
        ),
      ),
    );
  }
}