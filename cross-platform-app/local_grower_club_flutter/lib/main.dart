import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';


//Entry Point
void main() {
  //Debug
  runApp(const GrowerApp());
}

//Root Widget
class GrowerApp extends StatelessWidget {
  const GrowerApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Local Grower Club',
      theme: ThemeData
      (
        textTheme: TextTheme
        (
          headlineLarge: GoogleFonts.roboto
          (
            fontWeight: FontWeight.w900,
            fontSize: 32,
            color: const Color.fromARGB(255, 46, 78, 62)
          ),
          headlineMedium: GoogleFonts.roboto
          (
            fontWeight: FontWeight.bold,
            fontSize: 24,
            color: const Color.fromARGB(255, 46, 78, 62)
          ),
          labelMedium: GoogleFonts.roboto
          (
            fontWeight: FontWeight.bold,
            fontSize: 14,
            color: const Color.fromARGB(255, 235, 242, 250)
          ),
          labelLarge: GoogleFonts.roboto
          (
            fontWeight: FontWeight.bold,
            fontSize: 18,
            color: const Color.fromARGB(255, 235, 242, 250)
          ),
          bodyMedium: GoogleFonts.roboto
          (
            fontWeight: FontWeight.normal,
            fontSize: 16,
            color: const Color.fromARGB(255, 46, 78, 62)
          ),
        ),
        bottomAppBarTheme: const BottomAppBarTheme
        (
          color: Color.fromARGB(255, 62, 122, 80)
        ),
        tabBarTheme: TabBarTheme
        (
          unselectedLabelColor: const Color.fromARGB(255, 131, 153, 126),
          labelColor: const Color.fromARGB(255, 235, 242, 250),
          labelStyle: GoogleFonts.roboto
          (
            fontSize: 13,
          ),
          unselectedLabelStyle: GoogleFonts.roboto
          (
            fontSize: 13,
          )
        ),
        textButtonTheme: TextButtonThemeData
        (
          style: ButtonStyle
          (
            foregroundColor: const MaterialStatePropertyAll(Color.fromARGB(255, 217, 240, 222)),       //Text Color
            backgroundColor: const MaterialStatePropertyAll(Color.fromARGB(255, 62, 122, 80)),
            shape: MaterialStatePropertyAll
            (
              RoundedRectangleBorder
              (
                borderRadius: BorderRadius.circular(20)
              )
            )
          ) 
        ),
        
      ),
      home: const HomePage(),
    );
  }
}

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return const BottomAppBar(
      child: TabBar(
        indicatorColor: Colors.transparent,
        indicator: null,
        dividerColor: Colors.transparent,
        tabs: <Widget>[
          Tab(
            text: "Ankündigungen",
            icon: Icon(Icons.message_outlined),
          ),
          Tab(text: "Angebot", icon: Icon(Icons.menu_book_outlined)),
          Tab(text: "Account", icon: Icon(Icons.account_circle_outlined)),
        ],
      ),
    );
  }
}
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 1,
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Text
          (
            'Local Grower Club',
            style: Theme.of(context).textTheme.headlineLarge,
          ),
        ),
        body: TabBarView(
          children: <Widget>[
            const Center( //Announcement Page
              child: Text("Übersicht von bevorstehenden Events"),
            ),
            const Center( //Offer Page
              child: Text("Pflanzen Angebot"),
            ),
            Center( //Account Page
              child: Container
              (
                padding: const EdgeInsets.only(left: 50, right: 50),
                child: Column
                (
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: 
                  [
                    Text //Title
                    (
                      "Vorab Anmelden",
                      style: Theme.of(context).textTheme.headlineMedium,
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 8),
                    const Text //Body: using bodyMedium theme
                    (
                      "Momentan ist der Local Grower Club noch in Gründung. Sie können sich jedoch jetzt schon registrieren um auf die Warteliste gesetzt zu werden. Wir benachrichtigen Sie dann sobald der Club offiziell öffnet.",
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 50),
                    TextButton
                    (
                    onPressed: () 
                    {
                      Navigator.of(context).push(PageRouteBuilder(
                          opaque: false,
                          pageBuilder: (BuildContext context, _, __) =>
                              const SignUpOverlay()));
                    },

                    style: const ButtonStyle
                    (
                      minimumSize: MaterialStatePropertyAll(
                        Size
                        (
                          165, 55
                        )
                      )
                    ).merge
                    (
                        TextButtonTheme.of(context).style
                    ),

                    child: Text
                    (
                      'Registrieren', 
                      style: Theme.of(context).textTheme.labelLarge
                    ),
                  ),
                    const SizedBox(height: 10), //Spacing
                    TextButton
                    (
                      onPressed: () {
                        Navigator.of(context).push(PageRouteBuilder(
                            opaque: false,
                            pageBuilder: (BuildContext context, _, __) =>
                                const SignUpOverlay()));
                      },
                      style: const ButtonStyle
                      (
                        minimumSize: MaterialStatePropertyAll(
                          Size
                          (
                            165, 55
                          )
                        )
                      ).merge
                      (
                          TextButtonTheme.of(context).style
                      ),
                      child: Text
                      (
                        'Anmelden', 
                        style: Theme.of(context).textTheme.labelLarge
                      ),
                    ),
                  ],
                )
              )
            )
          ],
        ),
        bottomNavigationBar: const ClipRRect(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(15), topRight: Radius.circular(15)),
          child: BottomNavBar(),
        ),
      ),
    );
  }
}
class SignUpOverlay extends StatefulWidget {
  const SignUpOverlay({super.key});

