import 'main.dart' as main;
import 'package:flutter/material.dart';
import 'atlas_doct.dart' as doct;
import 'atlas_doctprof.dart' as doctprof;
import 'atlas_seco.dart' as seco;
import 'globals.dart';
import 'searchmed.dart' as med;

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      //this one
      onVerticalDragUpdate: (details) {
        if (details.delta.direction > 0) {
          Navigator.of(context).pop();
        }
      },
      child: MaterialApp(
        theme: ThemeData(
          primarySwatch: Colors.green,
        ),
        home: Column(children: [
          Flexible(
            child: MyHomePage(),
          )
        ]),
        debugShowCheckedModeBanner: false,
      ),
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
    double deviceHeight(BuildContext context) =>
        MediaQuery.of(context).size.height;
    double deviceWidth(BuildContext context) =>
        MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          FittedBox(
            //or 15.0
            child: Container(
              alignment: Alignment.center,
              height: MediaQuery.of(context).size.height * 0.4,
              width: MediaQuery.of(context).size.width,
              child: _FakedImage(),
            ),
          ),
          Row(
            children: [
              Padding(
                padding: EdgeInsets.only(
                    left: deviceWidth(context) * 0.05,
                    right: deviceWidth(context) * 0.05),
                child: Material(
                  shape: Border(
                    bottom: BorderSide(
                      width: 2.5,
                      color: Colors.black,
                    ),
                  ),
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.4,
                    height: MediaQuery.of(context).size.height * 0.05,
                    decoration: const BoxDecoration(
                      color: Color(0xFFffffff),
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey,
                          blurRadius: 5.0, // soften the shadow
                          spreadRadius: 2.5, //extend the shadow

                          offset: Offset(
                            5.0, // Move to right 5  horizontally
                            5.0, // Move to bottom 5 Vertically
                          ),
                        )
                      ],
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10.0),
                      child: Center(
                        child: Text(
                          'Profile',
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                    right: deviceWidth(context) * 0.05,
                    left: deviceWidth(context) * 0.05),
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.4,
                  height: MediaQuery.of(context).size.height * 0.05,
                  decoration: const BoxDecoration(
                    color: Color(0xFFffffff),
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey,
                        blurRadius: 5.0, // soften the shadow
                        spreadRadius: 2.5, //extend the shadow
                        offset: Offset(
                          5.0, // Move to right 5  horizontally
                          5.0, // Move to bottom 5 Vertically
                        ),
                      )
                    ],
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10.0),
                    child: Center(
                      child: Text(
                        'Notifications',
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          Mylist(),
        ],
      ),

      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.green,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: IconButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => main.MyApp()));
                },
                icon: Icon(Icons.local_hospital_rounded)),
            /* Icon(Icons.local_hospital_rounded), */
            label: 'Hospital',
          ),
          BottomNavigationBarItem(
            icon: IconButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => med.MyApp()));
                },
                icon: Icon(Icons.search)),
            label: 'Search Medicine',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Uploads',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      ), //added the bottom navigation bar here for proper formatting
    );
  }
}

class Mylist extends StatelessWidget {
  const Mylist({super.key});

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
                borderRadius: BorderRadius.all(Radius.circular(15)),
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
                          "Works at IIT Roorkee Hospital from 8 am - 1 pm",
                          style: TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.normal,
                            color: Colors.black,
                          ),
                        ),
                      ),
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
                borderRadius: BorderRadius.all(Radius.circular(15)),
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
                          "Works at Roorkee Laboratory from 2 pm - 5 pm",
                          style: TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.normal,
                            color: Colors.black,
                          ),
                        ),
                      ),
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
  String doctor = 'Dr Hari Prasad Chaudhary';
  String specialization = 'Physician';
  String degree = 'MBBS , MD';

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
                            child: Container(
                              alignment: Alignment(0.4, 0.4),
                              height: MediaQuery.of(context).size.height * 0.2,
                              width: MediaQuery.of(context).size.width * 0.25,
                              decoration: BoxDecoration(
                                  border:
                                      Border.all(width: 2, color: Colors.black),
                                  image: DecorationImage(
                                      image: AssetImage('images/doc.jpg'),
                                      fit: BoxFit.cover)),
                            ),
                          ),
                          //nono
                          Text(
                            '$doctor, \n Degree:$degree, \n Specialization:$specialization',
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
                              title: FittedBox(
                                fit: BoxFit.scaleDown,
                                child: RichText(
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
                                        text: '$docfollowers',
                                        style: TextStyle(
                                          fontSize: 20.0,
                                          fontWeight: FontWeight.normal,
                                          color: Colors.black,
                                        ),
                                      ),
                                    ],
                                  ),
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
                                    docfollowed = !docfollowed;
                                    if (docfollowed) {
                                      docfollowers += 1;
                                    } else
                                      docfollowers -= 1;
                                  });
                                },
                                child: AnimatedContainer(
                                    height: MediaQuery.of(context).size.height *
                                        0.1,
                                    width:
                                        MediaQuery.of(context).size.width * 0.2,
                                    duration: Duration(milliseconds: 300),
                                    decoration: BoxDecoration(
                                        color: docfollowed
                                            ? Colors.green[700]
                                            : Color(0xffffff),
                                        borderRadius: BorderRadius.circular(5),
                                        border: Border.all(
                                          color: docfollowed
                                              ? Colors.transparent
                                              : Colors.grey.shade700,
                                        )),
                                    child: Center(
                                        child: Text(
                                            docfollowed ? 'Unfollow' : 'Follow',
                                            style: TextStyle(
                                                color: docfollowed
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
                                      text: '$docvisitors',
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

/* class Follow extends StatefulWidget {
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
 */
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
      drawer: NavDrawer(),
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
      body: threecol(),
    );
  }
}

class NavDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            child: Text(
              'Atlas',
              style: TextStyle(color: Colors.white, fontSize: 25),
            ),
            decoration: BoxDecoration(
              color: Colors.green,
              /* image: DecorationImage(
                    fit: BoxFit.fill,
                    image: AssetImage('images/cover.jpg')) */
            ),
          ),
          ListTile(
            leading: Icon(Icons.verified_user),
            title: Text('Profile'),
            onTap: () => {Navigator.of(context).pop()},
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text('Settings'),
            onTap: () => {Navigator.of(context).pop()},
          ),
          ListTile(
            leading: Icon(Icons.border_color),
            title: Text('Feedback'),
            onTap: () => {Navigator.of(context).pop()},
          ),
          ListTile(
            leading: Icon(Icons.exit_to_app),
            title: Text('Logout'),
            onTap: () => {Navigator.of(context).pop()},
          ),
        ],
      ),
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
          onTap: () {
            if (result == 'IIT Roorkee Hospital') {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => seco.New()));
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
            if (result == 'IIT Roorkee Hospital') {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => seco.New()));
            }
          },
        );
      },
    );
  }
}


/* Container(
            alignment: Alignment(0.4, 0.4),
            height: MediaQuery.of(context).size.height * 0.2,
            width: MediaQuery.of(context).size.width * 0.25,
            decoration: BoxDecoration(
                border: Border.all(width: 2, color: Colors.black),
                image: DecorationImage(
                    image: AssetImage(
                        'images/portrait-happy-young-handsome-indian-man-doctor-smiling-studio-shot-against-white-background-137823661.jpg'),
                    fit: BoxFit.cover)),
          ),

          Container(
            height: MediaQuery.of(context).size.height * 0.2,
            width: MediaQuery.of(context).size.width,
            alignment: Alignment(0.8, 0.0),
            child: Text(
              '$doctor, \n Degree:$degree, \n Specialization:$specialization',
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ), */