import 'package:cuy_flutter_dev/injection_container.dart';
import 'package:cuy_flutter_dev/presentation/bloc/plans/plans_bloc.dart';
import 'package:cuy_flutter_dev/presentation/widgets/plan_card_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PlansPage extends StatelessWidget {
  const PlansPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<PlansBloc>()..add(const PlansStarted()),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 38),
        child: BlocBuilder<PlansBloc, PlansState>(
          builder: (context, state) {
            if (state is PlansLoading) {
              return _buildLoader();
            } else if (state is PlansFailure) {
              return _buildError(state.errorMessage);
            } else if (state is PlansSuccess) {
              return SingleChildScrollView(
                physics: const ScrollPhysics(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    _buildTitle(),
                    const SizedBox(height: 20),
                    ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: state.plans.length,
                      itemBuilder: (context, index) {
                        final plan = state.plans[index];
                        return PlanCardWidget(
                          name: plan.name,
                          duration: plan.duration,
                          price: plan.price,
                        );
                      },
                    ),
                  ],
                ),
              );
            } else {
              return const SizedBox();
            }
          },
        ),
      ),
    );
  }

  _buildLoader() {
    return const Center(
      child: CupertinoActivityIndicator(),
    );
  }

  _buildError(String errorMessage) {
    return Center(
      child: Text(errorMessage),
    );
  }

  _buildTitle() {
    return const Text(
      'Tu nuevo plan',
      style: TextStyle(
        fontSize: 28,
        fontWeight: FontWeight.w900,
      ),
    );
  }
}
