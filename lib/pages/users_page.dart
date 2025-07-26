//import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:socialmedia_app/helper/helper_functions.dart';

class UsersPage extends StatelessWidget {
   const UsersPage({super.key});

 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("U S E R S",
              style: TextStyle(
                color: Theme.of(context).colorScheme.inversePrimary,
                fontWeight: FontWeight.w600,
                ),
              ),
        backgroundColor: Theme.of(context).colorScheme.primary,
        elevation: 10,
      ),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection("Users").snapshots(),
        builder: (context, snapshot) {
          //show errors
          if(snapshot.hasError){
            displayMessagetoUser("Something went Wrong", context);
          }
          //show loading circle
          if(snapshot.connectionState == ConnectionState.waiting){
            return const Center(child: CircularProgressIndicator(),);
          }

          if(snapshot.data == null){
              return const Text("No Data");
          }

          //get all users
          final users = snapshot.data!.docs;

          return ListView.builder(
            itemCount: users.length,
            itemBuilder: (context,index)  {
              final user = users[index];

              return Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.secondary,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Icon(Icons.person,
                              size: 20,

                            ),
                            const SizedBox(width: 10,),
                            Text(user['username'],
                              style: TextStyle(
                                fontWeight: FontWeight.w800,
                                fontSize: 20,
                              ),
                            ),
                          ],
                        ),

                        const SizedBox(height: 5,),
                       Row(
                          children: [
                            Icon(Icons.mail,
                              size: 18,

                            ),
                            const SizedBox(width: 10,),
                            Text(user['email'],
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 18,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              );
            }
            );

        }
        ),
    );
  }
}