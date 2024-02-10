import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../ViewModel/Bloc/calcCubit/calc_cubit.dart';

import '../../../../component/Widget/minPlusCustom.dart';

class minPlusGroup extends StatelessWidget {
  const minPlusGroup({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CalcCubit, CalcState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        var cubit = CalcCubit.get(context);
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            minPlus(
                text: 'Wight',
                Num: CalcCubit.Wight,
                AddonPressed: () {
                  cubit.addWight();
                },
                MinonPressed: () {
                  cubit.minWight();
                }),
            const SizedBox(
              width: 50,
            ),
            minPlus(
                text: 'Age',
                Num: CalcCubit.Age,
                AddonPressed: () {
                  cubit.addAge();
                },
                MinonPressed: () {
                  cubit.minAge();
                }),
          ],
        );
      },
    );
  }
}
