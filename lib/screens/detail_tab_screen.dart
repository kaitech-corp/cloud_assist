import 'package:flutter/material.dart';

import '../models/cloud_data_model.dart';
import '../services/service_config/service_config.dart';
import '../widgets/service_detail_card.dart';

/// Main screen for Service details.
class DetailTabScreen extends StatefulWidget {
  const DetailTabScreen({super.key, required this.serviceData});
  final CloudData serviceData;
  @override
  State<DetailTabScreen> createState() => _DetailTabScreenState();
}

class _DetailTabScreenState extends State<DetailTabScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  List<String> tabs = <String>[
    'Description',
    'Benefits',
    'Cons',
    'Use Cases',
    'Example'
  ];
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: tabs.length, vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: tabs.length,
      child: Scaffold(
        appBar: AppBar(
            title: Text(
              widget.serviceData.service,
              style: Theme.of(context).textTheme.headline4,
            ),
            bottom: TabBar(
              isScrollable: true,
              unselectedLabelStyle: Theme.of(context).textTheme.headline6,
              // controller: _tabController,
              tabs: tabs.map((String tab) => Tab(text: tab)).toList(),
            )),
        body: SingleChildScrollView(
          child: SizedBox(
            height: SizeConfig.screenHeight - kToolbarHeight,
            child: TabBarView(children: <Widget>[
              Description(
                description: widget.serviceData.description,
                detail: widget.serviceData.detail,
              ),
              Benefits(
                benefits: widget.serviceData.benefits,
              ),
              Cons(
                cons: widget.serviceData.cons,
              ),
              UseCases(
                useCases: widget.serviceData.useCases,
              ),
              Example(example: widget.serviceData.example,)
            ]),
          ),
        ),
      ),
    );
  }
}

class Description extends StatelessWidget {
  const Description(
      {super.key, required this.description, required this.detail});
  final String description;
  final String detail;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: SizeConfig.screenHeight*.8,
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Description',
              style: Theme.of(context).textTheme.headline5,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: serviceDetailCard(Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                description,
                style: Theme.of(context).textTheme.headline6,
              ),
            )),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Detailed Description',
              style: Theme.of(context).textTheme.headline5,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: serviceDetailCard(Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                detail,
                style: Theme.of(context).textTheme.headline6,
              ),
            )),
          ),
        ],
      ),
    );
  }
}

class Benefits extends StatelessWidget {
  const Benefits({super.key, required this.benefits});
  final List<String> benefits;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List<Widget>.generate(
          benefits.length,
          (int index) => Padding(
                padding: const EdgeInsets.all(8.0),
                child: serviceDetailCard(Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    benefits[index],
                    style: Theme.of(context).textTheme.headline6,
                  ),
                )),
              )),
    );
  }
}

class Cons extends StatelessWidget {
  const Cons({super.key, required this.cons});
  final List<String> cons;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List<Widget>.generate(
          cons.length,
          (int index) => Padding(
                padding: const EdgeInsets.all(8.0),
                child: serviceDetailCard(Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    cons[index],
                    style: Theme.of(context).textTheme.headline6,
                  ),
                )),
              )),
    );
  }
}

class UseCases extends StatelessWidget {
  const UseCases({super.key, required this.useCases});
  final List<String> useCases;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List<Widget>.generate(
          useCases.length,
          (int index) => Padding(
                padding: const EdgeInsets.all(8.0),
                child: serviceDetailCard(Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    useCases[index],
                    style: Theme.of(context).textTheme.headline6,
                  ),
                )),
              )),
    );
  }
}

class Example extends StatelessWidget {
  const Example({super.key, required this.example});
  final String example;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: SizeConfig.screenHeight*.5,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: serviceDetailCard(Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            example,
            style: Theme.of(context).textTheme.headline6,
          ),
        )),
      ),
    );
  }
}
