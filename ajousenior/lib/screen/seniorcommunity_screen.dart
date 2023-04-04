import 'package:ajousenior/data/post.dart';
import 'package:ajousenior/provider/communityprovider.dart';
import 'package:ajousenior/screen/community_post_screen.dart';
import 'package:ajousenior/screen/community_content_screen.dart';
import 'package:flutter/material.dart';
//import 'dart:async';

class CommunityScreen extends StatefulWidget {
  const CommunityScreen({super.key});
  @override
  State<CommunityScreen> createState() => _CommunityScreenState();
}

class _CommunityScreenState extends State<CommunityScreen> {
  /*Future initPosts() async {
    entries = await CommunityProviders().getPost();
  }*/

  @override
  void initState() {
    super.initState();
    /*initPosts().then((_) {
      setState(() {
        isLoading = false;
      });
    });*/
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 2,
        backgroundColor: Colors.white,
        foregroundColor: Colors.green,
        title: const Center(
          child: Text(
            "Senior App",
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.w400),
          ),
        ),
      ),
      body: FutureBuilder<List<Post>>(
        future: CommunityProviders().getPost(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.separated(
              padding: const EdgeInsets.all(8),
              itemCount: snapshot.data!.length,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ContentScreen(
                            current: snapshot
                                .data![snapshot.data!.length - index - 1]),
                      ),
                    ).then((value) {});
                  },
                  title: Container(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    height: 120,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          snapshot
                              .data![snapshot.data!.length - index - 1].title,
                          style: const TextStyle(
                            fontSize: 30,
                          ),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        Text(
                          '${snapshot.data![snapshot.data!.length - index - 1].date} / ${snapshot.data![snapshot.data!.length - index - 1].userID}',
                          style: TextStyle(
                            color: Colors.black.withOpacity(0.5),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
              separatorBuilder: (BuildContext context, int index) =>
                  const Divider(),
            );
          } else if (snapshot.hasError) {
            return Text("${snapshot.error}");
          }
          return const Center(child: CircularProgressIndicator());
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => PostScreen(),
            ),
          ).then((value) {
            setState(() {});
          });
        },
        tooltip: 'Post',
        child: const Icon(Icons.add),
      ),
    );
  }
}
