import "package:flutter/material.dart";

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "CV Esther",
      theme: ThemeData(primarySwatch: Colors.pink),
      home: LoginPage(),
    );
  }
}

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pink[50],
      body: Padding(
        padding: EdgeInsets.all(24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 55,
              backgroundColor: Colors.pink,
              backgroundImage: AssetImage("assets/images/image.png"),
            ),
            SizedBox(height: 20),
            Text("Bienvenue - CV Esther", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            SizedBox(height: 30),
            TextField(
              decoration: InputDecoration(labelText: "Identifiant", border: OutlineInputBorder(), prefixIcon: Icon(Icons.person)),
            ),
            SizedBox(height: 15),
            TextField(
              obscureText: true,
              decoration: InputDecoration(labelText: "Mot de passe", border: OutlineInputBorder(), prefixIcon: Icon(Icons.lock)),
            ),
            SizedBox(height: 25),
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => MainScreen()));
                },
                child: Text("Se connecter", style: TextStyle(fontSize: 18)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _index = 0;
  final List<Widget> _pages = [AccueilPage(), FamillePage(), ContactPage()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Mon CV")),
      drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(
              decoration: BoxDecoration(color: Colors.pink),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CircleAvatar(radius: 30, backgroundColor: Colors.white, backgroundImage: AssetImage("assets/images/image.png")),
                  SizedBox(height: 10),
                  Text("Esther Belani", style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold)),
                  Text("Etudiante - Goma", style: TextStyle(color: Colors.white)),
                ],
              ),
            ),
            ListTile(title: Text("Accueil - Mon CV"), leading: Icon(Icons.home), onTap: () { setState(() => _index = 0); Navigator.pop(context); }),
            ListTile(title: Text("Famille"), leading: Icon(Icons.family_restroom), onTap: () { setState(() => _index = 1); Navigator.pop(context); }),
            ListTile(title: Text("Contact"), leading: Icon(Icons.contact_mail), onTap: () { setState(() => _index = 2); Navigator.pop(context); }),
          ],
        ),
      ),
      body: _pages[_index],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _index,
        onTap: (i) => setState(() => _index = i),
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Accueil"),
          BottomNavigationBarItem(icon: Icon(Icons.family_restroom), label: "Famille"),
          BottomNavigationBarItem(icon: Icon(Icons.contact_mail), label: "Contact"),
        ],
      ),
    );
  }
}

class AccueilPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Column(
              children: [
                CircleAvatar(radius: 60, backgroundColor: Colors.pink, backgroundImage: AssetImage("assets/images/image.png")),
                SizedBox(height: 10),
                Text("Esther Belani", style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold)),
                Text("Etudiante en LIC 3 LIAGE", style: TextStyle(fontSize: 16, color: Colors.grey)),
                SizedBox(height: 10),
                Text("Je suis etudiante motivee, passionnee par informatique et developpement mobile."),
              ],
            ),
          ),
          SizedBox(height: 20),
          Text("FORMATION", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          Card(child: ListTile(title: Text("LIC 3 LIAGE"), subtitle: Text("2026 - 2027 - Goma"))),
          Card(child: ListTile(title: Text("Diplome Etat"), subtitle: Text("MODIFIE ICI : isig, 2026-2027"))),
          SizedBox(height: 15),
          Text("EXPERIENCES", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          Card(child: ListTile(title: Text("Projet Flutter - CV Mobile"), subtitle: Text("Creation dune application CV avec Flutter"))),
          Card(child: ListTile(title: Text("Stage / Projet"), subtitle: Text("MODIFIE ICI : ton stage ou projet"))),
          SizedBox(height: 15),
          Text("COMPETENCES TECHNIQUES", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          Wrap(spacing: 8, children: [Chip(label: Text("Flutter")), Chip(label: Text("Dart")), Chip(label: Text("HTML")), Chip(label: Text("Word")), Chip(label: Text("Excel"))]),
          SizedBox(height: 15),
          Text("LANGUES", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          Card(child: ListTile(title: Text("Francais"), subtitle: Text("Tres bien"))),
          Card(child: ListTile(title: Text("Kakwa"), subtitle: Text("Langue maternelle"))),
          Card(child: ListTile(title: Text("Anglais"), subtitle: Text("Moyen"))),
          SizedBox(height: 15),
          Text("CENTRES INTERET", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          Text("jeu saxophone, Lecture, Cuisine, priere"),
        ],
      ),
    );
  }
}

class FamillePage extends StatelessWidget {
  final List<Map<String, String>> famille = [
    {"nom": "Papa", "lien": "Pere", "job": "tailleur : sa profession", "lettre": "P"},
    {"nom": "Maman", "lien": "Mere", "job": "vendeuse : sa profession", "lettre": "M"},
    {"nom": "Frere / Soeur", "lien": "Frere", "job": "eleve : sa profession", "lettre": "F"},
    {"nom": "Frere / Soeur", "lien": "Soeur", "job": "eleve : sa profession", "lettre": "S"},
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.all(12),
      itemCount: famille.length,
      itemBuilder: (context, i) {
        var m = famille[i];
        return Card(
          child: ListTile(
            leading: CircleAvatar(child: Text(m["lettre"]!)),
            title: Text(m["nom"]!),
            subtitle: Text("${m["lien"]} - ${m["job"]}"),
          ),
        );
      },
    );
  }
}

class ContactPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.all(16),
      children: [
        Card(child: ListTile(leading: Icon(Icons.phone), title: Text("Telephone"), subtitle: Text("+243 0826316823"))),
        Card(child: ListTile(leading: Icon(Icons.email), title: Text("E-mail"), subtitle: Text("esther@gmail.com"))),
        Card(child: ListTile(leading: Icon(Icons.location_on), title: Text("Adresse"), subtitle: Text("Goma, Nord-Kivu, RDC"))),
        Card(child: ListTile(leading: Icon(Icons.link), title: Text("LinkedIn"), subtitle: Text("linkedin.com/in/esther"))),
        Card(child: ListTile(leading: Icon(Icons.code), title: Text("GitHub"), subtitle: Text("github.com/esther"))),
      ],
    );
  }
}