import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../model/github.dart';

const primary = Color(0xff645dd7);

Future<List<Github>> fetchRepos(BuildContext context) async {
  final response = await http
      .get(Uri.parse('https://api.github.com/users/freeCodeCamp/repos'));

  if (response.statusCode == 200) {
    final body = json.decode(response.body);
    final snackBar = SnackBar(
      content: const Text('Repositories Loaded'),
      duration: const Duration(seconds: 2, milliseconds: 500),
      action: SnackBarAction(
        label: 'Okay',
        onPressed: () {},
      ),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
    return body.map<Github>(Github.fromJson).toList();
  } else {
    throw Exception('Failed to load Github Repos');
  }
}

class IndexPage extends StatefulWidget {
  const IndexPage({Key? key}) : super(key: key);

  @override
  State<IndexPage> createState() => _IndexPageState();
}

class _IndexPageState extends State<IndexPage> {
  late Future<List<Github>> futureRepos;
  late Future<List<Commit>> commits;

  Future<List<Commit>> getCommit(String name) async {
    final response = await http.get(
        Uri.parse('https://api.github.com/repos/freeCodeCamp/${name}/commits'));

    if (response.statusCode == 200) {
      final body = json.decode(response.body);
      List<Commit> temp = body.map<Commit>(Commit.fromJson).toList();
      showModal(temp);
      return body.map<Commit>(Commit.fromJson).toList();
    } else {
      throw Exception('Failed to load Github Repos');
    }
  }

  void showModal(List<Commit> data) {
    showModalBottomSheet<void>(
        context: context,
        builder: (BuildContext context) {
          return Center(
              child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: SizedBox(
              height: 400,
              child: Center(
                child: ListView(
                  children: <Widget>[
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text('Last Commit: freecodecamp Repo',
                          style: TextStyle(
                            fontSize: 20.0,
                            height: 1.2,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            decoration: TextDecoration.underline,
                          )),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: RichText(
                        text: TextSpan(
                          style: const TextStyle(
                            fontSize: 20.0,
                            height: 1.2,
                            color: Colors.black,
                          ),
                          children: <TextSpan>[
                            const TextSpan(text: 'Author Name : '),
                            TextSpan(
                                text: data[0].name,
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                )),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: RichText(
                        text: TextSpan(
                          style: const TextStyle(
                            fontSize: 20.0,
                            height: 1.2,
                            color: Colors.black,
                          ),
                          children: <TextSpan>[
                            const TextSpan(text: 'Author email : '),
                            TextSpan(
                                text: data[0].email,
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  decoration: TextDecoration.underline,
                                )),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: RichText(
                        text: TextSpan(
                          style: const TextStyle(
                            fontSize: 20.0,
                            height: 1.2,
                            color: Colors.black,
                          ),
                          children: <TextSpan>[
                            TextSpan(text: 'Date of last commit : '),
                            TextSpan(
                                text: data[0].date,
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                )),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: RichText(
                        text: TextSpan(
                          style: const TextStyle(
                            fontSize: 20.0,
                            height: 1.2,
                            color: Colors.black,
                          ),
                          children: <TextSpan>[
                            const TextSpan(text: 'Commit Message : '),
                            TextSpan(
                                text: data[0].message,
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                )),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: RichText(
                        text: TextSpan(
                          style: const TextStyle(
                            fontSize: 20.0,
                            height: 1.2,
                            color: Colors.black,
                          ),
                          children: <TextSpan>[
                            const TextSpan(text: 'Url : '),
                            TextSpan(
                                text: data[0].htmlUrl,
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                )),
                          ],
                        ),
                      ),
                    ),
                    ElevatedButton(
                      child: const Text('Close'),
                      onPressed: () => Navigator.pop(context),
                    ),
                  ],
                ),
              ),
            ),
          ));
        });
  }

  @override
  void initState() {
    super.initState();
    futureRepos = fetchRepos(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text("FreeCodeCamp Repos")),
      ),
      body: Center(
        child: FutureBuilder<List<Github>>(
            future: futureRepos,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                final repos = snapshot.data!;
                return indexBody(repos, context);
              }
              return const CircularProgressIndicator();
            }),
      ),
    );
  }

  Widget indexBody(List<Github> repos, BuildContext context) =>
      ListView.builder(
        itemCount: repos.length,
        itemBuilder: (context, index) {
          final repo = repos[index];
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
                child: Column(
              children: [
                ListTile(
                  title: Padding(
                    padding: const EdgeInsets.only(bottom: 10.0),
                    child: Text(
                      repo.name,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  subtitle: Text(repo.description),
                  trailing: Padding(
                    padding: const EdgeInsets.only(bottom: 10.0),
                    child: ElevatedButton(
                      child: const Text('Last Commit'),
                      style: ElevatedButton.styleFrom(
                        primary: primary,
                      ),
                      onPressed: () async {
                        // setState(() {
                        commits = getCommit(repo.name);
                      },
                    ),
                  ),
                ),
              ],
            )),
          );
        },
      );
}
