import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BackArrowButton extends StatelessWidget {
  const BackArrowButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: SvgPicture.asset(
        'assets/icons/back_arrow.svg',
        width: 12,
        height: 12,
      ),
      onPressed: () {
        Navigator.pop(context);
      },
    );
  }
}
