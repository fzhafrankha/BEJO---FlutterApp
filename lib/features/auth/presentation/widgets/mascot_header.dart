import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

/// Ilustrasi maskot "Bejo" di bagian atas layar auth (Login/Register/OTP) —
/// diambil dari Figma `fileKey=0OVVdxVP3LKaQ9Cyxxrs26`, di-download & commit
/// sebagai SVG lokal (`assets/images/mascot/bejo_atas.svg`) karena URL asset
/// Figma expire ~7 hari.
class MascotHeader extends StatelessWidget {
  final double height;

  const MascotHeader({super.key, this.height = 260});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: double.infinity,
      child: Transform.rotate(
        angle: 0.08,
        child: SvgPicture.asset(
          'assets/images/mascot/bejo_atas.svg',
          height: height,
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}
