import 'package:flutter/material.dart';
import 'package:patchappflutter/Model/user_model.dart';
import 'package:patchappflutter/Pages/other_profile_page.dart';
import 'package:provider/provider.dart';
import '../Provider/user_provider.dart';
import '../Pages/profile_page.dart';
import '../global_user_info.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final TextEditingController _searchController = TextEditingController();
  bool _isLoading = false;

  void _onSearchChanged(String query, UserProvider userProvider) async {
    if (query.isEmpty) {
      userProvider.clearUser(); // valfritt: rensa sökresultat
      return;
    }

    setState(() => _isLoading = true);

    try {
      await userProvider.searchUsers(query);
    } catch (e) {
      print('Fel vid sökning: $e');
    } finally {
      setState(() => _isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final userProvider = Provider.of<UserProvider>(context);

    return Scaffold(
      body: Container(
        width: screenSize.width,
        height: screenSize.height,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/stitches7.png'),
            fit: BoxFit.fill,
          ),
        ),
        child: Column(
          children: [
            // Sökruta
            Container(
              width: double.infinity,
              height: 180,
              padding: const EdgeInsets.only(top: 100, left: 24, right: 24),
              color: const Color(0xFFF382F3),
              child: TextField(
                controller: _searchController,
                style: const TextStyle(color: Colors.black87),
                decoration: InputDecoration(
                  hintText: 'Sök efter användare...',
                  hintStyle: TextStyle(
                    color: Colors.black54,
                    fontFamily: 'InknutAntiqua',
                  ),
                  filled: true,
                  fillColor: Colors.white,
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 16,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: BorderSide.none,
                  ),
                  prefixIcon: const Icon(Icons.search, color: Colors.black),
                ),
                onChanged: (value) => _onSearchChanged(value, userProvider),
              ),
            ),

            // Resultatlista
            Expanded(
              child:
                  _isLoading
                      ? const Center(child: CircularProgressIndicator())
                      : userProvider.searchResults.isEmpty
                      ? const Center(
                        child: Text(
                          'Inga användare hittades',
                          style: TextStyle(color: Colors.white),
                        ),
                      )
                      : ListView.builder(
                        itemCount: userProvider.searchResults.length,
                        itemBuilder: (context, index) {
                          final user = userProvider.searchResults[index];
                          return ListTile(
                            title: Text(
                              '${user.firstName} ${user.surName}',
                              style: const TextStyle(
                                fontSize: 25,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'InknutAntiqua',
                              ),
                            ),
                            onTap: () {
                              GlobalUserInfo.otherUser = user;
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => OtherProfilePage(),
                                ),
                              );
                            },
                          );
                        },
                      ),
            ),
          ],
        ),
      ),
    );
  }
}
