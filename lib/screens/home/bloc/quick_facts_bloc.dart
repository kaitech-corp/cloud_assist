import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../bloc/generics/generic_bloc.dart';
import '../../../bloc/generics/generic_state.dart';
import '../../../bloc/generics/generics_event.dart';
import '../../../models/quick_fact_model/quick_fact_model.dart';
import '../../../repositories/quick_facts_repository.dart';
import '../../../services/service_config/service_config.dart';
import '../../../widgets/service_detail_card.dart';
import '../components/quick_fact_carousel.dart';

class QuickFactBloc extends StatefulWidget {
  const QuickFactBloc({
    super.key,
  });

  @override
  State<QuickFactBloc> createState() => _QuickFactBlocState();
}

class _QuickFactBlocState extends State<QuickFactBloc> {
  late GenericBloc<QuickFact, QuickFactsRepository> bloc;

  @override
  void initState() {
    bloc =
        BlocProvider.of<GenericBloc<QuickFact, QuickFactsRepository>>(context);
    bloc.add(LoadingGenericData());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GenericBloc<QuickFact, QuickFactsRepository>,
        GenericState>(
      builder: (BuildContext context, GenericState state) {
        if (state is LoadingState) {
          return Padding(
            padding: const EdgeInsets.all(8),
            child: SizedBox(
                height: SizeConfig.screenHeight * .15,
                width: SizeConfig.screenWidth,
                child: funFactCard(const Text('Quick Fact'))),
          );
        } else if (state is HasDataState) {
          final List<QuickFact> facts = state.data as List<QuickFact>;
          return QuickFactCarousel(facts: facts);
        } else {
          return Padding(
            padding: const EdgeInsets.all(8),
            child: SizedBox(
                height: SizeConfig.screenHeight * .15,
                width: SizeConfig.screenWidth,
                child: funFactCard(const Text('Quick Fact'))),
          );
        }
      },
    );
  }
}
