import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:toodo/theme/theme_provider.dart';

class Settings extends StatelessWidget {
  const Settings({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
      ),
      body: Padding(
        padding: const EdgeInsets.all( 16.0),
        child: Container(

            decoration: BoxDecoration(
                color: Colors.pink.shade100,
                borderRadius: BorderRadius.circular(12)),
              child: Padding(
                padding: const EdgeInsets.all( 20),
                child: Row(
                  children: [
                    Text(
                      themeProvider.isDarkMode? 'Light Mode':"Dark Mode",
                      style: const TextStyle(fontSize: 20),

                    ),
                    const Spacer(),
                    Switch(
                      value:  themeProvider.isDarkMode,
                      onChanged: (value){
                        themeProvider.toggleTheme();
                      },
                      activeColor: Colors.green,
                      activeTrackColor: Colors.white,
                    ),
                  ],

                ),
              ),
          ),
      ),

    );
  }
}

void onchange(bool) {}