  @override
  State<SignUpOverlay> createState() => _SignUpState();
}
class _SignUpState extends State<SignUpOverlay> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text
        (
          "Registrieren",
          style: Theme.of(context).textTheme.headlineMedium,
        ),
      ),
      body: Container
      (
        padding: const EdgeInsets.only(left: 50, right: 50),
        child: Column
        (
          mainAxisAlignment: MainAxisAlignment.center,
          children: 
          [

            TextField
            (
              cursorColor: const Color.fromARGB(255, 217, 240, 222),
              keyboardType: TextInputType.name,
              decoration: InputDecoration
              (
                fillColor: const Color.fromARGB(255, 62, 122, 80),
                filled: true,
                
                hintText: "Vorname...",
                hintStyle: Theme.of(context).textTheme.bodyMedium?.merge
                (
                  const TextStyle
                  (
                    color:Color.fromARGB(160, 235, 242, 250),
                    fontStyle: FontStyle.italic
                  )
                ),
                enabledBorder: OutlineInputBorder
                (
                  borderRadius: BorderRadius.circular(15),
                  borderSide: const BorderSide
                  (
                    strokeAlign: BorderSide.strokeAlignInside,
                    width: 2,
                    color: Color.fromARGB(255, 46, 78, 62),
                  )
                ),
                focusedBorder: OutlineInputBorder
                (
                  borderRadius: BorderRadius.circular(15),
                  borderSide: const BorderSide
                  (
                    strokeAlign: BorderSide.strokeAlignInside,
                    width: 3,
                    color: Color.fromARGB(255, 161, 232, 135),
                  )
                ),
              ),
            ),
            const SizedBox(height: 10),
            TextField
            (
              cursorColor: const Color.fromARGB(255, 217, 240, 222),
              keyboardType: TextInputType.name,
              decoration: InputDecoration
              (
                fillColor: const Color.fromARGB(255, 62, 122, 80),
                filled: true,
                
                hintText: "Nachname...",
                hintStyle: Theme.of(context).textTheme.bodyMedium?.merge
                (
                  const TextStyle
                  (
                    color:Color.fromARGB(160, 235, 242, 250),
                    fontStyle: FontStyle.italic
                  )
                ),
                enabledBorder: OutlineInputBorder
                (
                  borderRadius: BorderRadius.circular(15),
                  borderSide: const BorderSide
                  (
                    strokeAlign: BorderSide.strokeAlignInside,
                    width: 2,
                    color: Color.fromARGB(255, 46, 78, 62),
                  )
                ),
                focusedBorder: OutlineInputBorder
                (
                  borderRadius: BorderRadius.circular(15),
                  borderSide: const BorderSide
                  (
                    strokeAlign: BorderSide.strokeAlignInside,
                    width: 3,
                    color: Color.fromARGB(255, 161, 232, 135),
                  )
                ),
              ),
            ),
            const SizedBox(height: 30),
            TextButton
            (
              onPressed: (){}, 
              style: const ButtonStyle
              (
                minimumSize: MaterialStatePropertyAll(
                  Size
                  (
                    165, 55
                  )
                )
              ).merge
              (
                  TextButtonTheme.of(context).style
              ),
              child: Text
              (
                "Weiter",
                style: Theme.of(context).textTheme.labelLarge,
              ),
            )
          ],
        ),
      )
    );
  }
}
