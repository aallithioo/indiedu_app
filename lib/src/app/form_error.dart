import 'themes/size.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class FormError extends StatelessWidget {
  const FormError({
    Key? key,
    required this.errors,
  }) : super(key: key);

  final List<String?> errors;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(
        errors.length,
        (index) => formErrorText(error: errors[index]!),
      ),
    );
  }

  formErrorText({required String error}) {
    return Column(
      children: [
        Row(
          children: [
            SvgPicture.asset("assets/icons/svg/Error.svg",
                height: kSizeSmall, width: kSizeSmall),
            SizedBox(
              width: kSizeTiny,
            ),
            Text(error),
          ],
        ),
        SizedBox(
          height: kSizeTiny / 2,
        ),
      ],
    );
  }
}
