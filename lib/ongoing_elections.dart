import 'package:flutter/material.dart';
import 'package:voting_portal/election_results.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: OngoingElectionsPage(),
    );
  }
}

class OngoingElectionsPage extends StatefulWidget {
  @override
  // ignore: library_private_types_in_public_api
  _OngoingElectionsPageState createState() => _OngoingElectionsPageState();
}

class _OngoingElectionsPageState extends State<OngoingElectionsPage> {
  // State to track votes
  Map<String, Map<String, int>> votes = {};
  // State to track which elections have been voted in
  Set<String> votedElections = {};

  @override
  void initState() {
    super.initState();
    // Initialize votes state
    for (var election in ongoingElections) {
      votes[election.title] = {};
      for (var candidate in election.candidates) {
        votes[election.title]![candidate] = 0;
      }
    }
  }

  // Method to cast a vote
  void castVote(String electionTitle, String candidate) {
    if (!votedElections.contains(electionTitle)) {
      setState(() {
        votes[electionTitle]![candidate] = votes[electionTitle]![candidate]! + 1;
        votedElections.add(electionTitle);
      });
    }
  }

  // Method to navigate to ElectionResultsPage
  void navigateToResults() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ElectionResultsPage(votes: votes),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ongoing Elections'),
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
                      'Ongoing Elections',
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 10.0),
                    ListView.builder(
                      itemCount: ongoingElections.length,
                      shrinkWrap: true,
                      physics: ClampingScrollPhysics(),
                      itemBuilder: (context, index) {
                        final election = ongoingElections[index];
                        final hasVoted = votedElections.contains(election.title);
                        return ElectionCard(
                          title: election.title,
                          date: election.date,
                          candidates: election.candidates,
                          votingInstructions: election.votingInstructions,
                          onVote: (candidate) {
                            castVote(election.title, candidate);
                          },
                          voteCounts: votes[election.title]!,
                          hasVoted: hasVoted,
                        );
                      },
                    ),
                    SizedBox(height: 20.0),
                    ElevatedButton(
                      onPressed: navigateToResults,
                      child: Text('View Results'),
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
  final Function(String) onVote;
  final Map<String, int> voteCounts;
  final bool hasVoted;

  ElectionCard({
    required this.title,
    required this.date,
    required this.candidates,
    required this.votingInstructions,
    required this.onVote,
    required this.voteCounts,
    required this.hasVoted,
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
            Column(
              children: candidates.map((candidate) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(candidate),
                    Text('Votes: ${voteCounts[candidate]}'),
                    ElevatedButton(
                      onPressed: hasVoted ? null : () => onVote(candidate),
                      child: Text('Vote'),
                    ),
                  ],
                );
              }).toList(),
            ),
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
List<OngoingElection> ongoingElections = [
  OngoingElection(
    title: 'Election 1',
    date: DateTime(2024, 6, 12),
    candidates: ['Candidate 1', 'Candidate 2'],
    votingInstructions: 'Instructions for voting in Election 1',
  ),
  OngoingElection(
    title: 'Election 2',
    date: DateTime(2024, 7, 10),
    candidates: ['Candidate 3', 'Candidate 4'],
    votingInstructions: 'Instructions for voting in Election 2',
  ),
];

class OngoingElection {
  final String title;
  final DateTime date;
  final List<String> candidates;
  final String votingInstructions;

  OngoingElection({
    required this.title,
    required this.date,
    required this.candidates,
    required this.votingInstructions,
  });
}
