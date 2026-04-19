import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/constants/task_details.dart';

class DailyTaskCard extends StatelessWidget {
  final String title;
  final String taskKey;
  final bool isCompleted;
  final VoidCallback onToggle;
  final IconData icon;

  const DailyTaskCard({
    super.key,
    required this.title,
    required this.taskKey,
    required this.isCompleted,
    required this.onToggle,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 400),
      curve: Curves.easeInOutCubic,
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: isCompleted ? AppColors.primary.withOpacity(0.08) : AppColors.surface,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(
          color: isCompleted ? AppColors.primary.withOpacity(0.4) : AppColors.glass.withOpacity(0.05),
          width: 1.5,
        ),
        boxShadow: isCompleted ? [
          BoxShadow(
            color: AppColors.primary.withOpacity(0.1),
            blurRadius: 15,
            offset: const Offset(0, 8),
          )
        ] : [],
      ),
      child: Material(
        color: Colors.transparent,
        child: ListTile(
          onTap: () {
            if (isCompleted) {
              // Unchecking is usually okay to do instantly
              onToggle();
            } else {
              _showConfirmDialog(context);
            }
          },
          onLongPress: () {
            HapticFeedback.heavyImpact();
            _showTaskDetails(context);
          },
          contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
          leading: Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              gradient: isCompleted ? AppColors.mainGradient : null,
              color: isCompleted ? null : AppColors.card,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Icon(
              icon,
              color: isCompleted ? Colors.white : AppColors.textSecondary,
              size: 22,
            ),
          ),
          title: Text(
            title,
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  fontWeight: isCompleted ? FontWeight.w700 : FontWeight.w500,
                  color: isCompleted ? AppColors.textPrimary : AppColors.textSecondary,
                  letterSpacing: isCompleted ? 0.2 : 0,
                ),
          ),
          trailing: IconButton(
            icon: Icon(
              Icons.info_outline_rounded,
              color: AppColors.textDimmed.withOpacity(0.5),
              size: 20,
            ),
            onPressed: () {
              HapticFeedback.lightImpact();
              _showTaskDetails(context);
            },
          ),
        ),
      ),
    );
  }

  void _showConfirmDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(
          "Complete Task?",
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.bold,
                color: AppColors.textPrimary,
              ),
        ),
        content: Text(
          "Have you really completed \"$title\"? Honesty is the foundation of discipline. ⚔️",
          style: const TextStyle(color: AppColors.textSecondary, height: 1.5),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("NOT YET", style: TextStyle(color: AppColors.textDimmed)),
          ),
          ElevatedButton(
            onPressed: () {
              HapticFeedback.mediumImpact();
              onToggle();
              Navigator.pop(context);
            },
            style: ElevatedButton.styleFrom(
              minimumSize: const Size(100, 45),
              padding: const EdgeInsets.symmetric(horizontal: 16),
            ),
            child: const Text("YES, DONE"),
          ),
        ],
      ),
    );
  }

  void _showTaskDetails(BuildContext context) {
    final details = TaskDetails.data[taskKey];
    if (details == null) return;

    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      builder: (context) => Container(
        padding: const EdgeInsets.all(24),
        decoration: const BoxDecoration(
          color: AppColors.background,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(32),
            topRight: Radius.circular(32),
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Container(
                width: 40,
                height: 4,
                decoration: BoxDecoration(
                  color: AppColors.textDimmed.withOpacity(0.3),
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
            ),
            const SizedBox(height: 24),
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: AppColors.primary.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Icon(icon, color: AppColors.primary),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Text(
                    details['title']!,
                    style: Theme.of(context).textTheme.displayLarge?.copyWith(fontSize: 24),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 32),
            _buildDetailSection(context, "WHAT TO DO", details['what']!, AppColors.primary),
            if (details.containsKey('images')) ...[
              const SizedBox(height: 24),
              SizedBox(
                height: 180,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemCount: (details['images'] as List).length,
                  separatorBuilder: (context, index) => const SizedBox(width: 16),
                  itemBuilder: (context, index) {
                    final imgPath = (details['images'] as List)[index];
                    return Container(
                      width: 280,
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.05),
                        borderRadius: BorderRadius.circular(24),
                        border: Border.all(color: AppColors.glass.withOpacity(0.1)),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(24),
                        child: Image.asset(
                          imgPath,
                          fit: BoxFit.contain,
                          errorBuilder: (context, error, stackTrace) {
                            return Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Icon(Icons.broken_image_rounded, color: AppColors.error, size: 40),
                                  const SizedBox(height: 8),
                                  Text("Image Load Error", style: TextStyle(color: AppColors.error.withOpacity(0.5))),
                                ],
                              ),
                            );
                          },
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
            const SizedBox(height: 24),
            _buildDetailSection(context, "WHY IT MATTERS", details['why']!, AppColors.secondary),
            const SizedBox(height: 24),
            _buildDetailSection(context, "WHAT TO AVOID", details['avoid']!, AppColors.error),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }

  Widget _buildDetailSection(BuildContext context, String label, String text, Color color) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            color: color,
            fontWeight: FontWeight.w900,
            fontSize: 12,
            letterSpacing: 1.5,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          text,
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: AppColors.textPrimary,
                height: 1.5,
              ),
        ),
      ],
    );
  }
}
