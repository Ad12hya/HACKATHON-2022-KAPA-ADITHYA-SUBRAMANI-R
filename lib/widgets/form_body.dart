import 'package:ccpc/services/firestore_database.dart';
import 'package:ccpc/utils/widget_functions.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FormBody extends StatefulWidget {
  const FormBody({Key? key}) : super(key: key);

  @override
  _FormBodyState createState() => _FormBodyState();
}

class _FormBodyState extends State<FormBody> {
  final sidePadding = EdgeInsets.symmetric(horizontal: 25);
  @override
  Widget build(BuildContext context) {
    final form = FormGroup({
      'name': FormControl<String>(
          validators: [Validators.required, Validators.minLength(3)]),
      'college': FormControl<String>(
          validators: [Validators.required, Validators.minLength(3)]),
      'email': FormControl<String>(
          validators: [Validators.required, Validators.email]),
      'mobile': FormControl<String>(validators: [
        Validators.required,
        Validators.number,
        Validators.pattern(r'^[0-9]{10}$')
      ]),
      'interests': FormControl<String>(validators: [Validators.required]),
      'careerAspirations':
          FormControl<String>(validators: [Validators.required]),
    });
    return ReactiveFormBuilder(
        builder: (context, formGroup, child) {
          return Padding(
            padding: sidePadding,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  ReactiveTextField(
                      formControlName: 'name',
                      decoration: const InputDecoration(
                        labelText: 'Full Name',
                        border: UnderlineInputBorder(),
                      ),
                      validationMessages: (control) => {
                            'required': 'The name must not be empty',
                            'minLength': 'Enter at least 3 characters'
                          }),
                  addVerticalSpace(10),
                  ReactiveTextField(
                      formControlName: 'college',
                      decoration: const InputDecoration(
                        labelText: 'College Name',
                        border: UnderlineInputBorder(),
                      ),
                      validationMessages: (control) => {
                            'required': 'The college name must not be empty',
                            'minLength': 'Enter at least 3 characters'
                          }),
                  addVerticalSpace(10),
                  ReactiveTextField(
                      formControlName: 'email',
                      decoration: const InputDecoration(
                        labelText: 'Email',
                        border: UnderlineInputBorder(),
                      ),
                      validationMessages: (control) => {
                            'required': 'The email must not be empty',
                            'email': 'Enter a valid email'
                          }),
                  addVerticalSpace(10),
                  ReactiveTextField(
                      formControlName: 'mobile',
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                        labelText: 'Mobile',
                        border: UnderlineInputBorder(),
                      ),
                      validationMessages: (control) => {
                            'required': 'The mobile number must not be empty',
                            'pattern': 'Enter a valid phone no.'
                          }),
                  addVerticalSpace(10),
                  ReactiveTextField(
                      formControlName: 'interests',
                      decoration: const InputDecoration(
                        labelText: 'Your Interests',
                        border: UnderlineInputBorder(),
                      ),
                      validationMessages: (control) => {
                            'required': 'The interests field must not be empty',
                          }),
                  addVerticalSpace(10),
                  ReactiveTextField(
                      formControlName: 'careerAspirations',
                      decoration: const InputDecoration(
                        labelText: 'Your career aspirations',
                        border: UnderlineInputBorder(),
                      ),
                      validationMessages: (control) => {
                            'required':
                                'The career aspirations field must not be empty',
                          }),
                  addVerticalSpace(20),
                  ReactiveFormConsumer(builder: (context, form, child) {
                    return ElevatedButton(
                        onPressed: () async {
                          EasyLoading.instance
                            ..indicatorType =
                                EasyLoadingIndicatorType.threeBounce
                            ..maskType = EasyLoadingMaskType.black
                            ..indicatorColor = Colors.blue
                            ..backgroundColor = Colors.white
                            ..loadingStyle = EasyLoadingStyle.custom
                            ..textColor = Colors.black
                            ..contentPadding = EdgeInsets.all(20)
                            ..fontSize = 20
                            ..toastPosition = EasyLoadingToastPosition.bottom
                            ..indicatorSize = 50
                            ..radius = 20
                            ..boxShadow = [
                              BoxShadow(
                                  color: Colors.grey.withOpacity(0.8),
                                  blurRadius: 7,
                                  spreadRadius: 2,
                                  offset: Offset(0, 2))
                            ]
                            ..textPadding = EdgeInsets.all(30);
                          if (form.valid) {
                            final name = form.control('name').value;
                            final college = form.control('college').value;
                            final email = form.control('email').value;
                            final mobile = form.control('mobile').value;
                            final interests = form.control('interests').value;
                            final careerAspirations =
                                form.control('careerAspirations').value;
                            FocusManager.instance.primaryFocus?.unfocus();
                            EasyLoading.showToast("Submitting your response...",
                                duration: Duration(milliseconds: 500),
                                dismissOnTap: true,
                                maskType: EasyLoadingMaskType.none,
                                toastPosition: EasyLoadingToastPosition.bottom);
                            final prefs = await SharedPreferences.getInstance();
                            await prefs.setBool('alreadyFilledForm', true);
                            await FirestoreDatabase(FirebaseFirestore.instance)
                                .addRecord(
                                    name: name,
                                    email: email,
                                    mobile: mobile,
                                    interests: interests,
                                    college: college,
                                    careerAspirations: careerAspirations);
                            EasyLoading.showToast("Done!",
                                duration: Duration(milliseconds: 1000),
                                dismissOnTap: true,
                                maskType: EasyLoadingMaskType.none,
                                toastPosition: EasyLoadingToastPosition.bottom);
                            Navigator.pop(context);
                          } else {
                            EasyLoading.showToast('Enter valid details',
                                maskType: EasyLoadingMaskType.none,
                                dismissOnTap: true,
                                toastPosition: EasyLoadingToastPosition.bottom,
                                duration: Duration(seconds: 1));
                          }
                        },
                        child: const Text("Submit"));
                  })
                ],
              ),
            ),
          );
        },
        form: () => form);
  }
}
