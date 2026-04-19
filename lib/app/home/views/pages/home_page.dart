import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import '../../controllers/routine_controller.dart';
import '../../../../core/theme/app_colors.dart';
import '../widgets/daily_task_card.dart';
import '../widgets/progress_header.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<RoutineController>().init();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [AppColors.background, AppColors.surface],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SafeArea(
          child: Consumer<RoutineController>(
            builder: (context, controller, child) {
              if (controller.currentDay == null) {
                return const Center(child: CircularProgressIndicator());
              }

              final day = controller.currentDay!;

              return CustomScrollView(
                physics: const BouncingScrollPhysics(),
                slivers: [
                  const SliverToBoxAdapter(
                    child: ProgressHeader(),
                  ),
                  SliverPadding(
                    padding: const EdgeInsets.all(24),
                    sliver: SliverList(
                      delegate: SliverChildListDelegate([
                        _buildGreeting(),
                        const SizedBox(height: 32),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            _buildSectionTitle("Daily Checklist"),
                            _buildLazyButton(context),
                          ],
                        ),
                        const SizedBox(height: 20),
                        DailyTaskCard(
                          title: "Wake up on time (5:30 AM)",
                          taskKey: "wakeUpOnTime",
                          isCompleted: day.wakeUpOnTime,
                          onToggle: () => controller.toggleTask('wakeUpOnTime'),
                          icon: Icons.wb_sunny_rounded,
                        ),
                        DailyTaskCard(
                          title: "Prayer completed",
                          taskKey: "prayerCompleted",
                          isCompleted: day.prayerCompleted,
                          onToggle: () => controller.toggleTask('prayerCompleted'),
                          icon: Icons.mosque_rounded,
                        ),
                        DailyTaskCard(
                          title: "Breakfast",
                          taskKey: "breakfast",
                          isCompleted: day.breakfast,
                          onToggle: () => controller.toggleTask('breakfast'),
                          icon: Icons.breakfast_dining_rounded,
                        ),
                        DailyTaskCard(
                          title: "Lunch",
                          taskKey: "lunch",
                          isCompleted: day.lunch,
                          onToggle: () => controller.toggleTask('lunch'),
                          icon: Icons.lunch_dining_rounded,
                        ),
                        DailyTaskCard(
                          title: "Evening nutrition",
                          taskKey: "eveningNutrition",
                          isCompleted: day.eveningNutrition,
                          onToggle: () => controller.toggleTask('eveningNutrition'),
                          icon: Icons.coffee_rounded,
                        ),
                        DailyTaskCard(
                          title: "Dinner",
                          taskKey: "dinner",
                          isCompleted: day.dinner,
                          onToggle: () => controller.toggleTask('dinner'),
                          icon: Icons.dinner_dining_rounded,
                        ),
                        DailyTaskCard(
                          title: "Workout / Activity",
                          taskKey: "workoutCompleted",
                          isCompleted: day.workoutCompleted,
                          onToggle: () => controller.toggleTask('workoutCompleted'),
                          icon: Icons.fitness_center_rounded,
                        ),
                        DailyTaskCard(
                          title: "No smoking",
                          taskKey: "noSmoking",
                          isCompleted: day.noSmoking,
                          onToggle: () => controller.toggleTask('noSmoking'),
                          icon: Icons.smoke_free_rounded,
                        ),
                        DailyTaskCard(
                          title: "No porn",
                          taskKey: "noPorn",
                          isCompleted: day.noPorn,
                          onToggle: () => controller.toggleTask('noPorn'),
                          icon: Icons.block_rounded,
                        ),
                        DailyTaskCard(
                          title: "Sleep before 11 PM",
                          taskKey: "sleepOnTime",
                          isCompleted: day.sleepOnTime,
                          onToggle: () => controller.toggleTask('sleepOnTime'),
                          icon: Icons.bedtime_rounded,
                        ),
                        const SizedBox(height: 32),
                        _buildCompleteButton(context, controller, day),
                        const SizedBox(height: 60),
                      ]),
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }

  Widget _buildGreeting() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "RISE & CONQUER,",
          style: Theme.of(context).textTheme.bodySmall?.copyWith(
                color: AppColors.primary,
                fontWeight: FontWeight.w900,
                letterSpacing: 3,
              ),
        ),
        const SizedBox(height: 4),
        Text(
          "Master Your Reality ",
          style: Theme.of(context).textTheme.displayLarge?.copyWith(
                fontSize: 32,
                letterSpacing: -1,
                height: 1.1,
              ),
        ),
      ],
    );
  }

  Widget _buildLazyButton(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.card,
        borderRadius: BorderRadius.circular(12),
      ),
      child: IconButton(
        onPressed: () => _showLazyMode(context),
        icon: const Icon(Icons.psychology_rounded, color: AppColors.textSecondary, size: 22),
        tooltip: "Feeling lazy?",
      ),
    );
  }

  Widget _buildCompleteButton(BuildContext context, RoutineController controller, dynamic day) {
    if (day.isLocked) {
      return Container(
        padding: const EdgeInsets.symmetric(vertical: 20),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [AppColors.success.withOpacity(0.2), AppColors.success.withOpacity(0.05)],
          ),
          borderRadius: BorderRadius.circular(24),
          border: Border.all(color: AppColors.success.withOpacity(0.3)),
        ),
        child: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.verified_rounded, color: AppColors.success, size: 24),
            SizedBox(width: 12),
            Text(
              "MISSION ACCOMPLISHED",
              style: TextStyle(
                color: AppColors.success,
                fontWeight: FontWeight.w900,
                letterSpacing: 2,
              ),
            ),
          ],
        ),
      );
    }

    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: AppColors.primary.withOpacity(0.4),
            blurRadius: 25,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: ElevatedButton(
        onPressed: () {
          HapticFeedback.heavyImpact();
          _showCompleteConfirm(context, controller);
        },
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.symmetric(vertical: 20),
          backgroundColor: AppColors.primary,
        ),
        child: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("FINISH DAY"),
            SizedBox(width: 12),
            Icon(Icons.bolt_rounded),
          ],
        ),
      ),
    );
  }

  void _showLazyMode(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("Feeling Lazy?"),
        content: const Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Try these 3 small steps to reset:"),
            SizedBox(height: 16),
            Text("1. Do 10 push-ups right now."),
            Text("2. Drink a glass of water."),
            Text("3. Walk for 5 minutes."),
          ],
        ),
        actions: [
          TextButton(onPressed: () => Navigator.pop(context), child: const Text("I'll try!")),
        ],
      ),
    );
  }

  void _showCompleteConfirm(BuildContext context, RoutineController controller) {
    final completion = controller.currentDay?.completionPercentage ?? 0;
    final isSuccess = completion >= 80;

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(isSuccess ? "Great Job!" : "End Day?"),
        content: Text(isSuccess 
          ? "You've completed ${completion.toInt()}% of your tasks. This counts as a successful day! 🔥"
          : "You've only completed ${completion.toInt()}% of your tasks. Completing the day now will break your streak. Continue?"),
        actions: [
          TextButton(onPressed: () => Navigator.pop(context), child: const Text("Wait")),
          ElevatedButton(
            onPressed: () {
              controller.completeDay();
              Navigator.pop(context);
            },
            child: const Text("Confirm"),
          ),
        ],
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Text(
      title,
      style: Theme.of(context).textTheme.displayLarge?.copyWith(
            fontSize: 22,
            letterSpacing: -0.5,
          ),
    );
  }
}
