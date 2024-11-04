import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:frontend/api_servies.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Local API Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: JokesScreen(),
    );
  }
}

class JokesScreen extends StatefulWidget {
  @override
  _JokesScreenState createState() => _JokesScreenState();
}

class _JokesScreenState extends State<JokesScreen> {
  late final ApiService apiService;
  late Future<List<dynamic>> jokes;

  @override
  void initState() {
    super.initState();
    final dio = Dio();
    apiService = ApiService(dio);
    jokes = apiService.fetchPosts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Jokes'),
      ),
      body: FutureBuilder<List<dynamic>>(
        future: jokes,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text('No jokes found.'));
          }

          final List<dynamic> jokes = snapshot.data!;

          return ListView.builder(
            itemCount: jokes.length,
            itemBuilder: (context, index) {
              final joke = jokes[index];
              return ListTile(
                title: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(joke['id'].toString()),
                    SizedBox(
                      width: 10,
                    ),
                    Text(joke['title']),
                  ],
                ),
                subtitle: Text(joke['joke']),
              );
            },
          );
        },
      ),
    );
  }
}
