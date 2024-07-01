import 'package:flutter/material.dart';

class EducationalResourcesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Educational Resources'),
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
              // Educational Resources
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
                      'Educational Resources',
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 10.0),
                    // Display educational resources, such as voter guides, election FAQs, and civic engagement materials
                    Text(
                      'ALL IN Challenge - Campus Engagement Resources',
                      style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'The ALL IN Campus Democracy Challenge (ALL IN) has comprised a collection of resources created by the ALL IN team and partner organizations within the Students Learn Students Vote Coalition to support campuses with nonpartisan engagement efforts.',
                    ),
                    SizedBox(height: 10.0),
                    Text(
                      'Civic Learning',
                      style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'Action Planning Resource Page: Tools for crafting a campus democratic engagement action plan.',
                    ),
                    Text(
                      'Action Plan Submission Link: Utilize this form to submit your campus’ democratic engagement action plan.',
                    ),
                    Text(
                      'Project Pericles’ Civic Engagement Resources: Resources for faculty, across all disciplines, who are interested in civic engagement course syllabi, community-engaged learning, deliberative dialogue, nonpartisan voter education, and addressing voter suppression.',
                    ),
                    Text(
                      'Voter Friendly Campus Designation: Information on how your campus can earn the VFC designation.',
                    ),
                    Text(
                      'Nonpartisan Messaging Toolkit for Faculty & Administrators: Designed to help faculty and administrators integrate nonpartisan ideas, processes, templates, and support for sharing voter information with students.',
                    ),
                    Text(
                      'ALL IN Nonpartisan Student Voting Group Report: In 2021, the ALL IN Campus Democracy Challenge (ALL IN), started a process to learn more about nonpartisan voter engagement efforts and surveyed to learn how many of nonpartisan student voting groups existed, to what extent they are supported by their institutions, and what strategies, tactics, and ideas they use to engage their student body in this report.',
                    ),
                    SizedBox(height: 10.0),
                    Text(
                      'Political Engagement',
                      style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'ALL IN to Vote: For information on voter registration, making a plan to vote, researching your ballot, becoming a poll worker, and more.',
                    ),
                    // Add more educational resources here
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
