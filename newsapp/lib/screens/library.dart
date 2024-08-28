import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsApp/components/article_comp.dart';
import 'package:newsApp/screens/setting_screen.dart';
import 'package:newsApp/services/repository.dart';
import '../cubit/article_cubit.dart';
import '../cubit/article_state.dart';

class Library extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ArticleCubit(Repository())..fetchArticles(),
      child: Scaffold(
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              DrawerHeader(
                decoration: BoxDecoration(
                  color: const Color(0xFFbf592b)
                ),
                child: Text(
                  'Welcome to Drawer!',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                  ),
                ),
              ),
              ListTile(
                leading: Icon(Icons.home),
                title: Text('Home'),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: Icon(Icons.settings),
                title: Text('Settings'),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SettingsScreen()),
                  );
                },
              ),
              ListTile(
                leading: Icon(Icons.exit_to_app),
                title: Text('Exit'),
                onTap: () {

                  Navigator.pop(context); // إغلاق الـ Drawer
                },
              ),
            ],
          ),
        ),
        appBar: AppBar(
          centerTitle: true,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(20),
              bottomRight: Radius.circular(20),
            ),
          ),
          backgroundColor: const Color(0xFFbf592b),
          title: const Text(
            'NewsFeed',
            style: TextStyle(
              color: Color(0xFFe7f0f1),
              fontWeight: FontWeight.w900,
              fontSize: 20,
              fontStyle: FontStyle.italic,
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: const Color(0xFFedbea4),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  height: 300, // Adjusted height to fit image+text
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: BlocBuilder<ArticleCubit, ArticleState>(
                    builder: (context, state) {
                      if (state is ArticleLoading) {
                        return const Center(child: CircularProgressIndicator());
                      } else if (state is ArticleLoaded) {
                        final articles = state.articles;
                        return ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: articles.length,
                          itemBuilder: (context, index) {
                            final article = articles[index];
                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: ArticleComp(
                                imageUrl: article.urlToImage,
                                title: article.title,
                              ),
                            );
                          },
                        );
                      } else if (state is ArticleError) {
                        return Center(child: Text(state.message));
                      } else {
                        return const SizedBox();
                      }
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
