//import 'package:firebase_auth/firebase_auth.dart';
//import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
//import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:socialmedia_app/components/my_drawer.dart';
import 'package:socialmedia_app/components/my_post_button.dart';
import 'package:socialmedia_app/components/my_textfield.dart';
import 'package:socialmedia_app/database/firestore.dart';
//import 'package:socialmedia_app/helper/helper_functions.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  //access firestore
  final FirestoreDatabase database = FirestoreDatabase();

  //text controller
  final TextEditingController newPostController = TextEditingController();
 

  //post message
  void postMessage() {
    if (newPostController.text.isNotEmpty) {
      String message = newPostController.text;
      //String username = ;
      database.addPost(message);
    }

    //clear controller
    newPostController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        
        title: Text("M I N I M A L",
          style: TextStyle(
            color: Theme.of(context).colorScheme.inversePrimary,
            fontWeight: FontWeight.w600,
          ),
        ),

        backgroundColor: Theme.of(context).colorScheme.primary,
        elevation: 10,
      ),
      drawer: MyDrawer(),

      body: Column(
        children: [
          //textfield box for users to type
          const SizedBox(height: 20,),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Row(
              children: [
                Expanded(
                  child: MyTextfield(
                    hintText: "Chat ?", 
                    obscureText: false, 
                    controller: newPostController
                    ),
                ),
                const SizedBox(width: 10,),
                MyPostButton(
                  onTap: postMessage),
              ],
            ),
          ),
        
          //posts
          StreamBuilder(
            stream: database.getPostsStream(), 
            builder: (context, snapshot)  {
              //show loading circle
              if(snapshot.connectionState == ConnectionState.waiting) {
                return Center(child: CircularProgressIndicator(),);
              }

              //get all posts
              final posts  = snapshot.data!.docs;

              //no data?
              if(snapshot.data == null || posts.isEmpty){
                return const Center(
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text('No posts.. Post Something'),
                  ),
                  );
              }

              //return as a list
              return Expanded(
                child: ListView.builder(
                  itemCount: posts.length,
                  itemBuilder: (context,index) {
                    //get individual posts
                    final post = posts[index];

                    //get data from each post
                    String message = post['PostMessage'];
                    String userEmail = post['UserEmail'];
                    Timestamp timeStamp = post['TimeStamp'];

                    //return as tile
                    return Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Theme.of(context).colorScheme.primary,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                          
                              Text(message,
                              style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.w600,
                              ),
                              ),
                              Row(
                                children: [
                                  Icon(Icons.person),

                                  const SizedBox(width: 10,),
                                  Text(userEmail,
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w400,
                                  ),
                                  ),
                                  
                                ],
                              ),
                              Text(timeStamp.toDate().toLocal().toString(),
                                  style: TextStyle(
                                    fontSize: 17,
                                    fontWeight: FontWeight.w300,
                                  ),
                                  ),
                            ]                   
                          ),
                        ),
                      ),
                    );

                  },
                  ),
                );

            },
            ),
        ],
      ),
    );
  }
}