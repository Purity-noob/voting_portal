import 'package:flutter/material.dart';

class FeedbackAndSupportPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Feedback & Support'),
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
              // Feedback & Support
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
                      'Feedback & Support',
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 10.0),
                    Text(
                      'We value your feedback and would love to hear from you! If you have any suggestions, issues, or concerns, please let us know.',
                    ),
                    SizedBox(height: 20.0),

                    // Feedback Form
                    Text(
                      'Feedback Form',
                      style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: 'Name',
                        border: OutlineInputBorder(),
                      ),
                    ),
                    SizedBox(height: 10.0),
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: 'Email',
                        border: OutlineInputBorder(),
                      ),
                    ),
                    SizedBox(height: 10.0),
                    TextFormField(
                      maxLines: 5,
                      decoration: InputDecoration(
                        labelText: 'Feedback/Issue',
                        border: OutlineInputBorder(),
                      ),
                    ),
                    SizedBox(height: 20.0),

                    // Submit Button
                    ElevatedButton(
                      onPressed: () {
                        // Implement feedback submission logic
                      },
                      child: Text('Submit'),
                    ),
                    SizedBox(height: 20.0),

                    // Support Information
                    Text(
                      'Support Information',
                      style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'If you need assistance or have questions, please contact our support team at [support@example.com](mailto:support@example.com) or call us at 555-555-5555.',
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