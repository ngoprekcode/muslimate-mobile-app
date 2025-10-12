import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_compass/flutter_compass.dart';
import 'package:uikit/l10n/l10n_context.dart';
import 'package:uikit/theme/theme_extension.dart';
import 'package:core/location/location_service.dart';

import '../bloc/qibla/qibla_bloc.dart';

class QiblaPage extends StatelessWidget {
  const QiblaPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (ctx) => QiblaBloc(LocationService())..add(const QiblaEvent.init()),
      child: const _QiblaView(),
    );
  }
}

class _QiblaView extends StatefulWidget {
  const _QiblaView();

  @override
  State<_QiblaView> createState() => _QiblaViewState();
}

class _QiblaViewState extends State<_QiblaView> with SingleTickerProviderStateMixin {
  late final AnimationController _calibAnimController;

  @override
  void initState() {
    super.initState();
    _calibAnimController = AnimationController(vsync: this, duration: const Duration(seconds: 2))..repeat();
  }

  @override
  void dispose() {
    _calibAnimController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = context.colorScheme;

    return Scaffold(
      appBar: AppBar(
        title: Text(context.l10n.featureQiblaAppBarTitle),
        leading: BackButton(color: colorScheme.onBackground),
        backgroundColor: colorScheme.background,
        elevation: 0,
      ),
      body: SafeArea(
        child: BlocConsumer<QiblaBloc, QiblaState>(
          listener: (context, state) {
            if (state is QiblaPermissionDeniedState) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(context.l10n.featureQiblaPermissionDenied)),
              );
            }

            if (state is QiblaReadyState && state.calibrationRequired) {
              _showCalibrationDialog(context);
            }
          },
          builder: (context, state) {
            return LayoutBuilder(
              builder: (context, constraints) {
                final isWide = constraints.maxWidth > 600;
                return Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: _buildContent(context, state, isWide),
                );
              },
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        label: Text(context.l10n.featureQiblaCalibrationButton),
        icon: const Icon(Icons.explore),
        onPressed: () => _showCalibrationDialog(context, force: true),
      ),
    );
  }

  Widget _buildContent(BuildContext context, QiblaState state, bool isWide) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        if (state is QiblaReadyState) _buildTopInfo(context, state),
        Expanded(child: _buildMainArea(context, state, isWide)),
        const SizedBox(height: 12),
        _buildHelpNotes(context),
      ],
    );
  }

  Widget _buildMainArea(BuildContext context, QiblaState state, bool isWide) {
    final l10n = context.l10n;

    if (state is QiblaLoadingState) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const CircularProgressIndicator(),
            const SizedBox(height: 12),
            Text(l10n.featureQiblaLoadingMessage),
          ],
        ),
      );
    }

    if (state is QiblaPermissionDeniedState) {
      return Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(l10n.featureQiblaPermissionDeniedShort),
            const SizedBox(height: 8),
            ElevatedButton(
              onPressed: () => context.read<QiblaBloc>().add(const QiblaEvent.retry()),
              child: Text(l10n.featureQiblaRetry),
            ),
          ],
        ),
      );
    }

    if (state is QiblaErrorState) {
      return Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('${l10n.featureQiblaErrorPrefix} ${state.message}'),
            const SizedBox(height: 8),
            ElevatedButton(
              onPressed: () => context.read<QiblaBloc>().add(const QiblaEvent.retry()),
              child: Text(l10n.featureQiblaRetry),
            ),
          ],
        ),
      );
    }

    if (state is QiblaReadyState) {
      return Column(
        children: [
          const SizedBox(height: 12),
          Expanded(
            child: Center(
              child: _CompassWidget(
                qiblaAngle: state.qiblaAngle,
                heading: state.currentHeading,
                headingAccuracy: state.headingAccuracy,
              ),
            ),
          ),
        ],
      );
    }

    return Center(child: Text(l10n.featureQiblaPreparing));
  }

  Widget _buildTopInfo(BuildContext context, QiblaReadyState state) {
    final l10n = context.l10n;
    final textTheme = context.textTheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(state.placeName ?? l10n.featureQiblaLocationUnknown, style: textTheme.titleMedium),
        const SizedBox(height: 6),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Flexible(
              flex: 1,
              child: Card(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(l10n.featureQiblaAngle),
                      const SizedBox(height: 6),
                      Text(
                        '${state.qiblaAngle.toStringAsFixed(1)}°',
                        style: textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 4),
                      Text(l10n.featureQiblaLowAccuracyHint, style: textTheme.bodySmall),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(width: 12),
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  children: [
                    const Icon(Icons.compass_calibration),
                    const SizedBox(width: 6),
                    Text(state.headingAccuracy != null
                        ? '${state.headingAccuracy!.toStringAsFixed(1)}° acc'
                        : l10n.featureQiblaNoAccuracy),
                  ],
                ),
                const SizedBox(height: 8),
                if (state.calibrationRequired)
                  Chip(
                    avatar: const Icon(Icons.warning_amber_rounded, color: Colors.white),
                    label: Text(l10n.featureQiblaCalibrationNeeded),
                    backgroundColor: Colors.orange,
                  ),
              ],
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildHelpNotes(BuildContext context) => Card(
    child: Padding(
      padding: const EdgeInsets.all(12),
      child: Text(context.l10n.featureQiblaTips, style: context.textTheme.bodySmall),
    ),
  );

  void _showCalibrationDialog(BuildContext ctx, {bool force = false}) {
    final l10n = ctx.l10n;
    final bloc = ctx.read<QiblaBloc>();

    showDialog(
      context: ctx,
      builder: (context) {
        return AlertDialog(
          title: Text(l10n.featureQiblaDialogTitle),
          content: SingleChildScrollView(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 360),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(
                    height: 90,
                    child: RotationTransition(
                      turns: _calibAnimController,
                      child: const Icon(Icons.phone_iphone, size: 60),
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(l10n.featureQiblaDialogInstruction1, textAlign: TextAlign.center),
                  const SizedBox(height: 8),
                  Text(l10n.featureQiblaDialogInstruction2, textAlign: TextAlign.center),
                ],
              ),
            ),
          ),
          actions: [
            TextButton(onPressed: () => Navigator.pop(context), child: Text(l10n.featureQiblaDialogClose)),
            ElevatedButton(
              onPressed: () {
                bloc.add(const QiblaEvent.calibrationConfirmed());
                Navigator.pop(context);
              },
              child: Text(l10n.featureQiblaDialogDone),
            ),
          ],
        );
      },
    );
  }
}

