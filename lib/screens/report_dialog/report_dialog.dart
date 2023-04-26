import 'package:flutter/material.dart';

import '../../models/report_content_model/report_content_model.dart';
import '../../services/firebase_functions/firebase_functions.dart';
import '../../services/ui/text_styles.dart';

class ReportDialog extends StatefulWidget {
  const ReportDialog(
      {super.key, required this.content, required this.contentDocID, this.contentField});
  final String content;
  final String contentDocID;
  final String? contentField;

  @override
  ReportDialogState createState() => ReportDialogState();
}

class ReportDialogState extends State<ReportDialog> {
  ReportType? _selectedType;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Report Content'),
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Text(widget.content,maxLines: 10,overflow: TextOverflow.ellipsis,),
          const SizedBox(height: 20),
          const Text('Report this text as:'),
          RadioListTile<ReportType>(
            title: Text(
              'Outdated',
              style: titleMedium(context),
            ),
            value: ReportType.outdated,
            groupValue: _selectedType,
            onChanged: (ReportType? value) {
              setState(() {
                _selectedType = value;
              });
            },
          ),
          RadioListTile<ReportType>(
            title: Text(
              'Inaccurate',
              style: titleMedium(context),
            ),
            value: ReportType.inaccurate,
            groupValue: _selectedType,
            onChanged: (ReportType? value) {
              setState(() {
                _selectedType = value;
              });
            },
          ),
          RadioListTile<ReportType>(
            title: Text(
              'Incomplete',
              style: titleMedium(context),
            ),
            value: ReportType.incomplete,
            groupValue: _selectedType,
            onChanged: (ReportType? value) {
              setState(() {
                _selectedType = value;
              });
            },
          ),
          RadioListTile<ReportType>(
            title: Text(
              'Irrelevant',
              style: titleMedium(context),
            ),
            value: ReportType.irrelevant,
            groupValue: _selectedType,
            onChanged: (ReportType? value) {
              setState(() {
                _selectedType = value;
              });
            },
          ),
          RadioListTile<ReportType>(
            title: Text(
              'Inappropriate',
              style: titleMedium(context),
            ),
            value: ReportType.inappropriate,
            groupValue: _selectedType,
            onChanged: (ReportType? value) {
              setState(() {
                _selectedType = value;
              });
            },
          ),
        ],
      ),
      actions: <Widget>[
        TextButton(
          child: Text(
            'Cancel',
            style: titleSmall(context),
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        TextButton(
          onPressed: _selectedType == null
              ? null
              : () {
                  FirestoreDatabase().reportContent(
                  ReportContent(
                      content: widget.content,
                      reportType: _selectedType.toString(),
                      contentDocID: widget.contentDocID,
                      contentField: widget.contentField));
                  Navigator.pop(context);
                },
          child: Text(
            'Report',
            style: titleSmall(context),
          ),
        ),
      ],
    );
  }
}
