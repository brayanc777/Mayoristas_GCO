import 'package:flutter/material.dart';
import 'plu_card.dart';

class ReceptionDetail extends StatelessWidget {
  const ReceptionDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 317,
      height: 380,
      padding: const EdgeInsets.only(left: 3.0, right: 3.0),
      decoration: BoxDecoration(
        border: Border.all(
          color: const Color.fromARGB(255, 214, 213, 213),
          width: 1.0,
        ),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: 64,
                height: 63,
                margin: const EdgeInsets.only(left: 9.0),
                decoration: const BoxDecoration(
                  color: Color.fromRGBO(254, 247, 255, 1),
                ),
                child:  const Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 41,
                      height: 39,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          
                    Icon(Icons.stars_outlined),
                    SizedBox(width: 8,),
                    Text(
                      '5',
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 14
                      ),
                      textAlign: TextAlign.center,
                    ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
             TextButton(
  style: TextButton.styleFrom(
    backgroundColor: const Color.fromRGBO(236, 34, 31, 1),
    minimumSize: const Size(47, 40),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(8.0),
      side: const BorderSide(
        color: Color.fromRGBO(192, 15, 12, 1),
        width: 1.0,
      ),
    ),
  ),
  onPressed: () {
    
  },
  child: const Icon(
    Icons.delete_outline_outlined,
    color: Colors.white,
    size: 16,
  ),
),

            ],
          ),
          Expanded(
            child: ListView(
              children: const [
                PluCard(),
                PluCard(),
                PluCard(),
                PluCard(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
