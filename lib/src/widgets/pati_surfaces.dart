import 'package:flutter/material.dart';
import '../design/pati_theme.dart';

class PatiSectionHeader extends StatelessWidget {
  const PatiSectionHeader({
    super.key,
    required this.title,
    this.trailing,
    this.subtitle,
  });

  final String title;
  final String? subtitle;
  final Widget? trailing;

  @override
  Widget build(BuildContext context) => Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: Theme.of(context).textTheme.titleLarge),
                if (subtitle != null) ...[
                  const SizedBox(height: 3),
                  Text(
                    subtitle!,
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: Theme.of(context).colorScheme.onSurfaceVariant,
                        ),
                  ),
                ],
              ],
            ),
          ),
          if (trailing != null) trailing!,
        ],
      );
}

class PatiSoftCard extends StatelessWidget {
  const PatiSoftCard({
    super.key,
    required this.child,
    this.padding = const EdgeInsets.all(PatiSpace.lg),
    this.color,
  });

  final Widget child;
  final EdgeInsetsGeometry padding;
  final Color? color;

  @override
  Widget build(BuildContext context) => Container(
        padding: padding,
        decoration: BoxDecoration(
          color: color ?? Theme.of(context).colorScheme.surface,
          borderRadius: BorderRadius.circular(PatiRadius.large),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(
                alpha: Theme.of(context).brightness == Brightness.dark ? .16 : .035,
              ),
              blurRadius: 28,
              offset: const Offset(0, 10),
            ),
          ],
        ),
        child: child,
      );
}

class PetPhotoSurface extends StatelessWidget {
  const PetPhotoSurface({
    super.key,
    this.photo,
    this.borderRadius = PatiRadius.hero,
    this.child,
    required this.semanticLabel,
  });

  final ImageProvider? photo;
  final double borderRadius;
  final Widget? child;
  final String semanticLabel;

  @override
  Widget build(BuildContext context) {
    final dark = Theme.of(context).brightness == Brightness.dark;
    return Semantics(
      image: true,
      label: semanticLabel,
      // The localized label is the single accessibility representation of this
      // composite visual. Decorative fallback art and hero-overlay text should
      // not be announced a second time by VoiceOver/TalkBack.
      excludeSemantics: true,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(borderRadius),
        child: Stack(
          fit: StackFit.expand,
          children: [
            if (photo != null)
              Image(image: photo!, fit: BoxFit.cover)
            else
              DecoratedBox(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: dark
                        ? const [Color(0xFF34453B), Color(0xFF18221C)]
                        : const [Color(0xFFD8E5DC), Color(0xFFABC6B5)],
                  ),
                ),
                child: Stack(
                  children: [
                    Positioned(
                      right: -34,
                      top: -26,
                      child: _softOrb(
                        150,
                        PatiColors.peach.withValues(alpha: .22),
                      ),
                    ),
                    Positioned(
                      left: -24,
                      bottom: -36,
                      child: _softOrb(
                        170,
                        Colors.white.withValues(alpha: .14),
                      ),
                    ),
                    Center(
                      child: Icon(
                        Icons.pets_rounded,
                        size: 92,
                        color: Colors.white.withValues(alpha: .88),
                      ),
                    ),
                  ],
                ),
              ),
            if (child != null) child!,
          ],
        ),
      ),
    );
  }

  Widget _softOrb(double size, Color color) => Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
          color: color,
          shape: BoxShape.circle,
        ),
      );
}

class PatiIconTile extends StatelessWidget {
  const PatiIconTile({
    super.key,
    required this.icon,
    required this.label,
    required this.onTap,
    this.semanticHint,
  });

  final IconData icon;
  final String label;
  final VoidCallback onTap;
  final String? semanticHint;

  @override
  Widget build(BuildContext context) => Semantics(
        button: true,
        label: label,
        hint: semanticHint,
        // The visible icon/text remain visual children, while the explicit
        // localized label + hint form one predictable screen-reader control.
        excludeSemantics: true,
        child: InkWell(
          borderRadius: BorderRadius.circular(PatiRadius.medium),
          onTap: onTap,
          child: SizedBox(
            width: 72,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: 52,
                  height: 52,
                  decoration: BoxDecoration(
                    color: PatiColors.sage.withValues(
                      alpha: Theme.of(context).brightness == Brightness.dark ? .22 : .12,
                    ),
                    borderRadius: BorderRadius.circular(18),
                  ),
                  child: Icon(
                    icon,
                    color: PatiColors.sageDeep,
                    size: 22,
                  ),
                ),
                const SizedBox(height: 7),
                Text(
                  label,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.labelMedium?.copyWith(
                        fontWeight: FontWeight.w700,
                      ),
                ),
              ],
            ),
          ),
        ),
      );
}
