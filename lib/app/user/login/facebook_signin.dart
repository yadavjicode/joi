import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';

class FacebookLoginPage extends StatefulWidget {
  @override
  _FacebookLoginPageState createState() => _FacebookLoginPageState();
}

class _FacebookLoginPageState extends State<FacebookLoginPage> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  User? _user;

  Future<User?> _loginWithFacebook() async {
    try {
      final LoginResult result = await FacebookAuth.instance.login();

      if (result.status == LoginStatus.success) {
        final OAuthCredential credential =
            FacebookAuthProvider.credential(result.accessToken!.tokenString);
        final userCredential =
            await FirebaseAuth.instance.signInWithCredential(credential);
        return userCredential.user;
      } else {
        print(result.message);
      }
    } catch (e) {
      print(e.toString());
    }
    return null;
  }

  Future<void> _logout() async {
    try {
      await _auth.signOut();
      await FacebookAuth.instance.logOut();
      await FirebaseAuth.instance.signOut();
    } catch (e) {
      print('Error logging out: $e');
    } finally {
      setState(() {
        _user = null;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Facebook Login'),
      ),
      body: Center(
        child: _user == null
            ? ElevatedButton(
                onPressed: () async {
                  User? user = await _loginWithFacebook();
                  setState(() {
                    _user = user;
                  });
                },
                child: Text('Login with Facebook'),
              )
            : Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Logged in as: ${_user!.displayName}'),
                  _user!.photoURL != null
                      ? Image.network(_user!.photoURL!)
                      : Container(),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: _logout,
                    child: Text('Logout'),
                  ),
                ],
              ),
      ),
    );
  }
}
