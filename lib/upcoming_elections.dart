import 'package:flutter/material.dart';

class UpcomingElectionsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Upcoming Elections'),
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
              // Upcoming Elections
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
                      'Upcoming Elections',
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 10.0),
                    // Display a list of upcoming elections with details
                    ListView.builder(
                      itemCount: upcomingElections.length,
                      shrinkWrap: true,
                      physics: ClampingScrollPhysics(),
                      itemBuilder: (context, index) {
                        final election = upcomingElections[index];
                        return ElectionCard(
                          title: election.title,
                          date: election.date,
                          candidates: election.candidates,
                          votingInstructions: election.votingInstructions,
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

class ElectionCard extends StatelessWidget {
  final String title;
  final DateTime date;
  final List<String> candidates;
  final String votingInstructions;

  ElectionCard({
    required this.title,
    required this.date,
    required this.candidates,
    required this.votingInstructions,
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
              title,
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10.0),
            Text(
              'Date: ${date.day}/${date.month}/${date.year}',
              style: TextStyle(
                fontSize: 14.0,
              ),
            ),
            SizedBox(height: 10.0),
            Text(
              'Candidates:',
              style: TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 5.0),
           ...candidates.map((candidate) => Text(candidate)).toList(),
            SizedBox(height: 10.0),
            Text(
              'Voting Instructions:',
              style: TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 5.0),
            Text(votingInstructions),
          ],
        ),
      ),
    );
  }
}

// Replace this with actual data from your API or database
List<Election> upcomingElections = [
  Election(
    title: 'Election 1',
    date: DateTime(2024, 6, 12),
    candidates: ['Candidate 1', 'Candidate 2'],
    votingInstructions: 'Instructions for voting in Election 1',
  ),
  Election(
    title: 'Election 2',
    date: DateTime(2024, 7, 10),
    candidates: ['Candidate 3', 'Candidate 4'],
    votingInstructions: 'Instructions for voting in Election 2',
  ),
];

class Election {
  final String title;
  final DateTime date;
  final List<String> candidates;
  final String votingInstructions;

  Election({
    required this.title,
    required this.date,
    required this.candidates,
    required this.votingInstructions,
  });
}