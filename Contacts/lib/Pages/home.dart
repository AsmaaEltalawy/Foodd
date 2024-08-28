import 'package:contacts/Components/contact_info.dart';
import 'package:contacts/Pages/addContact.dart';
import 'package:contacts/Pages/editContact.dart';
import 'package:contacts/provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<DataProvider>(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal.shade700,
        title: const Center(
          child: Text(
            'Contacts',
            style: TextStyle(
                fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
          ),
        ),
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.search,
                color: Colors.white,
              ))
        ],
      ),
      body: ListView.builder(
          itemCount: provider.contactsList.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                final contactInfo = ContactInformation(
                  name: provider.contactsList[index].name,
                  number: provider.contactsList[index].number,
                  email: provider.contactsList[index].email,
                );
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          EditContact(contact: contactInfo, index: index),
                    ));
              },
              child: ContactInformation(
                name: provider.contactsList[index].name,
                number: provider.contactsList[index].number,
                email: provider.contactsList[index].email,
              ),
            );
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const AddContact()));
        },
        backgroundColor: Colors.teal,
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
    );
  }
}
