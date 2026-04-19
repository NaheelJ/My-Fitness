import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../home/controllers/routine_controller.dart';
import '../../../home/models/day_model.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Settings"),
      ),
      body: Consumer<RoutineController>(
        builder: (context, controller, child) {
          return ListView(
            padding: const EdgeInsets.all(20),
            children: [
              _buildSection(
                context,
                "Day Configuration",
                [
                  _buildSettingTile(
                    title: "Holiday Mode",
                    subtitle: "Lighter routine version",
                    trailing: Switch(
                      value: controller.currentDay?.dayType == DayType.holiday,
                      onChanged: (val) {
                        controller.setDayType(val ? DayType.holiday : DayType.working);
                      },
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 24),
              _buildSection(
                context,
                "Notifications",
                [
                  _buildSettingTile(
                    title: "Morning Reminder",
                    subtitle: "5:30 AM – 7:00 AM",
                    trailing: Switch(value: true, onChanged: (val) {}),
                  ),
                  _buildSettingTile(
                    title: "Evening Reminder",
                    subtitle: "4:00 PM – 6:00 PM",
                    trailing: Switch(value: true, onChanged: (val) {}),
                  ),
                  _buildSettingTile(
                    title: "Night Reminder",
                    subtitle: "10:00 PM",
                    trailing: Switch(value: true, onChanged: (val) {}),
                  ),
                ],
              ),
              const SizedBox(height: 24),
              _buildSection(
                context,
                "Body Tracking",
                [
                  _buildSettingTile(
                    title: "Weekly Weight",
                    subtitle: controller.user?.weeklyWeights.isNotEmpty ?? false 
                      ? "Last recorded: ${controller.user?.weeklyWeights.last} kg"
                      : "No data recorded",
                    trailing: IconButton(
                      icon: const Icon(Icons.add_chart_rounded, color: AppColors.primary),
                      onPressed: () => _showWeightPicker(context, controller),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 24),
              _buildSection(
                context,
                "Danger Zone",
                [
                  _buildSettingTile(
                    title: "Restart 90 Days",
                    subtitle: "Reset progress to Day 1",
                    textColor: AppColors.error,
                    onTap: () => _showResetConfirm(context, controller),
                  ),
                  _buildSettingTile(
                    title: "Clear All Data",
                    subtitle: "Wipe all history and settings",
                    textColor: AppColors.error,
                    onTap: () => _showClearConfirm(context, controller),
                  ),
                ],
              ),
            ],
          );
        },
      ),
    );
  }

  Widget _buildSection(BuildContext context, String title, List<Widget> children) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 4, bottom: 12),
          child: Text(
            title.toUpperCase(),
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  letterSpacing: 1.5,
                  fontWeight: FontWeight.bold,
                  color: AppColors.textSecondary,
                ),
          ),
        ),
        Container(
          decoration: BoxDecoration(
            color: AppColors.surface,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            children: children,
          ),
        ),
      ],
    );
  }

  Widget _buildSettingTile({
    required String title,
    required String subtitle,
    Widget? trailing,
    Color? textColor,
    VoidCallback? onTap,
  }) {
    return ListTile(
      onTap: onTap,
      contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      title: Text(
        title,
        style: TextStyle(
          fontWeight: FontWeight.w600,
          color: textColor ?? AppColors.textPrimary,
        ),
      ),
      subtitle: Text(
        subtitle,
        style: const TextStyle(color: AppColors.textSecondary, fontSize: 13),
      ),
      trailing: trailing,
    );
  }

  void _showWeightPicker(BuildContext context, RoutineController controller) {
    final textController = TextEditingController();
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("Record Weight"),
        content: TextField(
          controller: textController,
          keyboardType: TextInputType.number,
          decoration: const InputDecoration(
            hintText: "Enter weight in kg",
            suffixText: "kg",
          ),
        ),
        actions: [
          TextButton(onPressed: () => Navigator.pop(context), child: const Text("Cancel")),
          ElevatedButton(
            onPressed: () {
              final weight = double.tryParse(textController.text);
              if (weight != null) {
                controller.addWeight(weight);
                Navigator.pop(context);
              }
            },
            child: const Text("Save"),
          ),
        ],
      ),
    );
  }

  void _showResetConfirm(BuildContext context, RoutineController controller) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("Restart 90 Days?"),
        content: const Text("This will reset your current day to 1 and clear your streak. Your history will be preserved."),
        actions: [
          TextButton(onPressed: () => Navigator.pop(context), child: const Text("Cancel")),
          ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: AppColors.error),
            onPressed: () {
              controller.resetProgress();
              Navigator.pop(context);
            },
            child: const Text("Reset"),
          ),
        ],
      ),
    );
  }

  void _showClearConfirm(BuildContext context, RoutineController controller) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("Clear All Data?"),
        content: const Text("This action cannot be undone. All history, streaks, and settings will be permanently deleted."),
        actions: [
          TextButton(onPressed: () => Navigator.pop(context), child: const Text("Cancel")),
          ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: AppColors.error),
            onPressed: () {
              controller.clearAllData();
              Navigator.pop(context);
            },
            child: const Text("Clear Everything"),
          ),
        ],
      ),
    );
  }
}
