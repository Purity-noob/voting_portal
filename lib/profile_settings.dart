// ignore_for_file: unused_local_variable

import 'package:flutter/material.dart';

class ProfileSettingsPage extends StatefulWidget {
  @override
  // ignore: library_private_types_in_public_api
  _ProfileSettingsPageState createState() => _ProfileSettingsPageState();
}

class _ProfileSettingsPageState extends State<ProfileSettingsPage> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _currentPasswordController = TextEditingController();
  final _newPasswordController = TextEditingController();
  final _receiveElectionReminders = ValueNotifier<bool>(true);
  final _receiveUpdatesOnResults = ValueNotifier<bool>(true);

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _currentPasswordController.dispose();
    _newPasswordController.dispose();
    _receiveElectionReminders.dispose();
    _receiveUpdatesOnResults.dispose();
    super.dispose();
  }

  void _updateProfile() {
    if (_formKey.currentState!.validate()) {
      // Save profile information and notification preferences
      final name = _nameController.text;
      final email = _emailController.text;
      final currentPassword = _currentPasswordController.text;
      final newPassword = _newPasswordController.text;
      final receiveElectionReminders = _receiveElectionReminders.value;
      final receiveUpdatesOnResults = _receiveUpdatesOnResults.value;

      // Implement the logic to save the data
      // For example, make a network request to update the user's profile

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Profile updated successfully!')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile Settings'),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.blue.shade400, Colors.blue.shade900],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: ListView(
          padding: EdgeInsets.all(16.0),
          children: [
            Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  // Profile Information
                  Container(
                    padding: EdgeInsets.all(16.0),
                    margin: EdgeInsets.only(bottom: 20.0),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.8),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Profile Information',
                          style: TextStyle(
                            fontSize: 22.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 20.0),
                        TextFormField(
                          controller: _nameController,
                          decoration: InputDecoration(
                            labelText: 'Name',
                            border: OutlineInputBorder(),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your name';
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: 20.0),
                        TextFormField(
                          controller: _emailController,
                          decoration: InputDecoration(
                            labelText: 'Email',
                            border: OutlineInputBorder(),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your email';
                            }
                            if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                              return 'Please enter a valid email address';
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: 20.0),
                        TextFormField(
                          controller: _currentPasswordController,
                          obscureText: true,
                          decoration: InputDecoration(
                            labelText: 'Current Password',
                            border: OutlineInputBorder(),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your current password';
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: 20.0),
                        TextFormField(
                          controller: _newPasswordController,
                          obscureText: true,
                          decoration: InputDecoration(
                            labelText: 'New Password',
                            border: OutlineInputBorder(),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter a new password';
                            }
                            if (value.length < 8) {
                              return 'Password must be at least 8 characters long';
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: 30.0),
                        ElevatedButton(
                          onPressed: _updateProfile,
                          // ignore: sort_child_properties_last
                          child: Text('Update Password'),
                          style: ElevatedButton.styleFrom(
                            padding: EdgeInsets.symmetric(vertical: 16.0),
                            textStyle: TextStyle(fontSize: 16.0),
                          ),
                        ),
                      ],
                    ),
                  ),

                  // Notification Preferences
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
                          'Notification Preferences',
                          style: TextStyle(
                            fontSize: 22.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 20.0),
                        ValueListenableBuilder<bool>(
                          valueListenable: _receiveElectionReminders,
                          builder: (context, value, child) {
                            return SwitchListTile(
                              title: Text('Receive election reminders'),
                              value: value,
                              onChanged: (newValue) {
                                _receiveElectionReminders.value = newValue;
                              },
                            );
                          },
                        ),
                        ValueListenableBuilder<bool>(
                          valueListenable: _receiveUpdatesOnResults,
                          builder: (context, value, child) {
                            return SwitchListTile(
                              title: Text('Receive updates on election results'),
                              value: value,
                              onChanged: (newValue) {
                                _receiveUpdatesOnResults.value = newValue;
                              },
                            );
                          },
                        ),
                      ],
                    ),
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
