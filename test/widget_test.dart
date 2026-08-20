import 'package:flutter_test/flutter_test.dart';

import 'package:natyapp/app/app.dart';
import 'package:natyapp/core/config/app_config.dart';
import 'package:natyapp/core/di/injection.dart';
import 'package:natyapp/core/router/app_router.dart';

void main() {
  testWidgets('renderiza a casca inicial da aplicação', (
    WidgetTester tester,
  ) async {
    configureDependencies();
    await tester.pumpWidget(const NatyApp(
      config: AppConfig.development,
      router: AppRouter(),
    ));

    expect(find.byType(NatyApp), findsOneWidget);
  });
}
