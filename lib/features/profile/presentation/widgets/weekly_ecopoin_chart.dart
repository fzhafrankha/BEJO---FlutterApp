import 'package:flutter/material.dart';

import '../../../../core/theme/app_theme.dart';
import '../../../points_history/data/point_history_models.dart';

const _weekdayLabels = ['Senin', 'Selasa', 'Rabu', 'Kamis', 'Jumat', 'Sabtu', 'Minggu'];

/// Bar chart sederhana tanpa dependency chart eksternal — cukup untuk 7 bar
/// tetap (`GET /points/history/weekly`), lihat Figma node `147:79`.
class WeeklyEcopoinChart extends StatelessWidget {
  final List<DayEarning> days;
  const WeeklyEcopoinChart({super.key, required this.days});

  @override
  Widget build(BuildContext context) {
    final maxEarned = days.fold<int>(0, (acc, d) => d.totalEarned > acc ? d.totalEarned : acc);
    final scaleMax = maxEarned <= 100 ? 100 : ((maxEarned / 20).ceil() + 1) * 20;
    const yLabels = [100, 80, 60, 40, 20, 0];
    final labels = scaleMax == 100 ? yLabels : [scaleMax, (scaleMax * 4 / 5).round(), (scaleMax * 3 / 5).round(), (scaleMax * 2 / 5).round(), (scaleMax / 5).round(), 0];

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(12)),
      child: Column(
        children: [
          SizedBox(
            height: 160,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: labels
                      .map((v) => Text('$v', style: const TextStyle(fontSize: 11, color: Colors.black54)))
                      .toList(),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: days.map((d) {
                      final fraction = scaleMax == 0 ? 0.0 : d.totalEarned / scaleMax;
                      return Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 4),
                          child: FractionallySizedBox(
                            heightFactor: fraction.clamp(0.0, 1.0),
                            alignment: Alignment.bottomCenter,
                            child: Container(
                              decoration: const BoxDecoration(
                                color: AppColors.chartBarPurple,
                                borderRadius: BorderRadius.vertical(top: Radius.circular(6)),
                              ),
                            ),
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 8),
          Row(
            children: days.asMap().entries.map((entry) {
              final date = DateTime.tryParse(entry.value.date);
              final label = date != null ? _weekdayLabels[date.weekday - 1] : '';
              return Expanded(
                child: Text(label, textAlign: TextAlign.center, style: const TextStyle(fontSize: 11, color: Colors.black54)),
              );
            }).toList(),
          ),
          const SizedBox(height: 8),
          const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: 12,
                height: 12,
                child: DecoratedBox(decoration: BoxDecoration(color: AppColors.chartBarPurple)),
              ),
              SizedBox(width: 6),
              Text('Pendapatanmu', style: TextStyle(fontSize: 12, color: Colors.black54)),
            ],
          ),
        ],
      ),
    );
  }
}
