import 'package:firebase_database/firebase_database.dart';
import 'package:voting_portal/ongoing_elections.dart';

class ElectionService {
  final FirebaseDatabase _database = FirebaseDatabase.instance;

  Future<List<OngoingElection>> fetchElections() async {
    try {
      final ref = _database.ref().child('elections');
      final snapshot = await ref.get();

      if (snapshot.value == null) {
        return [];
      }

      final elections = <OngoingElection>[];
      final data = snapshot.value as Map<dynamic, dynamic>;

      data.forEach((key, value) {
        try {
          final election = OngoingElection(
            title: value['title'],
            date: DateTime.parse(value['date']),
            candidates: List<String>.from(value['candidates']),
            votingInstructions: value['votingInstructions'],
          );
          elections.add(election);
        } catch (e) {
          print('Invalid election data format: $e');
        }
      });

      return elections;
    } catch (e) {
      print('Error fetching elections: $e');
      return [];
    }
  }
}
