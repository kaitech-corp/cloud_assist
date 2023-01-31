import 'package:flutter/material.dart';
import 'package:styled_widget/styled_widget.dart';

Widget serviceDetailCard(Widget child) => Styled.widget(child: child)
    .padding(all: 10)
    .decorated(
      color: Colors.white54,
      borderRadius: BorderRadius.circular(10),
    )
    .elevation(10);

Widget card(Widget child) => Styled.widget(child: child)
    .padding(all: 30)
    .decorated(
      color: Colors.white70,
      borderRadius: BorderRadius.circular(10),
    )
    .elevation(10);

Widget funFactCard(Widget child) => Styled.widget(child: child)
    .padding(all: 30)
    .decorated(
      color: Colors.amber,
      borderRadius: const BorderRadius.all(Radius.circular(30)),
    )
    .card(
        elevation: 10,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ));
