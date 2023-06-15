import 'package:flutter/material.dart';
import 'package:quiz_app/controller/controller.dart';
import 'package:quiz_app/custom_widget/custom_list_tile.dart';

class ShowPopDownButton extends StatefulWidget {
  const ShowPopDownButton({Key? key}) : super(key: key);

  @override
  State<ShowPopDownButton> createState() => _ShowPopDownButtonState();
}

class _ShowPopDownButtonState extends State<ShowPopDownButton> {
  dynamic getDetails(String key) {}

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.white,
      ),
      onPressed: () {
        showModalBottomSheet(
            backgroundColor: Colors.transparent,
            context: context,
            builder: (context) {
              return Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10)),
                padding: const EdgeInsets.only(
                    left: 20, right: 20, bottom: 20, top: 5),
                height: (MediaQuery.of(context).size.height / 100) * 55,
                child: Column(
                  children: [
                    //a circular bordered box for the pop down menu
                    Container(
                      height: 6,
                      width: 100,
                      decoration: BoxDecoration(
                        color: Colors.grey.shade400,
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    const SizedBox(height: 10),

                    //history list
                    Expanded(
                      child: ListView.builder(
                        itemCount: XController.history?.length,
                        itemBuilder: (BuildContext context, int index) {
                          List? temp = XController.history?.reversed.toList();
                          return CustomListTile(
                            name: temp![index]['userName'],
                            scoreText: temp[index]['score'].toString(),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              );
            });
      },
      child: Center(
        child: Text(
          "History",
          style: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.bold,
            color: getDetails('textColor'),
          ),
        ),
      ),
    );
  }
}
