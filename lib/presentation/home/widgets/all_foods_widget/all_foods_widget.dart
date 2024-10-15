import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nutrivita/presentation/home/widgets/all_foods_widget/all_foods_success_widget.dart';
import 'package:nutrivita/presentation/home/widgets/all_foods_widget/cubit/all_foods_cubit.dart';
import 'package:nutrivita/presentation/widgets/error_widget.dart';

class AllFoodsWidget extends StatelessWidget {
  const AllFoodsWidget({
    super.key,
    required this.title,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AllFoodsCubit, AllFoodsState>(
      builder: (context, state) {
        return state.status.isSuccess
            ? AllFoodsSuccessWidget(
                title: title,
                food: state.food.surveyFoods,
              )
            : state.status.isLoading
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : state.status.isError
                    ? const ErrorFoodWidget()
                    : const SizedBox();
      },
    );
  }
}
