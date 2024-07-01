import 'package:flutter/material.dart';

class ElectionResultsPage extends StatelessWidget {
  final Map<String, Map<String, int>> votes;

  ElectionResultsPage({required this.votes});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Election Results'),
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
                      'Election Results',
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 10.0),
                    ListView.builder(
                      itemCount: votes.length,
                      shrinkWrap: true,
                      physics: ClampingScrollPhysics(),
                      itemBuilder: (context, index) {
                        final electionTitle = votes.keys.elementAt(index);
                        final electionVotes = votes[electionTitle]!;
                        final winner = electionVotes.entries
                            .reduce((a, b) => a.value > b.value ? a : b)
                            .key;
                        final totalVotes = electionVotes.values.reduce((a, b) => a + b);
                        final turnout = (totalVotes / electionVotes.length) * 100;

                        return ElectionResultCard(
                          electionName: electionTitle,
                          winner: winner,
                          voteCount: totalVotes,
                          turnout: turnout,
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

class ElectionResultCard extends StatelessWidget {
  final String electionName;
  final String winner;
  final int voteCount;
  final double turnout;

  ElectionResultCard({
    required this.electionName,
    required this.winner,
    required this.voteCount,
    required this.turnout,
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
              electionName,
              style: TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 5.0),
            Text(
              'Winner: $winner',
            ),
            SizedBox(height: 5.0),
            Text(
              'Vote Count: $voteCount',
            ),
            SizedBox(height: 5.0),
            Text(
              'Turnout: ${turnout.toStringAsFixed(2)}%',
            ),
          ],
        ),
      ),
    );
  }
}
