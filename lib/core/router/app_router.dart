import 'package:flutter/material.dart';
import 'package:natyapp/features/home/presentation/pages/home.dart';
import 'package:natyapp/features/theo/presentation/pages/theo.dart';
import 'package:natyapp/theme/theme.dart';
import 'dart:ui';
import 'app_routes.dart';

class AppRouter {
  const AppRouter();

  Route<dynamic> generateRoute(RouteSettings settings) {
    final route = _routeFromPath(settings.name) ?? AppRoute.notFound;

    switch (route) {
      case AppRoute.home:
        final color = settings.arguments is Color
            ? settings.arguments! as Color
            : AppColors.brandPurple;

        return _pageRoute(HomePage(color: color), settings);
      case AppRoute.notFound:
        return _pageRoute(const _NotFoundPage(), settings);
      case AppRoute.theo:
        return _pageRoute(const TheoPage(), settings);
    }
  }

  Route<dynamic> generateUnknownRoute(RouteSettings settings) {
    return _pageRoute(const _NotFoundPage(), settings);
  }

  AppRoute? _routeFromPath(String? path) {
    for (final route in AppRoute.values) {
      if (route.path == path) {
        return route;
      }
    }
    return null;
  }

  PageRoute<T> _pageRoute<T>(Widget page, RouteSettings settings) {
    return PageRouteBuilder<T>(
      settings: settings,
      pageBuilder: (context, animation, secondaryAnimation) => page,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        return FadeTransition(opacity: animation, child: _HomeBasePage(child: child));
      },
    );
  }
}

class _HomeBasePage extends StatelessWidget {
  const _HomeBasePage({required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: Stack(
        children: [
          Positioned.fill(
            child: child,
          ),
          Positioned(
            height: 90,
            left: 20,
            right: 20,
            bottom: 20,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(70),
              child: BackdropFilter(
                filter: ImageFilter.blur(
                  sigmaX: 18,
                  sigmaY: 18,
                ),
                child: Container(
                 
                  decoration: BoxDecoration(
                    boxShadow:[
                        BoxShadow(
                          color: Colors.black.withValues(alpha: 0.10),
                          blurRadius: 20,
                          offset: const Offset(0, 8),
                        ),
                      ],
                    color: Colors.black.withValues(alpha: 0.12),
                    borderRadius: BorderRadius.circular(35),
                    border: Border.all(
                      color: Colors.black.withValues(alpha: 0.30),
                      width: 1,
                    ),),
                    
                  child: SizedBox(
                    child: Row(
                       
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        IconButton(onPressed:(){Navigator.of(context).pushNamed(AppRoute.home.path, arguments: AppColors.brandPurple);} , icon: Icon(Icons.home)),
                        IconButton(onPressed:(){Navigator.of(context).pushNamed(AppRoute.home.path, arguments: AppColors.brandGreen);} , icon: Icon(Icons.search)),
                        IconButton(onPressed:(){Navigator.of(context).pushNamed(AppRoute.theo.path);} , icon: Icon(Icons.person)),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _NotFoundPage extends StatelessWidget {
  const _NotFoundPage();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          'Página não encontrada',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
      ),
    );
  }
}
