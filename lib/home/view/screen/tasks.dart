import 'package:flutter/material.dart';
import 'package:media/home/view/components/task_plate.dart';

class Tasks extends StatelessWidget {
  const Tasks({super.key});

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          SizedBox(width: 16),
          TaskPlate(
            title: 'Complete your profile to optimize your exposure in job '
                'searches.',
            action: 'Complete profile',
            progress: 0.8,
          ),
          SizedBox(width: 10),
          TaskPlate(
            title:
                'Connect with people you might know and extend your network.',
            action: 'Connect',
            progress: null,
          ),
          SizedBox(width: 10),
          TaskPlate(
            title: 'Get verified as an industry professional.',
            action: 'Get verified',
            progress: null,
          ),
          SizedBox(width: 16),
        ],
      ),
    );
  }
}
