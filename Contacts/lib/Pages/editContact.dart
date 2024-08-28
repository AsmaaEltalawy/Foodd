import 'package:contacts/Components/contact_info.dart';
import 'package:contacts/data/models/database_model.dart';
import 'package:contacts/provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class EditContact extends StatelessWidget {
  final ContactInformation contact;
  final int index;

  const EditContact({required this.contact, required this.index});

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<DataProvider>(context);
    provider.controller4.text = contact.name;
    provider.controller5.text = contact.number;
    provider.controller6.text = contact.email;

    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text(
            '(Delete Or Edit) Contact',
            style: TextStyle(color: Colors.white),
          ),
        ),
        backgroundColor: Colors.teal.shade700,
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 15.0, vertical: 7.5),
            child: TextFormField(
              cursorColor: Colors.teal,
              controller: provider.controller4,
              decoration: InputDecoration(
                labelText: 'Name',
                labelStyle: TextStyle(color: Colors.teal.shade900),
                focusedBorder: label,
                enabledBorder: label,
              ),
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 15.0, vertical: 7.5),
            child: TextFormField(
              cursorColor: Colors.teal,
              controller: provider.controller5,
              decoration: InputDecoration(
                  labelText: "Number",
                  labelStyle: TextStyle(color: Colors.teal.shade900),
                  focusedBorder: label,
                  enabledBorder: label),
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 15.0, vertical: 7.5),
            child: TextFormField(
              cursorColor: Colors.teal,
              controller: provider.controller6,
              decoration: InputDecoration(
                  labelText: 'Email',
                  labelStyle: TextStyle(color: Colors.teal.shade900),
                  focusedBorder: label,
                  enabledBorder: label),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  provider.updateContact(
                      ContactsModel(
                          name: contact.name,
                          number: contact.number,
                          email: contact.email),
                      index);
                  Navigator.pop(context);
                },
                child: const Text('Edit Contact'),
              ),
              const SizedBox(width: 20,),
              // ElevatedButton(
              //     onPressed: () {
              //       provider.deleteContact(
              //           ContactsModel(
              //               name: contact.name,
              //               number: contact.number,
              //               email: contact.email) as int,
              //           index);
              //       Navigator.pop(context);
              //     },
              //     child: Text('Delete'))
            ],
          )
        ],
      ),
    );
  }
}

var label = OutlineInputBorder(
  borderRadius: BorderRadius.circular(15),
  borderSide: const BorderSide(width: 2),
);
