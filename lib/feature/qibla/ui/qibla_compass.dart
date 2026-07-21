import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:flutter_qiblah/flutter_qiblah.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quran_azkar/core/theming/colors.dart';
import 'package:quran_azkar/generated/l10n.dart';

class QiblaCompass extends StatefulWidget {
  const QiblaCompass({super.key});

  @override
  State<QiblaCompass> createState() => _QiblaCompassState();
}

class _QiblaCompassState extends State<QiblaCompass>
    with SingleTickerProviderStateMixin {
  final _deviceSupport = FlutterQiblah.androidDeviceSensorSupport();
  late AnimationController _animationController;
  late Animation<double> _animation;
  double _lastValidQiblah = 0.0;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
    _animation = Tween<double>(begin: 0, end: 0).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeOut),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _deviceSupport,
      builder: (_, AsyncSnapshot<bool?> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(color: ColorsManger.lightGreen),
          );
        }
        if (snapshot.hasError) {
          return Center(
            child: Text(
              'Error: ${snapshot.error.toString()}',
              style: const TextStyle(color: Colors.red),
            ),
          );
        }
        if (snapshot.data == true) {
          return StreamBuilder(
            stream: FlutterQiblah.qiblahStream,
            builder: (_, AsyncSnapshot<QiblahDirection> qiblahSnapshot) {
              if (qiblahSnapshot.connectionState == ConnectionState.waiting &&
                  _lastValidQiblah == 0.0) {
                return const Center(
                  child: CircularProgressIndicator(
                    color: ColorsManger.lightGreen,
                  ),
                );
              }

              if (qiblahSnapshot.hasData) {
                final qiblahDirection = qiblahSnapshot.data!;
                double newQiblah = qiblahDirection.qiblah;

                // Keep animation smooth across the 360/0 degree boundary
                double delta = newQiblah - _lastValidQiblah;
                if (delta > 180) {
                  newQiblah -= 360;
                } else if (delta < -180) {
                  newQiblah += 360;
                }

                _animation =
                    Tween<double>(
                      begin: _animation.value,
                      end: newQiblah * (math.pi / 180),
                    ).animate(
                      CurvedAnimation(
                        parent: _animationController,
                        curve: Curves.easeOut,
                      ),
                    );

                _animationController.forward(from: 0);
                _lastValidQiblah = qiblahDirection.qiblah;
              }

              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      S.of(context).qiblaTitle,
                      style: GoogleFonts.amiriQuran(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                        color: ColorsManger.darlkGreen,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      S.of(context).qiblaDescription,
                      textAlign: TextAlign.center,
                      style: GoogleFonts.cairo(
                        fontSize: 16,
                        color: Colors.grey.shade700,
                      ),
                    ),
                    const SizedBox(height: 50),
                    Stack(
                      alignment: Alignment.center,
                      children: [
                        // Compass Outer Dial Decor
                        Container(
                          width: 300,
                          height: 300,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.3),
                                blurRadius: 15,
                                spreadRadius: 5,
                              ),
                            ],
                          ),
                        ),
                        // Inner Gradient for beauty
                        Container(
                          width: 270,
                          height: 270,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            gradient: SweepGradient(
                              colors: [
                                ColorsManger.lightGreen.withOpacity(0.1),
                                ColorsManger.darlkGreen.withOpacity(0.1),
                                ColorsManger.lightGreen.withOpacity(0.1),
                              ],
                            ),
                          ),
                        ),
                        // The Animated Compass Needle (Pointing to Qibla)
                        AnimatedBuilder(
                          animation: _animation,
                          builder: (context, child) {
                            return Transform.rotate(
                              angle: _animation.value,
                              child: child,
                            );
                          },
                          child: Stack(
                            alignment: Alignment.center,
                            children: [
                              // Needle Design
                              Container(
                                height: 200,
                                width: 8,
                                decoration: BoxDecoration(
                                  color: Colors.grey.shade300,
                                  borderRadius: BorderRadius.circular(4),
                                ),
                              ),
                              Positioned(
                                top: 0,
                                child: Container(
                                  width: 24,
                                  height: 100,
                                  decoration: const BoxDecoration(
                                    color: ColorsManger.darlkGreen,
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(12),
                                      topRight: Radius.circular(12),
                                    ),
                                  ),
                                  child: const Icon(
                                    Icons.arrow_upward,
                                    color: Colors.white,
                                    size: 20,
                                  ),
                                ),
                              ),
                              // Center dot
                              Container(
                                width: 20,
                                height: 20,
                                decoration: const BoxDecoration(
                                  color: Colors.amber,
                                  shape: BoxShape.circle,
                                ),
                              ),
                              // "Kaaba" icon representing Qibla top
                              Positioned(
                                top: 10,
                                child: Container(
                                  width: 14,
                                  height: 14,
                                  decoration: const BoxDecoration(
                                    color: Colors.amber,
                                    shape: BoxShape.circle,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 50),
                    // Angle Text
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 24,
                        vertical: 12,
                      ),
                      decoration: BoxDecoration(
                        color: ColorsManger.darlkGreen.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Text(
                        '${_lastValidQiblah.floor() > 0 ? _lastValidQiblah.floor() : _lastValidQiblah.floor() + 360}°',
                        style: GoogleFonts.cairo(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: ColorsManger.darlkGreen,
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          );
        } else {
          return Center(
            child: Text(
              'Your device does not support compass sensors.',
              style: GoogleFonts.cairo(color: Colors.red, fontSize: 18),
            ),
          );
        }
      },
    );
  }
}
