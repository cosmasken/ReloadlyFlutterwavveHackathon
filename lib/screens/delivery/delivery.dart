import 'package:flutter/material.dart';
import 'package:swarp/components/buttons/outline_button.dart';
import 'package:swarp/components/buttons/primary_button.dart';
import 'package:swarp/components/inputs/customforminput.dart';
import 'package:swarp/components/texts/blacktext.dart';
import 'package:swarp/theme/colors.dart';

class Delivery extends StatefulWidget {
  const Delivery({Key? key}) : super(key: key);

  @override
  _DeliveryState createState() => _DeliveryState();
}
final TextEditingController nameController= TextEditingController();
final TextEditingController addressController= TextEditingController();
final TextEditingController phoneController= TextEditingController();
final TextEditingController cityController= TextEditingController();
final TextEditingController codeController= TextEditingController();


class _DeliveryState extends State<Delivery> {
  String? dropdownValue;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  flex: 7,
                  child: PrimaryButton(
                    buttonText: 'Delivery',
                    elevation: 0,
                    padding: const EdgeInsets.symmetric(vertical: 15),
                    onPressed: () {},
                  ),
                ),
                Spacer(),
                Expanded(
                  flex: 7,
                  child: CustomOutlinedButton(
                    text: 'Pickup',
                    padding: const EdgeInsets.symmetric(vertical: 15),
                    onPressed: () {},
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 40,
            ),
            Form(
                child: Column(
              children: [
                CustomTextInput(hint: 'Full Name',
                controller: nameController,),
                CustomTextInput(
                  controller: phoneController,
                  hint: 'Phone Number',
                  margin: EdgeInsets.only(top: 15),
                ),
                CustomTextInput(
                  controller: addressController,
                  hint: 'Address Line 1',
                  margin: EdgeInsets.only(top: 15),
                ),

                CustomTextInput(
                  controller: cityController,
                  hint: 'City',
                  margin: EdgeInsets.only(top: 15),
                ),
                CustomTextInput(
                  controller: codeController,
                  hint: 'Code',
                  margin: EdgeInsets.only(top: 15),
                ),
                Container(
                  padding: const EdgeInsets.only(left: 15, top: 3, bottom: 3),
                  margin: const EdgeInsets.only(top: 15),
                  width: double.infinity,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: AppColors.secondary, width: 2)),
                  child: DropdownButton<String>(
                    value: dropdownValue,
                    icon: const Icon(Icons.chevron_right),
                    iconSize: 24,
                    elevation: 16,
                    hint: BlackText(
                      text: 'Select your area',
                      color: Colors.black38,
                      weight: FontWeight.normal,
                    ),
                    style: const TextStyle(color: Colors.deepPurple),
                    underline: Container(
                      height: 2,
                      color: Colors.transparent,
                    ),
                    onChanged: (String? newValue) {
                      setState(() {
                        dropdownValue = newValue!;
                      });
                    },
                    items: <String>['One', 'Two', 'Free', 'Four']
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 30),
                  width: double.infinity,
                  child: PrimaryButton(
                    buttonText: 'Send Barter Request',
                    elevation: 0,
                    padding: const EdgeInsets.symmetric(vertical: 15),
                    onPressed: () {},
                  ),
                )
              ],
            ))
          ],
        ),
      ),
    ));
  }
}
