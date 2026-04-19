import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'firebase_options.dart';
import 'core/services/local_storage_service.dart';
import 'core/services/router_service.dart';
import 'core/theme/app_theme.dart';
import 'core/services/notification_service.dart';
import 'core/services/firestore_service.dart';
import 'app/home/controllers/routine_controller.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  // Initialize Firebase
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  // Initialize Local Storage
  final storageService = LocalStorageService();
  await storageService.init();
  await storageService.openBoxes();

  // Initialize Notifications
  await NotificationService.init();
  _setupDefaultReminders();

  // Initialize Firestore Service
  final firestoreService = FirestoreService();

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => RoutineController(storageService, firestoreService),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

void _setupDefaultReminders() {
  NotificationService.scheduleReminder(
    id: 1,
    title: "🌅 Morning Discipline",
    body: "Time to wake up (5:30 AM), pray, and start your routine!",
    hour: 5,
    minute: 30,
  );
  NotificationService.scheduleReminder(
    id: 2,
    title: "💪 Evening Workout",
    body: "Time for your daily activity. Keep the streak alive!",
    hour: 17,
    minute: 0,
  );
  NotificationService.scheduleReminder(
    id: 3,
    title: "😴 Rest & Recover",
    body: "Prepare for sleep before 11 PM. No phone now!",
    hour: 22,
    minute: 30,
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'My Fitness',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.darkTheme,
      routerConfig: RouterService.router,
    );
  }
}
