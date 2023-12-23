import 'package:expenses/user/screens/auth_info_cubit/auth_info_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class FavoriteScreen extends StatefulWidget {
  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  late final AuthenticationCubit authenticationCubit;

  @override
  void initState() {
    super.initState();
    authenticationCubit = context.read<AuthenticationCubit>();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => authenticationCubit..loadAuthenticationStatus(),
      child: Scaffold(
        appBar: AppBar(
          title: Text("Favorite"),
        ),
        body: Column(
          children: [
            Container(
              height: 200,
              child: Column(
                children: [
                  BlocBuilder<AuthenticationCubit, AuthenticationState>(
                    builder: (context, state) {
                      return SwitchListTile(
                        title: Text('Enable Authentication'),
                        value: state.isAuthenticated,
                        onChanged: (value) async {
                          final authenticationCubit = context.read<AuthenticationCubit>();
                          if (value && authenticationCubit.isAuthenticationRequired()) {
                            // Show authentication dialog
                            bool authenticated = await authenticationCubit.showAuthenticationDialog();
                            // Only update the status if the authentication was successful
                            if (authenticated) {
                              authenticationCubit.emit(AuthenticationState(isAuthenticated: true));
                            }
                          } else {
                            // If authentication is not required or the user turns off the switch
                            if (!value) {
                              authenticationCubit.clearAuthenticationStatus();
                            }
                            authenticationCubit.emit(AuthenticationState(isAuthenticated: value));
                          }
                        },
                      );
                    },
                  ),
                  BlocBuilder<AuthenticationCubit, AuthenticationState>(
                    builder: (context, state) {
                      return Visibility(
                        visible: state.isAuthenticated,
                        child: Text(
                          'Authentication is enabled',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.green,
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
            // ... rest of your widget ...
          ],
        ),
      ),
    );
  }

// ... rest of your widget ...
}
