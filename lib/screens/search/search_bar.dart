import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:nil/nil.dart';

import '../../bloc/generics/generic_bloc.dart';
import '../../bloc/generics/generic_state.dart';
import '../../bloc/generics/generics_event.dart';
import '../../models/cloud_data_model/cloud_data_model.dart';
import '../../repositories/cloud_data_repository.dart';
import '../../services/constants.dart';
import '../../services/firebase_functions/firebase_functions.dart';

class SearchBar extends StatefulWidget {
  const SearchBar({super.key, this.recentResults});
  final List<CloudData>? recentResults;

  @override
  SearchBarState createState() => SearchBarState();
}

class SearchBarState extends State<SearchBar> {
  TextEditingController _controller = TextEditingController();
  List<CloudData> _results = <CloudData>[];
  bool _isSearching = false;
  late GenericBloc<CloudData, CloudDataRepository> bloc;

  @override
  void initState() {
    bloc =
        BlocProvider.of<GenericBloc<CloudData, CloudDataRepository>>(context);
    bloc.add(LoadingGenericData());
    _controller = TextEditingController();
    RealTimeDatabase().saveUserInteraction(
        featureId: FeatureID.search.toString(),
        startTime: true,
        endTime: false);
    super.initState();
  }

  @override
  void dispose() {
    bloc.close();
    _controller.dispose();
    RealTimeDatabase().saveUserInteraction(
        featureId: FeatureID.search.toString(),
        startTime: false,
        endTime: true);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: BlocBuilder<GenericBloc<CloudData, CloudDataRepository>,
                GenericState>(
              builder: (BuildContext context, GenericState state) {
                if (state is LoadingState) {
                  return Column(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: AnimatedContainer(
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.easeInOut,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30.0),
                            color: Colors.grey[300],
                          ),
                          child: Row(
                            children: <Widget>[
                              const Padding(
                                padding: EdgeInsets.only(left: 8.0),
                                child: Icon(Icons.search),
                              ),
                              Expanded(
                                child: TextField(
                                  controller: _controller,
                                  decoration: const InputDecoration(
                                    hintText:
                                        'Searching database just a moment.',
                                    border: InputBorder.none,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  );
                } else if (state is HasDataState) {
                  final List<CloudData> data = state.data as List<CloudData>;
                  return Column(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: AnimatedContainer(
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.easeInOut,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30.0),
                            color: Colors.grey[300],
                          ),
                          child: Row(
                            children: <Widget>[
                              const Padding(
                                padding: EdgeInsets.only(left: 8.0),
                                child: Icon(Icons.search),
                              ),
                              Expanded(
                                child: TextField(
                                  controller: _controller,
                                  onChanged: (String value) async {
                                    if (value.length >= 2) {
                                      setState(() {
                                        _isSearching = true;
                                      });
                                      final List<CloudData> results = data;
                                      setState(() {
                                        try {
                                          _results = results
                                              .where((CloudData result) =>
                                                  result.service
                                                      .toLowerCase()
                                                      .contains(_controller.text
                                                          .toLowerCase()))
                                              .toList();
                                        } catch (e) {
                                          if (kDebugMode) {
                                            print(e);
                                          }
                                        }
                                      });
                                    } else {
                                      setState(() {
                                        _isSearching = false;
                                      });
                                    }
                                  },
                                  onSubmitted: (String value) async {
                                    final List<CloudData> results = data;
                                    try {
                                      // ignore: no_leading_underscores_for_local_identifiers
                                      final CloudData _result = results
                                          .where((CloudData result) => result
                                              .service
                                              .toLowerCase()
                                              .contains(value.toLowerCase()))
                                          .first;
                                      context.goNamed('serviceDetails',
                                          extra: _result);
                                      RealTimeDatabase().saveUserInteraction(
                                          serviceId: _result.service,
                                          featureId:
                                              FeatureID.search.toString(),
                                          startTime: true,
                                          endTime: false);
                                    } catch (e) {
                                      if (kDebugMode) {
                                        print(e);
                                      }
                                    }
                                  },
                                  decoration: const InputDecoration(
                                    hintText: 'Search',
                                    border: InputBorder.none,
                                  ),
                                ),
                              ),
                              if (_isSearching)
                                IconButton(
                                  icon: const Icon(Icons.cancel),
                                  onPressed: () {
                                    setState(() {
                                      _controller.clear();
                                      _results.clear();
                                      _isSearching = false;
                                      // Remove focus from TextField
                                      FocusScope.of(context).unfocus();
                                    });
                                  },
                                )
                              else
                                const SizedBox.shrink(),
                            ],
                          ),
                        ),
                      ),
                      if (_results.isNotEmpty)
                        Expanded(
                          child: ListView.builder(
                            itemCount: _results.length,
                            itemBuilder: (BuildContext context, int index) {
                              final CloudData result = _results[index];
                              return ListTile(
                                title: Text(result.service),
                                onTap: () {
                                  setState(() {
                                    widget.recentResults?.insert(0, result);
                                    _controller.text = result.service;
                                    _results.clear();
                                    // _isSearching = false;
                                    // // Remove focus from TextField
                                    // FocusScope.of(context).unfocus();
                                  });
                                  context.goNamed('serviceDetails',
                                      extra: result);
                                  RealTimeDatabase().saveUserInteraction(
                                      serviceId: result.service,
                                      featureId: FeatureID.search.toString(),
                                      startTime: true,
                                      endTime: false);
                                },
                              );
                            },
                          ),
                        )
                      else
                        const SizedBox.shrink(),
                      if (widget.recentResults?.isNotEmpty ?? false)
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            const Padding(
                              padding: EdgeInsets.only(left: 16.0),
                              child: Text('Recents'),
                            ),
                            ...widget.recentResults!
                                .map((CloudData recent) => ListTile(
                                      title: Text(recent.service),
                                      onTap: () {
                                        setState(() {
                                          _controller.text = recent.service;
                                          _results.clear();
                                        });
                                      },
                                    )),
                          ],
                        )
                      else
                        const SizedBox.shrink(),
                    ],
                  );
                } else {
                  return nil;
                }
              },
            )));
  }
}
