import 'package:flutter/cupertino.dart';

import 'package:grocery_user/Utils/assets-repo.dart';

class LoginCoverImage extends StatelessWidget {
  const LoginCoverImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          height: double.infinity,
          width: double.infinity,
          child: Image.asset(AssetsRepo.coverImage, fit: BoxFit.cover),
        ),
      ],
    );
  }
}
