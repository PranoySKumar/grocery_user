import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:grocery_user/Utils/asset_repo.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: double.infinity,
      child: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage(AssetRepo.coverImage),
              fit: BoxFit.fitHeight,
              alignment: Alignment.center),
        ),
        child: Container(
          margin: const EdgeInsets.all(16),
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(child: SvgPicture.asset(AssetRepo.logoSvg)),
              const SizedBox(
                height: 80,
              ),
              Text(
                "Welcome to FoodDelivery App",
                style: Theme.of(context).textTheme.titleLarge?.copyWith(color: Colors.white),
              ),
              const SizedBox(
                height: 16,
              ),
              Text(
                "Enjoy delivery from a variety of sellers from Vizhinjam",
                style: Theme.of(context).textTheme.titleSmall?.copyWith(color: Colors.white),
              ),
              const SizedBox(
                height: 16.0,
              ),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Theme.of(context).primaryColor,
                  minimumSize: Size(double.infinity, 20),
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(8))),
                  padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 60),
                ),
                child: const Text(
                  "Continue with Phone Number",
                ),
              ),
              const SizedBox(
                height: 16.0,
              ),
              ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    minimumSize: Size(double.infinity, 20),
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(8))),
                    padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 60),
                  ),
                  child: Text(
                    "Continue as Guest",
                    style: Theme.of(context)
                        .textTheme
                        .labelSmall
                        ?.copyWith(color: Colors.black, letterSpacing: 0, fontSize: 14),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
