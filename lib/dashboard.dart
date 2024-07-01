import 'package:flutter/material.dart';
import 'home.dart';
import 'upcoming_elections.dart';
import 'ongoing_elections.dart';
import 'candidate_profiles.dart';
import 'voting_options.dart';
import 'election_results.dart';
import 'educational_resources.dart';
import 'feedback_and_support.dart';
import 'community_engagement.dart';
import 'profile_settings.dart';

void main() {
  runApp(MaterialApp(
    home: DashboardPage(),
  ));
}

class DashboardPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Campus Voting Portal'),
      ),
      body: Row(
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.blue.shade400, Colors.blue.shade900],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
              child: SingleChildScrollView(
                padding: EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    // Welcome Message
                    Text(
                      'Welcome to the Campus Voting Portal!',
                      style: TextStyle(
                        fontSize: 24.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 20.0),

                    // Navigation Menu
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.8),
                        borderRadius: BorderRadius.circular(8.0),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 2,
                            blurRadius: 5,
                            offset: Offset(0, 3),
                          ),
                        ],
                      ),
                      child: Column(
                        children: [
                          ListTile(
                            leading: Icon(Icons.home),
                            title: Text('Home'),
                            onTap: () {
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(builder: (context) => HomePage()),
                              );
                            },
                          ),
                          ListTile(
                            leading: Icon(Icons.event),
                            title: Text('Upcoming Elections'),
                            onTap: () {
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(builder: (context) => UpcomingElectionsPage()),
                              );
                            },
                          ),
                          ListTile(
                            leading: Icon(Icons.timer),
                            title: Text('Ongoing Elections'),
                            onTap: () {
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(builder: (context) => OngoingElectionsPage()),
                              );
                            },
                          ),
                          ListTile(
                            leading: Icon(Icons.person),
                            title: Text('Candidate Profiles'),
                            onTap: () {
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(builder: (context) => CandidateProfilesPage()),
                              );
                            },
                          ),
                          ListTile(
                            leading: Icon(Icons.ballot),
                            title: Text('Voting Options'),
                            onTap: () {
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(builder: (context) => VotingOptionsPage()),
                              );
                            },
                          ),
                          ListTile(
                            leading: Icon(Icons.ballot),
                            title: Text('Election Results'),
                            onTap: () {
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(builder: (context) => ElectionResultsPage(votes: {},)),
                              );
                            },
                          ),
                          ListTile(
                            leading: Icon(Icons.school),
                            title: Text('Educational Resources'),
                            onTap: () {
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(builder: (context) => EducationalResourcesPage()),
                              );
                            },
                          ),
                          ListTile(
                            leading: Icon(Icons.feedback),
                            title: Text('Feedback & Support'),
                            onTap: () {
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(builder: (context) => FeedbackAndSupportPage()),
                              );
                            },
                          ),
                          ListTile(
                            leading: Icon(Icons.people),
                            title: Text('Community Engagement'),
                            onTap: () {
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(builder: (context) => CommunityEngagementPage()),
                              );
                            },
                          ),
                          ListTile(
                            leading: Icon(Icons.settings),
                            title: Text('Profile Settings'),
                            onTap: () {
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(builder: (context) => ProfileSettingsPage()),
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          // Election cards or other content
        ],
      ),
    );
  }
}