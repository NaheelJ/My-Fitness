import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';
import '../widgets/guide_card.dart';

class GuidePage extends StatelessWidget {
  const GuidePage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        backgroundColor: AppColors.background,
        appBar: AppBar(
          title: const Text("The Blueprint"),
          centerTitle: true,
          bottom: TabBar(
            isScrollable: true,
            tabAlignment: TabAlignment.start,
            indicatorSize: TabBarIndicatorSize.label,
            labelStyle: const TextStyle(fontWeight: FontWeight.w900, letterSpacing: 0.5),
            unselectedLabelStyle: const TextStyle(fontWeight: FontWeight.w500),
            indicatorColor: AppColors.primary,
            tabs: const [
              Tab(text: "Routine"),
              Tab(text: "Nutrition"),
              Tab(text: "Training"),
              Tab(text: "Rules"),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            _RoutineGuide(),
            _FoodGuide(),
            _WorkoutGuide(),
            _RulesGuide(),
          ],
        ),
      ),
    );
  }
}

class _RoutineGuide extends StatelessWidget {
  const _RoutineGuide();

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(20),
      children: const [
        GuideCard(
          title: "🌅 Morning Routine",
          subtitle: "5:30 AM Wakeup + Prayer",
          content: "Start your day with Fajr prayer and no phone for the first 30 minutes. Drink water immediately after waking up.",
          why: "Sets the tone for discipline and mental clarity.",
          avoid: "Checking social media or hitting snooze.",
        ),
        GuideCard(
          title: "🍳 Breakfast",
          subtitle: "Kerala-style nutrition",
          content: "Options: Puttu + Kadala curry, Chapathi + Omelette, or Appam + Egg curry. Always add a banana or milk.",
          why: "Provides sustained energy for the morning.",
          avoid: "Skipping breakfast or just having tea.",
        ),
        GuideCard(
          title: "🍛 Lunch",
          subtitle: "Balanced Meal",
          content: "Rice with fish/chicken, vegetables, and optional dal.",
          why: "Protein and carbs for muscle recovery and energy.",
          avoid: "Heavy oily snacks or skipping vegetables.",
        ),
        GuideCard(
          title: "😴 Sleep",
          subtitle: "Before 11:00 PM",
          content: "Wind down 30 minutes before bed. No screens.",
          why: "Essential for hormonal balance and recovery.",
          avoid: "Late night scrolling or caffeine after 6 PM.",
        ),
      ],
    );
  }
}

class _FoodGuide extends StatelessWidget {
  const _FoodGuide();

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(20),
      children: const [
        GuideCard(
          title: "💧 Water Intake",
          subtitle: "2.5 – 3.0 Litres Daily",
          content: "Carry a bottle and sip throughout the day. Don't wait to be thirsty.",
          why: "Hydration improves brain function and metabolism.",
          avoid: "Substituting water with sugary drinks.",
        ),
        GuideCard(
          title: "🥚 Protein Sources",
          subtitle: "Essential for 90-day transformation",
          content: "Include eggs, fish, chicken, milk, and pulses in every major meal.",
          why: "Builds and repairs muscle tissue.",
          avoid: "Eating only carbohydrates (only rice/bread).",
        ),
      ],
    );
  }
}

class _WorkoutGuide extends StatelessWidget {
  const _WorkoutGuide();

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(20),
      children: const [
        GuideCard(
          title: "💪 Standard Push-ups",
          subtitle: "3 sets x 12-15 reps",
          content: "Keep your back straight and core engaged. Lower until chest nearly touches floor.",
          why: "Develops upper body strength.",
          avoid: "Arching your back or half-reps.",
        ),
        GuideCard(
          title: "🔥 Plank",
          subtitle: "3 sets x 45-60 seconds",
          content: "Hold a straight line from head to heels on your forearms.",
          why: "Builds core stability and endurance.",
          avoid: "Dropping your hips or looking up.",
        ),
        GuideCard(
          title: "🦵 Squats",
          subtitle: "3 sets x 20 reps",
          content: "Feet shoulder-width apart. Sit back as if into a chair.",
          why: "Strongest muscle group engagement.",
          avoid: "Knees passing toes or rounding back.",
        ),
      ],
    );
  }
}

class _RulesGuide extends StatelessWidget {
  const _RulesGuide();

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(20),
      children: [
        _buildRuleTile(
          context,
          "Rule 1",
          "Missing 1-2 days is allowed. Just get back the next day.",
          AppColors.primary,
        ),
        _buildRuleTile(
          context,
          "Rule 2",
          "Missing 3-6 days activates COMEBACK MODE. Higher focus required.",
          AppColors.warning,
        ),
        _buildRuleTile(
          context,
          "Rule 3",
          "Missing 7 consecutive days resets the system to DAY 1.",
          AppColors.error,
        ),
        const SizedBox(height: 20),
        const GuideCard(
          title: "🚫 Forbidden Habits",
          subtitle: "Non-negotiable for success",
          content: "1. No Phone after 11 PM\n2. Avoid Pornography\n3. Stop Smoking\n4. Sleep before 11 PM",
          why: "These habits drain your dopamine and willpower.",
          avoid: "Thinking 'just one more minute' on the phone.",
        ),
      ],
    );
  }

  Widget _buildRuleTile(BuildContext context, String title, String description, Color color) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: color.withOpacity(0.3)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(color: color, fontWeight: FontWeight.bold, fontSize: 16),
          ),
          const SizedBox(height: 4),
          Text(
            description,
            style: const TextStyle(color: AppColors.textPrimary, fontSize: 14),
          ),
        ],
      ),
    );
  }
}
