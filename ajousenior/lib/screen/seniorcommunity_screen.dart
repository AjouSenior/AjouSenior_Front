import 'package:ajousenior/data/post.dart';
import 'package:ajousenior/screen/community_post_screen.dart';
import 'package:ajousenior/screen/community_content_screen.dart';
import 'package:ajousenior/provider/communityprovider.dart';
import 'package:flutter/material.dart';

class CommunityScreen extends StatefulWidget {
  const CommunityScreen({super.key});
  @override
  State<CommunityScreen> createState() => _CommunityScreenState();
}

class _CommunityScreenState extends State<CommunityScreen> {
  List<Post> entries = [];
  bool isLoading = true;
  CommunityProviders communityProviders = CommunityProviders();

  Future initPosts() async {
    entries = await communityProviders.getPost();
  }

  @override
  void initState() {
    super.initState();
    initPosts().then((_) {
      setState(() {
        isLoading = false;
      });
    });
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
      body: ListView.separated(
        padding: const EdgeInsets.all(8),
        itemCount: entries.length,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ContentScreen(current: entries[index]),
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
                    entries[index].title,
                    style: const TextStyle(
                      fontSize: 30,
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Text(
                    '${entries[index].date} / ${entries[index].userID}',
                    style: TextStyle(
                      color: Colors.black.withOpacity(0.5),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
        separatorBuilder: (BuildContext context, int index) => const Divider(),
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
