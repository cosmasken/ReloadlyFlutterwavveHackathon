import 'package:flutter/material.dart';
import 'package:swarp/components/buttons/primary_button.dart';
import 'package:swarp/components/inputs/customforminput.dart';
import 'package:swarp/components/texts/blacktext.dart';
import 'package:swarp/theme/colors.dart';

class Add extends StatefulWidget {
  const Add({Key? key}) : super(key: key);

  @override
  _AddState createState() => _AddState();
}
final TextEditingController titleController= TextEditingController();
final TextEditingController descriptionController= TextEditingController();

class _AddState extends State<Add> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        toolbarHeight: MediaQuery.of(context).size.height * 0.13,
        backgroundColor: Colors.black12,
        flexibleSpace: Container(
          margin: const EdgeInsets.only(left: 30, top: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                children: const [
                  BlackText(text: 'Add Items'),
                ],
              ),
              const BlackText(
                margin: EdgeInsets.only(top: 10),
                text: "Here's how it works",
                color: Colors.black38,
                weight: FontWeight.normal,
                size: 16,
              )
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
          padding: const EdgeInsets.only(left: 20, right: 20, top: 15),
          child: Form(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const BlackText(text: 'Image'),
                Container(
                  margin: const EdgeInsets.only(top: 15, bottom: 30),
                  width: double.infinity,
                  child: OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        padding: EdgeInsets.symmetric(vertical: 15),
                        side: BorderSide(
                            color: AppColors.secondary,
                            width: 2,
                            style: BorderStyle.solid),
                      ),
                      onPressed: () {},
                      child: Icon(
                        Icons.add_circle,
                        color: AppColors.primary,
                        size: 40,
                      )),
                ),
                BlackText(text: 'Title'),
                CustomTextInput(
                  controller: titleController,
                  hint: 'Type in title of item',
                  margin: EdgeInsets.only(top: 15, bottom: 30),
                ),
                BlackText(text: 'Description'),
                CustomTextInput(
                  controller: descriptionController,
                  height: 150,
                  hint: 'Describe your item',
                  margin: EdgeInsets.only(top: 15),
                  maxlines: 5,
                ),
                Container(
                  margin: EdgeInsets.only(top: 30),
                  width: double.infinity,
                  child: PrimaryButton(
                    buttonText: 'Add Item',
                    elevation: 0,
                    padding: const EdgeInsets.symmetric(vertical: 15),
                    onPressed: () {},
                  ),
                )
              ],
            ),
          )),
    ));
  }
}
