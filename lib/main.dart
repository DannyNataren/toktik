import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:toktik_clean/config/theme/app_theme.dart';
import 'package:toktik_clean/router/router.dart';
import 'package:toktik_clean/user/data/datasource/user_datasource.dart';
import 'package:toktik_clean/user/data/repositories/user_repository.dart';
import 'package:toktik_clean/user/domain/useCases/user_usecases.dart';
import 'package:toktik_clean/user/presentation/login/login_screen.dart';
import 'package:toktik_clean/user/presentation/providers/user.provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final _userDataSource = UserDataSourceImpl();
    final _userRepository = UserRepositoryImpl(userDataSource: _userDataSource);
    final userUsesCase = UserUseCases(_userRepository);
    return MultiProvider(providers: [
      ChangeNotifierProvider(create: (_) => DiscoverUserProvider(userUseCases: userUsesCase))
    ],
    child: MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'TokTik',
      theme: AppTheme().getTheme(),
      home: LoginScreen(),
    ));
  }
}
