import 'package:be_health/ViewModel/Bloc/calcCubit/calc_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../ViewModel/utils/image.dart';

import '../../../../component/Widget/Gender.dart';

class genderGroup extends StatelessWidget {
  const genderGroup({super.key});

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
            gender(
              onTap: () {
                cubit.changeGender('Male');
              },
              isSelected: CalcCubit.Male == true ? true : false,
              text: 'Male',
              textImage: AllImage.male,
            ),
            const SizedBox(
              width: 50,
            ),
            gender(
              onTap: () {
                cubit.changeGender('Female');
              },
              isSelected: CalcCubit.Male == true ? false : true,
              text: 'Female',
              textImage: AllImage.female,
            ),
          ],
        );
      },
    );
  }
}
