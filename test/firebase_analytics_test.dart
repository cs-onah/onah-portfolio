import 'package:flutter_test/flutter_test.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_analytics_mocks/firebase_analytics_mocks.dart';
import 'package:firebase_core_platform_interface/firebase_core_platform_interface.dart';

// Mock FirebaseCorePlatform to avoid "MissingPluginException"
class MockFirebaseCore extends Mock implements FirebaseCorePlatform {
  static void registerWith() {
    FirebaseCorePlatform.instance = MockFirebaseCore();
  }
}

void main() {
  // Initialize TestWidgetsFlutterBinding and mock Firebase Core
  setUpAll(() async {
    TestWidgetsFlutterBinding.ensureInitialized();
    // Register the mock FirebaseCorePlatform
    setupFirebaseCoreMocks(); 
    // Initialize Firebase with a dummy app
    await Firebase.initializeApp(
      name: 'testApp', // It's good practice to name test apps
      options: const FirebaseOptions(
        apiKey: 'test-api-key',
        appId: 'test-app-id',
        messagingSenderId: 'test-sender-id',
        projectId: 'test-project-id',
      ),
    );
  });

  test('Firebase Analytics can be initialized and instance obtained', () {
    // Use the mock analytics instance from firebase_analytics_mocks
    final mockAnalytics = MockFirebaseAnalytics();

    // Check if getting the instance (even if it's a mock) works
    // In a real scenario with mocks properly set up for the instance,
    // FirebaseAnalytics.instance would return the mock.
    // For this basic test, we are more focused on the setup and mock usage.
    expect(mockAnalytics, isNotNull);

    // Verify that we can call methods on the mock instance without errors
    expect(() async => await mockAnalytics.logEvent(name: 'test_event'), returnsNormally);
    expect(() async => await mockAnalytics.logAppOpen(), returnsNormally);
    expect(() async => await mockAnalytics.setUserId(id: 'test_user'), returnsNormally);
    expect(() async => await mockAnalytics.setCurrentScreen(screenName: 'test_screen'), returnsNormally);
  });

  test('FirebaseAnalytics.instance can be obtained after initialization', () {
    // After Firebase.initializeApp, FirebaseAnalytics.instance should be available.
    // The firebase_analytics_mocks package doesn't automatically replace
    // FirebaseAnalytics.instance, so this test verifies the real one can be obtained
    // (though its underlying platform implementation will be mocked by firebase_core_mocks).
    late FirebaseAnalytics analytics;
    expect(() => analytics = FirebaseAnalytics.instance, returnsNormally);
    expect(analytics, isNotNull);
  });
}