/// Compass widget included here to avoid "undefined class" errors.
class _CompassWidget extends StatelessWidget {
  final double qiblaAngle;
  final double? heading;
  final double? headingAccuracy;

  const _CompassWidget({
    required this.qiblaAngle,
    required this.heading,
    required this.headingAccuracy,
  });

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final size = MediaQuery.of(context).size.width * 0.7;
    final double widgetSize = size.clamp(220.0, 400.0);

    return StreamBuilder<CompassEvent?>(
      stream: FlutterCompass.events,
      builder: (context, snapshot) {
        final deviceHeading = heading ?? snapshot.data?.heading ?? 0.0;
        final double headingDeg = (deviceHeading.isNaN) ? 0.0 : deviceHeading;
        final double angleToQibla = ((qiblaAngle - headingDeg) + 360) % 360;

        return SizedBox(
          width: widgetSize,
          height: widgetSize,
          child: Stack(
            alignment: Alignment.center,
            children: [
              Transform.rotate(
                angle: (-headingDeg) * (pi / 180),
                child: Container(
                  width: widgetSize,
                  height: widgetSize,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.grey.shade300, width: 2),
                    color: Colors.transparent,
                  ),
                  child: Stack(
                    children: [
                      for (int i = 0; i < 360; i += 10)
                        Positioned.fill(
                          child: Transform.rotate(
                            angle: i * pi / 180,
                            child: Align(
                              alignment: Alignment.topCenter,
                              child: Container(
                                width: 2,
                                height: (i % 90 == 0) ? 14 : 8,
                                color: (i % 90 == 0) ? Colors.black87 : Colors.black26,
                              ),
                            ),
                          ),
                        ),
                      Align(
                        alignment: Alignment.topCenter,
                        child: Padding(
                          padding: const EdgeInsets.only(top: 8.0),
                          child: Text(l10n.featureQiblaCompassNorth, style: context.textTheme.bodySmall),
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              // Qibla marker (fixed relative to dial)
              Transform.rotate(
                angle: (angleToQibla) * (pi / 180),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.arrow_drop_up, size: widgetSize * 0.18, semanticLabel: l10n.featureQiblaCompassQiblaLabel),
                    Container(
                      width: 6,
                      height: widgetSize * 0.15,
                      decoration: BoxDecoration(
                        color: Colors.redAccent,
                        borderRadius: BorderRadius.circular(6),
                      ),
                    ),
                  ],
                ),
              ),

              // center dot
              Container(
                width: 14,
                height: 14,
                decoration: const BoxDecoration(
                  color: Colors.black,
                  shape: BoxShape.circle,
                ),
              ),

              // numeric overlay
              Positioned(
                bottom: 8,
                child: Card(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 12),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text('${l10n.featureQiblaCompassQiblaLabel}: ${qiblaAngle.toStringAsFixed(1)}°',
                            style: context.textTheme.bodyLarge),
                        const SizedBox(height: 4),
                        Text(
                          heading != null
                              ? l10n.featureQiblaCompassHeadingText(heading: heading!)
                              : 'Heading: —°',
                          style: context.textTheme.bodySmall,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}