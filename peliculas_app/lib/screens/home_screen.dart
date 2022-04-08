import 'package:flutter/material.dart';
import 'package:peliculas_app/themes/themes.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double horizontalAlign = 20;

    Widget welcomeSection() {
      return Padding(
        padding: EdgeInsets.symmetric(horizontal: horizontalAlign),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('Welcome Back to YouMo',
                    style:
                        TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                const SizedBox(height: 10),
                Text('Hi, estimate user',
                    style: TextStyle(fontSize: 15, color: LightTheme.thirdText))
              ],
            ),
            const Icon(
              Icons.notification_add_outlined,
              size: 40,
            )
          ],
        ),
      );
    }

    Widget searchSection() {
      return Padding(
        padding:
            EdgeInsets.symmetric(horizontal: horizontalAlign, vertical: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.grey.shade200),
              width: MediaQuery.of(context).copyWith().size.width * 0.72,
              height: 45,
              child: TextFormField(
                autocorrect: true,
                autofocus: false,
                keyboardType: TextInputType.text,
                textCapitalization: TextCapitalization.words,
                decoration: const InputDecoration(
                    suffixIcon: Icon(Icons.search, size: 20),
                    filled: false,
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    border: InputBorder.none,
                    hintText: 'Search Movie'),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: LightTheme.primary),
              width: MediaQuery.of(context).copyWith().size.width * 0.15,
              height: 45,
              child: TextButton(
                  onPressed: () => {},
                  child: const Icon(Icons.tune_rounded),
                  style: TextButton.styleFrom(
                    primary: LightTheme.secundary,
                  )),
            )
          ],
        ),
      );
    }

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 60),
        child: Column(children: [
          welcomeSection(),
          searchSection(),
          Row(
            children: [],
          ),
          Row(
            children: [],
          ),
          Column()
        ]),
      ),
    );
  }
}
