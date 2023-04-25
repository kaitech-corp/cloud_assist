import 'package:fade_shimmer/fade_shimmer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nil/nil.dart';

import '../../bloc/authentication_bloc/authentication_bloc.dart';
import '../../bloc/authentication_bloc/authentication_event.dart';
import '../../models/user_model/user_model.dart';
import '../../services/constants.dart';
import '../../services/firebase_functions/cloud_functions.dart';
import '../../services/firebase_functions/firebase_functions.dart';
import '../../services/functions.dart';
import '../../services/navigation/navigation.dart';
import '../../services/ui/text_styles.dart';
import 'components/network_image_fallback.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  SettingsPageState createState() => SettingsPageState();
}

class SettingsPageState extends State<SettingsPage> {
  Future<void> _showDeactivateAccountDialog() async {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Deactivate Account'),
          content: SingleChildScrollView(
            child: ListBody(
              children: const <Widget>[
                Text('Are you sure you want to deactivate this account?'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text('Deactivate'),
              onPressed: () {
                // Handle account deactivation here.
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                children: [
                  Expanded(
                    child: Text(
                      'Settings',
                      style: headlineSmall(context),
                    ),
                  ),
                  IconButton(
                      onPressed: () {
                        BlocProvider.of<AuthenticationBloc>(context)
                            .add(AuthenticationLoggedOut());
                      },
                      icon: const Icon(Icons.exit_to_app))
                ],
              ),
              Expanded(
                child: FutureBuilder<UserModel>(
                  future: FirestoreDatabase().getProfileData(),
                  builder: (BuildContext context,
                      AsyncSnapshot<UserModel> snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return ListView.builder(
                        itemCount: 3,
                        itemBuilder: (BuildContext context, int index) {
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 8.0, top: 32, bottom: 32),
                                child: FadeShimmer(
                                  height: 8,
                                  width: MediaQuery.of(context).size.width * .4,
                                  radius: 4,
                                  highlightColor: Colors.white,
                                  baseColor: Theme.of(context).disabledColor,
                                ),
                              ),
                              Container(height: 2, color: Colors.grey[400]),
                            ],
                          );
                        },
                      );
                    }

                    if (snapshot.hasError || !snapshot.hasData) {
                      return Column(
                        children: const <Widget>[
                          Text('No data found'),
                        ],
                      );
                    }

                    final UserModel profileData = snapshot.data!;
                    final String? date = formatDate(profileData.dateCreated);

                    return ListView(
                      padding: const EdgeInsets.all(16.0),
                      children: <Widget>[
                        CircularImageWidget(
                            imageUrl: profileData.photoURL,
                            assetImage: cloudLogo,
                            radius: 50), // or any desired aspect ratio

                        const SizedBox(height: 16),
                        Text(
                          'Email: ${profileData.email}',
                          style: titleMedium(context),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          'Date Joined: $date',
                          style: titleMedium(context),
                        ),
                        const SizedBox(height: 8),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text(
                              'Paid Account',
                              style: titleMedium(context),
                            ),
                            Checkbox(
                              value: profileData.paid,
                              onChanged: (bool? value) {},
                            ),
                          ],
                        ),
                        const SizedBox(height: 16),
                        ElevatedButton(
                          onPressed: _showDeactivateAccountDialog,
                          child: Text(
                            'Deactivate Account',
                            style: titleMedium(context),
                          ),
                        ),
                        const SizedBox(height: 16),
                        FutureBuilder<dynamic>(
                            future: CloudFunctions().checkUserId(),
                            builder: (BuildContext context,
                                AsyncSnapshot<dynamic?> snapshot) {
                              if (snapshot.hasData) {
                                final bool isAdmin = snapshot.data as bool;
                                if (isAdmin) {
                                  return ElevatedButton(
                                    onPressed: () {
                                      router.pushNamed('admin');
                                    },
                                    child: Text(
                                      'Admin Dashboard',
                                      style: titleMedium(context),
                                    ),
                                  );
                                } else {
                                  return nil;
                                }
                              } else {
                                return nil;
                              }
                            })
                      ],
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
