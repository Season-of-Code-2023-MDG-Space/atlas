import 'package:flutter/material.dart';
import 'atlas_doct.dart' as doct;
import 'atlas_doctprof.dart' as doctprof;
import 'atlas_seco.dart' as seco;
import 'package:integrating_atlas/text_recog/camera_search.dart' as cam;
import 'main.dart' as main;
import 'medicine_search_result.dart' as res;

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: Column(children: [
        Flexible(
          child: MyHomePage(),
        )
      ]),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0; // use this in ur backend later on
  /*static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOptions = <Widget>[
    Text(
      'Index 0: Home',
      style: optionStyle,
    ),
    Text(
      'Index 1: Business',
      style: optionStyle,
    ),
    Text(
      'Index 2: School',
      style: optionStyle,
    ),
  ];
  */
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight),
        child: Container(
          height: 200.0,
          decoration: new BoxDecoration(
            color: Colors.orange,
            boxShadow: [new BoxShadow(blurRadius: 40.0)],
            borderRadius: new BorderRadius.vertical(
                bottom: new Radius.elliptical(
                    MediaQuery.of(context).size.width, 100.0)),
          ),
          child: AppBar(
            leading: IconButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => cam.App()));
                },
                icon: Icon(Icons.camera_alt_rounded)),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(
                bottom: Radius.circular(30),
              ),
            ),
            title: const Text(
              'Search a medicine',
            ),
            actions: [
              //for the search option
              IconButton(
                onPressed: () {
                  showSearch(
                      context: context, delegate: CustomSearchDelegate());
                },
                icon: const Icon(Icons.search),
              )
            ],
          ),
        ),
      ),

      /* body: Center( //after backend 
        child: _widgetOptions.elementAt(_selectedIndex),
      ), */

      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.green,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: IconButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => seco.New()));
                },
                icon: Icon(Icons.local_hospital_rounded)),
            /* Icon(Icons.local_hospital_rounded), */
            label: 'Hospital',
          ),
          BottomNavigationBarItem(
            icon: IconButton(onPressed: null, icon: Icon(Icons.search)),
            label: 'Search Medicine',
          ),
          BottomNavigationBarItem(
            icon: IconButton(onPressed: null, icon: Icon(Icons.person)),
            label: 'Uploads',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      ),
    );
  }
}

class CustomSearchDelegate extends SearchDelegate {
  List<String> searchTerms = [
    'Paracetamol',
    'Ocurest-AH',
    'Relu Ds',
  ];

// first overwrite to
// clear the search text
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () {
          query = '';
        },
        icon: Icon(Icons.clear),
      ),
    ];
  }

// second overwrite to pop out of search menu
  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {
        close(context, null);
      },
      icon: Icon(Icons.arrow_back),
    );
  }

// third overwrite to show query result
  @override
  Widget buildResults(BuildContext context) {
    List<String> matchQuery = [];
    for (var hospital in searchTerms) {
      if (hospital.toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(hospital);
      }
    }
    return ListView.builder(
      itemCount: matchQuery.length,
      itemBuilder: (context, index) {
        var result = matchQuery[index];
        return ListTile(
          title: Text(result),
          onTap: () {
            if (result == 'Paracetamol') {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => res.MyApp()));
            }
          },
        );
      },
    );
  }

// last overwrite to show the
// querying process at the runtime
  @override
  Widget buildSuggestions(BuildContext context) {
    List<String> matchQuery = [];
    for (var hospital in searchTerms) {
      if (hospital.toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(hospital);
      }
    }
    return ListView.builder(
      itemCount: matchQuery.length,
      itemBuilder: (context, index) {
        var result = matchQuery[index];
        return ListTile(
          title: Text(result),
          onTap: () {
            if (result == 'Paracetamol') {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => res.MyApp()));
            }
          },
        );
      },
    );
  }
}
