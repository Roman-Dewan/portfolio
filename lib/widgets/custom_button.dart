import 'package:flutter/material.dart';
import '../core/constants/app_colors.dart';
import '../core/constants/app_text_styles.dart';

class CustomButton extends StatefulWidget {
  final String label;
  final VoidCallback onTap;
  final bool isOutlined;

  const CustomButton({
    super.key,
    required this.label,
    required this.onTap,
    this.isOutlined = false,
  });

  @override
  State<CustomButton> createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  bool _isHovered = false;
  bool _isPressed = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: GestureDetector(
        onTapDown: (_) => setState(() => _isPressed = true),
        onTapUp: (_) => setState(() => _isPressed = false),
        onTapCancel: () => setState(() => _isPressed = false),
        onTap: widget.onTap,
        child: AnimatedScale(
          scale: _isPressed ? 0.95 : (_isHovered ? 1.02 : 1.0),
          duration: const Duration(milliseconds: 150),
          curve: Curves.easeOut,
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 16),
            decoration: BoxDecoration(
              gradient: widget.isOutlined
                  ? null
                  : (_isHovered ? AppColors.premiumMixGradient : AppColors.primaryGradient),
              color: widget.isOutlined
                  ? (_isHovered ? AppColors.primary.withValues(alpha: 0.1) : Colors.transparent)
                  : null,
              borderRadius: BorderRadius.circular(30),
              border: Border.all(
                color: widget.isOutlined
                    ? AppColors.primary.withValues(alpha: _isHovered ? 1.0 : 0.5)
                    : Colors.transparent,
                width: 1.5,
              ),
              boxShadow: (!widget.isOutlined && _isHovered)
                  ? [
                      BoxShadow(
                        color: AppColors.primary.withValues(alpha: 0.4),
                        blurRadius: 20,
                        spreadRadius: 2,
                        offset: const Offset(0, 6),
                      )
                    ]
                  : [],
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  widget.label,
                  style: AppTextStyles.monospace(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: widget.isOutlined ? AppColors.primary : AppColors.background,
                  ),
                ),
                const SizedBox(width: 8),
                Icon(
                  widget.isOutlined ? Icons.arrow_forward : Icons.bolt,
                  size: 18,
                  color: widget.isOutlined ? AppColors.primary : AppColors.background,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
