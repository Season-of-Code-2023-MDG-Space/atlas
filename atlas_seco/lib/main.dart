import 'package:flutter/material.dart';

/* things yet to add
1)sliding feature(sliding and going to next page)
2)Follow button feature(i.e if i press follow button the number of followers will change  which i tried but couldn't implement)
3)those slide lines which darken on sliding
 */
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
        primaryColor: Colors.greenAccent,
        fontFamily: 'PlayfairDisplay',
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

class Person {
  //modal class for Person object
  String sno, name, profession, timing;
  bool? availablity;
  Icon ICON;
  Person(
      {required this.sno,
      required this.name,
      required this.profession,
      required this.ICON,
      required this.timing,
      required this.availablity});
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
            child: Container(
              alignment: Alignment.center,
              height: MediaQuery.of(context).size.height * 0.4,
              width: MediaQuery.of(context).size.width,
              child: _FakedImage(),
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

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<Person> persons = [];

  @override
  void initState() {
    //adding item to list, you can add using json from network
    persons.add(Person(
        sno: "1",
        name: "Hari Prasad Chaudhary",
        profession: "Cardiologist",
        ICON: Icon(
          Icons.favorite,
        ),
        timing: "8 am- 1 pm",
        availablity: false));

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Scaffold(
          backgroundColor: Colors.white,
          body: SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.all(5),
              child: Column(
                children: persons.map((personone) {
                  return ClipRRect(
                    borderRadius: BorderRadius.circular(30.0),
                    child: Container(
                      color: Colors.green,
                      child: Card(
                        child: ListTile(
                            tileColor: Colors.green,
                            title: FittedBox(
                              fit: BoxFit.scaleDown,
                              alignment: Alignment.centerLeft,
                              child: Text(
                                personone.name,
                                style: TextStyle(fontSize: 18),
                              ),
                            ),
                            subtitle: FittedBox(
                              fit: BoxFit.scaleDown,
                              alignment: Alignment.centerLeft,
                              child: RichText(
                                text: TextSpan(
                                  children: [
                                    TextSpan(text: personone.profession),
                                    WidgetSpan(
                                      child: Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 2.0),
                                          child: personone.ICON),
                                    ),
                                    TextSpan(text: '\n' + personone.timing),
                                  ],
                                ),
                              ),
                            ),
                            leading: Container(
                              width: MediaQuery.of(context).size.width * 0.1,
                              height: MediaQuery.of(context).size.height * 0.1,
                              color: Colors.black,
                              child: Follow(),
                            ),
                            trailing: Column(
                              children: [
                                FittedBox(
                                  fit: BoxFit.scaleDown,
                                  child: Container(
                                    child: Text(
                                      'Availability:',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 10,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ),
                                Flexible(
                                  child: Checkbox(
                                    onChanged: (newValue) => setState(
                                        () => personone.availablity = newValue),
                                    value: personone.availablity,
                                  ),
                                ),
                              ],
                            )),
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),
          )),
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
  bool followed = false;
  @override
  Widget build(BuildContext context) {
    double deviceHeight(BuildContext context) =>
        MediaQuery.of(context).size.height;
    double deviceWidth(BuildContext context) =>
        MediaQuery.of(context).size.width;

    return Center(

        // Set constraints as if it were a 400x400 image
        child: ClipRRect(
      borderRadius: BorderRadius.only(
          bottomRight: Radius.circular(30), bottomLeft: Radius.circular(30)),
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
          Container(
            height: MediaQuery.of(context).size.height * 0.4,
            width: MediaQuery.of(context).size.width,
            child: FittedBox(
              fit: BoxFit.scaleDown,
              child: Column(
                children: [
                  FittedBox(
                    fit: BoxFit.scaleDown,
                    child: Padding(
                      padding:
                          EdgeInsets.only(bottom: deviceHeight(context) * 0.05),
                      child: Row(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(
                                right: deviceWidth(context) * 0.1,
                                left: deviceWidth(context) * 0.1),
                            child: CircleAvatar(
                              radius: MediaQuery.of(context).size.width * 0.155,
                              backgroundColor: Colors.black,
                              child: CircleAvatar(
                                radius:
                                    MediaQuery.of(context).size.width * 0.15,
                                backgroundImage:
                                    AssetImage('images/iitrh.jfif'),
                              ),
                            ),
                          ),
                          Text(
                            '$college, \n $address ',
                            style: TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  FittedBox(
                    fit: BoxFit.scaleDown,
                    child: Row(
                      children: [
                        Container(
                          alignment: Alignment(-0.8, 0.8),
                          child: SizedBox(
                            width: MediaQuery.of(context).size.width * 0.6,
                            height: MediaQuery.of(context).size.height * 0.1,
                            child: ListTile(
                              title: RichText(
                                textAlign: TextAlign.center,
                                text: TextSpan(
                                  text: 'Followers  \n',
                                  style: TextStyle(
                                    fontSize: 24.0,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                  children: <TextSpan>[
                                    TextSpan(
                                      text: '$followers',
                                      style: TextStyle(
                                        fontSize: 20.0,
                                        fontWeight: FontWeight.normal,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ],
                                ),
                              ),

                              /*  Text(
                                'Followers',
                                style: TextStyle(
                                  
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
                                  
                                  fontSize: 25.0,
                                  fontWeight: FontWeight.normal,
                                  letterSpacing: 2.0,
                                  color: Colors.black,
                                ),
                              ), */
                              trailing: GestureDetector(
                                onTap: () {
                                  setState(() {
                                    followed = !followed;
                                    if (followed) {
                                      followers -= 1;
                                    } else
                                      followers += 1;
                                  });
                                },
                                child: AnimatedContainer(
                                    height: 35,
                                    width: 110,
                                    duration: Duration(milliseconds: 300),
                                    decoration: BoxDecoration(
                                        color: followed
                                            ? Colors.green[700]
                                            : Color(0xffffff),
                                        borderRadius: BorderRadius.circular(5),
                                        border: Border.all(
                                          color: followed
                                              ? Colors.transparent
                                              : Colors.grey.shade700,
                                        )),
                                    child: Center(
                                        child: Text(
                                            followed ? 'Unfollow' : 'Follow',
                                            style: TextStyle(
                                                color: followed
                                                    ? Colors.white
                                                    : Colors.white)))),
                              ),
                            ),
                          ),
                        ),
                        Container(
                            alignment: Alignment(0.8, 0.8),
                            child: SizedBox(
                              width: MediaQuery.of(context).size.width * 0.4,
                              height: MediaQuery.of(context).size.height * 0.1,
                              child: RichText(
                                textAlign: TextAlign.center,
                                text: TextSpan(
                                  text: 'Visitors  \n',
                                  style: TextStyle(
                                    fontSize: 24.0,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                  children: <TextSpan>[
                                    TextSpan(
                                      text: '$visitors',
                                      style: TextStyle(
                                        fontSize: 20.0,
                                        fontWeight: FontWeight.normal,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            )),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
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
          ? FittedBox(
              fit: BoxFit.scaleDown,
              child: Icon(
                Icons.person_add,
                color: Colors.white,
              ),
            )
          : FittedBox(
              fit: BoxFit.scaleDown,
              child: Icon(Icons.check, color: Colors.white)),
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
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(
                bottom: Radius.circular(30),
              ),
            ),
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
                  showSearch(
                      context: context, delegate: CustomSearchDelegate());
                },
                icon: const Icon(Icons.search),
              )
            ],
          ),
        ),
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
                                () => personone.availablity = newValue),
                            value: personone.availablity,
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
                                () => personone.availablity = newValue),
                            value: personone.availablity,
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
