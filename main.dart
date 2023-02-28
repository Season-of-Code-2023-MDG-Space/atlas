import 'package:flutter/material.dart';

void main() {
  runApp(const New());
}

int followers = 5443;

class New extends StatelessWidget {
  const New({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.green,
        primaryColor: Colors.white,
      ),

      home: Flexible(
        child: MyHomePage(),
      ),

      //threecol(), // this is the one i added which is cozing the problem i was expecting the profile at the top then three column division like in
      //https://stackoverflow.com/questions/61616336/i-want-to-divide-my-row-into-1-4-ratio-in-flutter but it is cozing pixel oveflow
      //done for avoiding error in Media Query
      /* builder: (context, child) {
        return const threecol();
      }, */
      debugShowCheckedModeBanner: false,
    );
  }
}

class threecol extends StatefulWidget {
  threecol({super.key});

  @override
  State<threecol> createState() => _threecolState();
}

class _threecolState extends State<threecol> {
  int _selectedIndex = 0;
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          FittedBox(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20.0), //or 15.0
              child: Container(
                alignment: Alignment.center,
                height: MediaQuery.of(context).size.height * 0.4,
                width: MediaQuery.of(context).size.width,
                child: _FakedImage(),
              ),
            ),
          ),
          MyApp(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.green,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.local_hospital_rounded),
            label: 'Hospital',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search Medicine',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Your Profile',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      ), //added the bottom navigation bar here for proper formatting
    );
  }
}

