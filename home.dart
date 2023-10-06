import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Home(),
    debugShowCheckedModeBanner: false,
  ));
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _selectedIndex = 0;

  final List<Widget> _screens = [
    HomeContent(),
    FinishedMatchesSliderWidget(),
    LiveMatchScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_selectedIndex], // Menampilkan tampilan sesuai dengan indeks yang dipilih
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications_none),
            label: 'Notifications',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.people_outline),
            label: 'Profile',
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
      ),
    );
  }
}

class HomeContent extends StatelessWidget {
  const HomeContent({Key? key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(15, 30, 15, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Glad to see you,'),
            SizedBox(height: 15),
            Text('Ester Howard'),
            SizedBox(height: 15),
            Container(
              width: 520,
              height: 50,
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(15),
              ),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(15, 10, 15, 15),
                child: Row(
                  children: [
                    Icon(
                      Icons.search_rounded,
                      color: Color(0xffA7A6A6),
                    ),
                    SizedBox(width: 10),
                    Text('Find your favorite club'),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(8, 8, 8, 0),
              child: Row(
                children: [
                  Image.asset(
                    'assets/live.png',
                    width: 20,
                    height: 20,
                    fit: BoxFit.contain,
                  ),
                  SizedBox(width: 15),
                  Text('Live Match'),
                ],
              ),
            ),
            SizedBox(height: 10),
            Container(
              width: 400,
              height: 155,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
              ),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Premiere League'),
                        Text('78°'),
                      ],
                    ),
                    SizedBox(height: 15),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Image.asset('assets/AR-B.png'),
                        Text('2 : 0'),
                        Image.asset('assets/CH-B.png'),
                      ],
                    ),
                    SizedBox(height: 9),
                    Center(
                      child: Container(
                        width: 70,
                        height: 40,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(25),
                          border: Border.all(color: Color(0xff76F13C), width: 2),
                        ),
                        child: Center(child: Text('Live')),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            // Tambahkan judul "Finished Match" di sini
            Text(
              'Finished Match',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            FinishedMatchesSliderWidget(),
          ],
        ),
      ),
    );
  }
}

class FinishedMatchesSliderWidget extends StatelessWidget {
  const FinishedMatchesSliderWidget({Key? key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 200,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            MatchContainer(
              homeLogoUrl: 'assets/Jv-B.png',
              awayLogoUrl: 'assets/P-B.png',
              score: '1 - 0',
              matchTitle: 'Skor Liga Champions',
              time: 'Yesterday',
            ),
            MatchContainer(
              homeLogoUrl: 'assets/M-B.png',
              awayLogoUrl: 'assets/BVB-B.png',
              score: '0 - 2',
              matchTitle: 'League B',
              time: '15 July 2020',
            ),
          ],
        ),
      ),
    );
  }
}

class MatchContainer extends StatelessWidget {
  final String homeLogoUrl;
  final String awayLogoUrl;
  final String score;
  final String matchTitle;
  final String time;

  MatchContainer({
    required this.homeLogoUrl,
    required this.awayLogoUrl,
    required this.score,
    required this.matchTitle,
    required this.time,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 250,
      height: 100,
      margin: EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        children: [
          Text(matchTitle, style: TextStyle(fontWeight: FontWeight.bold)),
          Text(time),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                children: [
                  Image.asset(homeLogoUrl),
                  SizedBox(width: 8),
                  Text(score),
                  SizedBox(width: 8),
                  Image.asset(awayLogoUrl),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class LiveMatchScreen extends StatelessWidget {
  const LiveMatchScreen({Key? key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Live Match Screen'),
    );
  }
}
