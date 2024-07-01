import 'package:flutter/material.dart';
import 'package:voting_portal/candidate_profiles.dart';
import 'package:voting_portal/upcoming_elections.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Campus Voting Portal'),
        backgroundColor: Colors.blue.shade400, // Set app bar color
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Hero Section
            Container(
              height: 200,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/home_hero.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Make Your Voice Heard',
                    style: TextStyle(
                      fontSize: 36,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 59, 75, 218),
                    ),
                  ),
                  Text(
                    'Exercise your right to vote and shape the future of your campus',
                    style: TextStyle(
                      fontSize: 18,
                      color: Color.fromARGB(255, 59, 75, 218),
                    ),
                  ),
                ],
              ),
            ),

// Upcoming Elections Section
Container(
  padding: EdgeInsets.all(16),
  decoration: BoxDecoration(
    gradient: LinearGradient(
      colors: [Colors.blue.shade400, Colors.blue.shade900],
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
    ),
    borderRadius: BorderRadius.circular(10),
  ),
  child: Column(
    children: [
      Text(
        'Upcoming Elections',
        style: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
      SizedBox(height: 10),
      ListView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemCount: 3,
        itemBuilder: (context, index) {
          return Card(
            color: Colors.blue.shade100, // Set card background color
            child: ListTile(
              title: Text('Election ${index + 1}'),
              subtitle: Text('Date: ${DateTime.now().add(Duration(days: index + 1)).toString()}'),
              trailing: ElevatedButton(
                // ignore: sort_child_properties_last
                child: Text('Learn More'),
                onPressed: () {
                  // Navigate to election details page
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => UpcomingElectionsPage()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue.shade400, // Set button color
                ),
              ),
            ),
          );
        },
      ),
    ],
  ),
),
  // Featured Candidates Section
Container(
  padding: EdgeInsets.all(16),
  decoration: BoxDecoration(
    gradient: LinearGradient(
      colors: [Colors.blue.shade400, Colors.blue.shade900],
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
    ),
    borderRadius: BorderRadius.circular(10),
  ),
  child: Column(
    children: [
      Text(
        'Featured Candidates',
        style: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
      SizedBox(height: 10),
      ListView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemCount: 3,
        itemBuilder: (context, index) {
          return Card(
            color: Colors.blue.shade100, // Set card background color
            child: ListTile(
              leading: CircleAvatar(
                backgroundImage: AssetImage('assets/candidate_${index + 1}.jpg'),
              ),
              title: Text('Candidate ${index + 1}'),
              subtitle: Text('Profile: ${index + 1}'),
              trailing: ElevatedButton(
                // ignore: sort_child_properties_last
                child: Text('View Profile'),
                onPressed: () {
                  // Navigate to candidate profile page
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => CandidateProfilesPage()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue.shade400, // Set button color
                ),
              ),
            ),
          );
        },
      ),
    ],
  ),
),
            // Voting Tips Section
            Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.blue.shade400, Colors.blue.shade900],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                children: [
                  Text(
                    'Voting Tips',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 10),
                  ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: 3,
                    itemBuilder: (context, index) {
                      return Card(
                        color: Colors.blue.shade100,// Set card background color
                        child: ListTile(
                          leading: Icon(Icons.check),
                          title: Text('Tip ${index + 1}'),
                          subtitle: Text('Description ${index + 1}'),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}