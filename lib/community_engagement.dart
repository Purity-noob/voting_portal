import 'package:flutter/material.dart';
class CommunityEngagementPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Community Engagement'),
      ),
      body: Container(
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
              // Community Engagement Opportunities
              Container(
                padding: EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.8),
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Community Engagement Opportunities',
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 10.0),
                    Text(
                      'Get involved in the campus community and make your voice heard!',
                    ),
                    SizedBox(height: 20.0),

                    // Discussion Forums
                    ListTile(
                      leading: Icon(Icons.forum),
                      title: Text('Discussion Forums'),
                      onTap: () {
                        // Navigate to the discussion forums page
                      },
                    ),

                    // Social Media Groups
                    ListTile(
                      leading: Icon(Icons.group),
                      title: Text('Social Media Groups'),
                      onTap: () {
                        // Navigate to the social media groups page
                      },
                    ),

                    // Volunteer Opportunities
                    ListTile(
                      leading: Icon(Icons.volunteer_activism),
                      title: Text('Volunteer Opportunities'),
                      onTap: () {
                        // Navigate to the volunteer opportunities page
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}