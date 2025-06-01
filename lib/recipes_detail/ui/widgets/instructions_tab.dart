import 'package:flutter/material.dart';
import 'package:nutrichef/core/config/ui/app_theme.dart';
import 'package:nutrichef/recipes_detail/ui/widgets/instruction_step.dart';

class InstructionsTab extends StatelessWidget {
  final List<String> instructions;

  const InstructionsTab({
    super.key,
    required this.instructions,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppTheme.backgroundColor,
      child: ListView.builder(
        physics: const ClampingScrollPhysics(),
        padding: const EdgeInsets.all(20),
        itemCount: instructions.length,
        itemBuilder: (context, index) {
          return InstructionStep(
            instruction: instructions[index],
            stepNumber: index + 1,
          );
        },
      ),
    );
  }
}
