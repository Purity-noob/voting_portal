import 'package:flutter/material.dart';

class CandidateProfilesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Candidate Profiles'),
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
              // Candidate Profiles
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
                      'Candidate Profiles',
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 10.0),
                    // Display a list of candidate profiles
                    ListView.builder(
                      itemCount: candidates.length,
                      shrinkWrap: true,
                      physics: ClampingScrollPhysics(),
                      itemBuilder: (context, index) {
                        final candidate = candidates[index];
                        return CandidateCard(
                          bio: candidate.bio,
                          platform: candidate.platform,
                          contactInformation: candidate.contactInformation,
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
    );
  }
}

class CandidateCard extends StatelessWidget {
  final String bio;
  final String platform;
  final String contactInformation;

  CandidateCard({
    required this.bio,
    required this.platform,
    required this.contactInformation,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Bio:',
              style: TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 5.0),
            Text(bio),
            SizedBox(height: 10.0),
            Text(
              'Platform:',
              style: TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 5.0),
            Text(platform),
            SizedBox(height: 10.0),
            Text(
              'Contact Information:',
              style: TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 5.0),
            Text(contactInformation),
          ],
        ),
      ),
    );
  }
}

// Replace this with actual data from your API or database
List<Candidate> candidates = [
  Candidate(
    bio: 'Bio of Candidate 1',
    platform: 'Platform of Candidate 1',
    contactInformation: 'Contact Information of Candidate 1',
  ),
  Candidate(
    bio: 'Bio of Candidate 2',
    platform: 'Platform of Candidate 2',
    contactInformation: 'Contact Information of Candidate 2',
  ),
];

class Candidate {
  final String bio;
  final String platform;
  final String contactInformation;

  Candidate({
    required this.bio,
    required this.platform,
    required this.contactInformation,
  });
}