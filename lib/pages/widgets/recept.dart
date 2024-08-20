import 'package:flutter/material.dart';
import 'package:mayoristas/pages/widgets/reception_detail.dart';
import '../widgets/sid_input.dart';
import '../widgets/material_input.dart';

class ReceptPage extends StatefulWidget {
  const ReceptPage({super.key});

  @override
  State<ReceptPage> createState() => _ReceptPageState();
}

class _ReceptPageState extends State<ReceptPage> {
  final TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: 48,
            left: -18,
            child: Container(
              width: 355,
              height: 243,
                child: Image.network(
                  'https://s3-alpha-sig.figma.com/img/91a1/55e9/f14cd814b75b1075a36adde0c2bedbf8?Expires=1725235200&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=IkkRxA1-QADxRDsPTqRs0vIzuzvzs9OHidpUG3FEBAsIbzZLzbDZ6xPmYgyNecFnGOwK83CQKQYLErjbS1aNOHRQczJ6X7Cm9w8yfnKdIJ6w~TK3jj49txmwpaX~4FOFH~8464klwpFnjSFd9ZHQtwTqoZNd4TJDPS~o9MOKk9uBt7Hl7zmM3bUGp6yKE5drj9w~wpZE4ONf5Vs3qUOobQ3NtdPxjTxpnCW3dXgrdmUJpELgzRbKnKVjT8qYdotcFYlxzY-7A30P~If06COQyFqf35uLEeEykRRti66rXibGt8JQcWt1yx-j1Q3qi0t2JZiOU79vpKk0YJSBe~Mg3A__',
                 
                ),
              ),
            ),
        
          Center(
            child: ListView(
              shrinkWrap: true,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SidInput(controller: controller),
                    const SizedBox(height: 20),
                    const MaterialInput(),
                    const SizedBox(height: 20),
                    const ReceptionDetail(),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
