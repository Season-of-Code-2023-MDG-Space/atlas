import 'package:flutter/material.dart';

void main() {
  runApp(const New());
}

class New extends StatelessWidget {
  const New({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: Colors.greenAccent,
      ),

      home: threecol(),
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
  bool? avalaibility;
  Person(
      {required this.sno,
      required this.name,
      required this.profession,
      required this.timing,
      required this.avalaibility});
}

class threecol extends StatelessWidget {
  threecol({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green,
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
        timing: "8 am- 1 pm",
        avalaibility: false));

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Flexible(
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
                        trailing: Checkbox(
                          onChanged: (newValue) =>
                              setState(() => personone.avalaibility = newValue),
                          value: personone.avalaibility,
                        ),
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

class _FakedImage extends StatelessWidget {
  String college = 'IIT Roorkee Hospital';
  String address = 'Haridwar ,Roorkee';
  int followers = 5443;
  int visitors = 12003;
  _FakedImage();

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
            child: RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                text: 'Followers  \n',
                style: TextStyle(
                  fontFamily: 'BebasNeue',
                  fontSize: 30.0,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 2.0,
                  color: Colors.white,
                ),
                children: <TextSpan>[
                  TextSpan(
                    text: '$followers',
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

/* Expanded(
            child: Row(
              children: <Widget>[
                Flexible(
                  flex: 1,
                   child: Container(
                    height: MediaQuery.of(context).size.height * 0.6,
                    width: MediaQuery.of(context).size.width / 3,
                    /* child: ClipRRect(
                      borderRadius: BorderRadius.circular(30.0),
                      child: Container(
                        alignment: Alignment.center,
                        height: MediaQuery.of(context).size.height * 0.05,
                        color: Colors.black,
                      ),
                    ),  */
                     child: Divider(
                      indent: 15,
                      endIndent: 15,
                      color: Colors.black,
                      height: 20000,
                      thickness: 10,
                    ),  
                    decoration: BoxDecoration(color: Colors.greenAccent),
                  ),
                ),
                Flexible(
                  flex: 1,
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.6,
                    width: MediaQuery.of(context).size.width / 3,
                    child: Divider(
                      indent: 15,
                      endIndent: 15,
                      
                      color: Color.fromARGB(255, 67, 65, 65),
                      height: 20000,
                      thickness: 10,
                    ),
                    decoration: BoxDecoration(color: Colors.yellow),
                  ),
                ),
                Flexible(
                  flex: 1,
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.6,
                    width: MediaQuery.of(context).size.width / 3,
                    child: Divider(
                      indent: 15,
                      endIndent: 15,
                      color: Color.fromARGB(255, 67, 65, 65),
                      height: 20000,
                      thickness: 10,
                    ),
                    decoration: BoxDecoration(color: Colors.blue),
                  ),
        ),
        ],
          ),
    ), */
/* FittedBox(
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20.0), //or 15.0
            child: Container(
              alignment: Alignment.center,
              height: MediaQuery.of(context).size.height * 0.4,
              width: MediaQuery.of(context).size.width,
              child: _FakedImage(),
            ),}
          ),
        )); */
/* Container(
          padding: const EdgeInsets.all(20),
          child: Row(
            children: <Widget>[
              Flexible(
                flex: 1,
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.05,
                  width: MediaQuery.of(context).size.width * 0.25,
                  decoration: BoxDecoration(color: Colors.greenAccent),
                ),
              ),
              Flexible(
                flex: 1,
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.05,
                  width: MediaQuery.of(context).size.width * 0.25,
                  decoration: BoxDecoration(color: Colors.yellow),
                ),
              ),
              Flexible(
                flex: 1,
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.05,
                  width: MediaQuery.of(context).size.width * 0.25,
                  decoration: BoxDecoration(color: Colors.blue),
                ),
              ),
            ],
          ),
        ), */

/* class Profile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.green,
        body: FittedBox(
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20.0), //or 15.0
            child: Container(
              alignment: Alignment.center,
              height: MediaQuery.of(context).size.height * 0.4,
              width: MediaQuery.of(context).size.width,
              child: const _FakedImage(),
            ),
          ),
        ));
  }
} */