/* class Update {
  //modal class for Person object
  String update, timing;

  Update({
    required this.update,
    required this.timing,
  });
} */

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.3,
      child: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(8, 10, 0, 10),
            child: Container(
              decoration: const BoxDecoration(
                color: Color(0xFFffffff),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey,
                    blurRadius: 15.0, // soften the shadow
                    spreadRadius: 5.0, //extend the shadow
                    offset: Offset(
                      5.0, // Move to right 5  horizontally
                      5.0, // Move to bottom 5 Vertically
                    ),
                  )
                ],
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20.0), //or 15.0
                child: SizedBox(
                  height: MediaQuery.of(context).size.height * 0.1,
                  child: Column(
                    children: <Widget>[
                      Expanded(
                        child: Text(
                          textAlign: TextAlign.start,
                          "Dr Pawan is going to be absent tommorrow",
                          style: TextStyle(
                            fontFamily: 'BebasNeue',
                            fontSize: 20.0,
                            fontWeight: FontWeight.normal,
                            letterSpacing: 2.0,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment(0.95, 0.95),
                        child: Text(
                          "11:10 am",
                          style: TextStyle(
                            fontFamily: 'BebasNeue',
                            fontSize: 20.0,
                            fontWeight: FontWeight.normal,
                            letterSpacing: 2.0,
                            color: Colors.black,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),

          Padding(
            padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
            child: Container(
              decoration: const BoxDecoration(
                color: Color(0xFFffffff),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey,
                    blurRadius: 15.0, // soften the shadow
                    spreadRadius: 5.0, //extend the shadow
                    offset: Offset(
                      5.0, // Move to right 5  horizontally
                      5.0, // Move to bottom 5 Vertically
                    ),
                  )
                ],
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20.0), //or 15.0
                child: SizedBox(
                  height: MediaQuery.of(context).size.height * 0.1,
                  child: Column(
                    children: <Widget>[
                      Expanded(
                        child: Text(
                          textAlign: TextAlign.start,
                          "New Dentistry Department added",
                          style: TextStyle(
                            fontFamily: 'BebasNeue',
                            fontSize: 20.0,
                            fontWeight: FontWeight.normal,
                            letterSpacing: 2.0,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment(0.95, 0.95),
                        child: Text(
                          "1:10 pm",
                          style: TextStyle(
                            fontFamily: 'BebasNeue',
                            fontSize: 20.0,
                            fontWeight: FontWeight.normal,
                            letterSpacing: 2.0,
                            color: Colors.black,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),

          //add more eleemnts here
        ],
      ),
    );
  }
}

class _FakedImage extends StatefulWidget {
  _FakedImage();

  @override
  State<_FakedImage> createState() => _FakedImageState();
}

class _FakedImageState extends State<_FakedImage> {
  String college = 'IIT Roorkee Hospital';

  String address = 'Haridwar ,Roorkee';

  int visitors = 12003;

  @override
  Widget build(BuildContext context) {
    return Center(

        // Set constraints as if it were a 400x400 image
        child: Stack(
      children: <Widget>[
        Image.asset('images/iitr.jfif',
            fit: BoxFit.fill,
            height: MediaQuery.of(context).size.height * 0.4,
            width: MediaQuery.of(context).size.width,
            //scale: 2.5,
            // color: Color.fromARGB(255, 15, 147, 59),
            opacity: const AlwaysStoppedAnimation<double>(0.5)), //Image.asset
        // Image.asset
        CircleAvatar(
          radius: 72,
          backgroundColor: Colors.black,
          child: CircleAvatar(
            radius: 70.0,
            backgroundImage: AssetImage('images/iitrh.jfif'),
          ),
        ),

        Container(
          height: MediaQuery.of(context).size.height * 0.2,
          width: MediaQuery.of(context).size.width,
          alignment: Alignment(0.8, 0.0),
          child: Text(
            '$college, \n $address ',
            style: TextStyle(
              fontFamily: 'Pacifico',
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
              letterSpacing: 2.0,
              color: Colors.white,
            ),
          ),
        ),

        Container(
          alignment: Alignment(-0.8, 0.8),
          child: SizedBox(
            width: MediaQuery.of(context).size.width * 0.6,
            height: MediaQuery.of(context).size.height * 0.1,
            child: ListTile(
              title: Text(
                'Followers',
                style: TextStyle(
                  fontFamily: 'BebasNeue',
                  fontSize: 30.0,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 2.0,
                  color: Colors.white,
                ),
              ),
              subtitle: Text(
                '$followers',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: 'BebasNeue',
                  fontSize: 25.0,
                  fontWeight: FontWeight.normal,
                  letterSpacing: 2.0,
                  color: Colors.black,
                ),
              ),
              trailing: Container(
                width: 50,
                height: 50,
                color: Colors.green,
                child: Follow(),
              ),
            ),
          ),
        ),

        Container(
            alignment: Alignment(0.8, 0.8),
            child: RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                text: 'Visitors  \n',
                style: TextStyle(
                  fontFamily: 'BebasNeue',
                  fontSize: 30.0,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 2.0,
                  color: Colors.white,
                ),
                children: <TextSpan>[
                  TextSpan(
                    text: '$visitors',
                    style: TextStyle(
                      fontFamily: 'BebasNeue',
                      fontSize: 25.0,
                      fontWeight: FontWeight.normal,
                      letterSpacing: 2.0,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            )),
      ],
    ));
  }
}

class Follow extends StatefulWidget {
  const Follow({super.key});

  @override
  State<Follow> createState() => _FollowState();
}

class _FollowState extends State<Follow> {
  @override
  Widget build(BuildContext context) {
    bool? followed = true;
    return Container(
        child: IconButton(
      onPressed: () {
        if (followed == true) {
          setState(() {
            followed = false;
            followers -= 1;
          });
        } else if (followed == false) {
          setState(() {
            followed = true;
            followers += 1;
          });
        }
      },
      icon: followed
          ? Icon(
              Icons.person_add,
              color: Colors.white,
            )
          : Icon(Icons.check, color: Colors.white),
    ));
  }
}

// Atul's home page code below

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // use this in ur backend later on
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Search a hospital',
        ),
        leading: IconButton(
          //for the settings option
          onPressed: () {},
          icon: const Icon(
            Icons.menu,
            color: Colors.black,
          ),
        ),
        actions: [
          //for the search option
          IconButton(
            onPressed: () {
              showSearch(context: context, delegate: CustomSearchDelegate());
            },
            icon: const Icon(Icons.search),
          )
        ],
      ),
      body:
          threecol(), //this is where i added my class to integrate with atul's home page
      /* body: Center( //after backend 
        child: _widgetOptions.elementAt(_selectedIndex),
      ), */
    );
  }
}

class CustomSearchDelegate extends SearchDelegate {
  List<String> searchTerms = [
    'IIT Roorkee Hospital',
    'AIIMS Delhi',
    'Apollo Roorkee',
    'Apollo Delhi'
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
        );
      },
    );
  }
}

/* return Draggable(                    //use this code for swiping left and right after backend implementation
      //childWhenDragging: *insert next page*
      onDragEnd: (drag) {
        if (drag.velocity.pixelsPerSecond.dx < 0) {
          print('Seiped l');
        } else {
          print('Swiped r');
        }
      },
      feedback: Flexible(
        child: Scaffold(
            backgroundColor: Colors.white,
            body: SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.all(10),
                child: Column(
                  children: persons.map((personone) {
                    return Container(
                      color: Colors.green,
                      child: Card(
                        child: ListTile(
                          tileColor: Colors.green,
                          title: Text(personone.name),
                          subtitle: Text(
                              personone.profession + "\n" + personone.timing),
                          leading: Container(
                            width: 50,
                            height: 50,
                            color: Colors.black,
                            child: Follow(),
                          ),
                          trailing: Checkbox(
                            onChanged: (newValue) => setState(
                                () => personone.avalaibility = newValue),
                            value: personone.avalaibility,
                          ),
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ),
            )),
      ),
      child: Flexible(
        child: Scaffold(
            backgroundColor: Colors.white,
            body: SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.all(10),
                child: Column(
                  children: persons.map((personone) {
                    return Container(
                      color: Colors.green,
                      child: Card(
                        child: ListTile(
                          tileColor: Colors.green,
                          title: Text(personone.name),
                          subtitle: Text(
                              personone.profession + "\n" + personone.timing),
                          leading: Container(
                            width: 50,
                            height: 50,
                            color: Colors.black,
                            child: Follow(),
                          ),
                          trailing: Checkbox(
                            onChanged: (newValue) => setState(
                                () => personone.avalaibility = newValue),
                            value: personone.avalaibility,
                          ),
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ),
            )),
      ),
    ); */
