import 'package:flutter/material.dart';


import '../../../services/firebase_functions/firebase_functions.dart';

class UserInteractions extends StatelessWidget {
  const UserInteractions({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<String>?>(
      future: FirestoreDatabase().getInteractionIds(),
      builder: (BuildContext context, AsyncSnapshot<List<String>?> snapshot) {
        final List<String>? idList = snapshot.data;
        return ListView.builder(
            itemCount: idList?.length ?? 0,
            itemBuilder: (BuildContext context, int index) => ListTile(
                  title: Text('User: ${idList?[index]}'),
                  subtitle: FutureBuilder<int?>(
                    future: FirestoreDatabase()
                        .getInteractionCount(idList?[index] ?? ''),
                    builder:
                        (BuildContext context, AsyncSnapshot<int?> snapshot) {
                      return Text('${snapshot.data ?? 0} users');
                    },
                  ),
                ));
      },
    );
  }
}
