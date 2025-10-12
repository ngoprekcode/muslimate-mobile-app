import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:uikit/generated/assets.gen.dart';
import 'package:uikit/theme/theme_extension.dart';
import 'package:uikit/l10n/l10n_context.dart';
import '../bloc/onboarding/onboarding_bloc.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  final PageController _controller = PageController();
  int _currentPage = 0;

  @override
  Widget build(BuildContext context) {
    final pages = [
      _OnboardingContent(
        title: context.l10n.featureAuthTitleQuran,
        description: context.l10n.featureAuthTextQuranDesc,
        image: AppAssets.images.imgOnboardingQuran.image(
          fit: BoxFit.contain,
          height: MediaQuery.of(context).size.height * 0.35,
        ),
      ),
      _OnboardingContent(
        title: context.l10n.featureAuthTitlePrayer,
        description: context.l10n.featureAuthTextPrayerDesc,
        image: AppAssets.images.imgOnboardingPrayerTimes.image(
          fit: BoxFit.contain,
          height: MediaQuery.of(context).size.height * 0.35,
        ),
      ),
      _OnboardingContent(
        title: context.l10n.featureAuthTitleQibla,
        description: context.l10n.featureAuthTextQiblaDesc,
        image: AppAssets.images.imgOnboardingQibla.image(
          fit: BoxFit.contain,
          height: MediaQuery.of(context).size.height * 0.35,
        ),
      ),
    ];

    return BlocConsumer<OnboardingBloc, OnboardingState>(
      listener: (context, state) {
        state.maybeWhen(
          completed: () {
            context.go('/home');
          },
          orElse: () {},
        );
      },
      builder: (context, state) {
        return Scaffold(
          body: SafeArea(
            child: Column(
              children: [
                // PAGEVIEW
                Expanded(
                  child: PageView.builder(
                    controller: _controller,
                    onPageChanged: (index) {
                      setState(() => _currentPage = index);
                    },
                    itemCount: pages.length,
                    itemBuilder: (_, index) {
                      return AnimatedSwitcher(
                        duration: const Duration(milliseconds: 500),
                        transitionBuilder: (child, animation) {
                          final offsetAnimation =
                              Tween<Offset>(
                                begin: const Offset(0, 0.2),
                                end: Offset.zero,
                              ).animate(
                                CurvedAnimation(
                                  parent: animation,
                                  curve: Curves.easeOutCubic,
                                ),
                              );

                          return FadeTransition(
                            opacity: animation,
                            child: SlideTransition(
                              position: offsetAnimation,
                              child: child,
                            ),
                          );
                        },
                        child: _buildPage(
                          key: ValueKey(index),
                          context,
                          content: pages[index],
                        ),
                      );
                    },
                  ),
                ),

                // DOT INDICATOR
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 24,
                    vertical: 12,
                  ),
                  child: Row(
                    children: List.generate(
                      pages.length,
                      (index) => AnimatedContainer(
                        duration: const Duration(milliseconds: 300),
                        margin: const EdgeInsets.only(right: 8),
                        width: _currentPage == index ? 24 : 8,
                        height: 8,
                        decoration: BoxDecoration(
                          color: _currentPage == index
                              ? context.colorScheme.primary
                              : context.colorScheme.onSurface.withValues(
                                  alpha: 0.3,
                                ),
                          borderRadius: BorderRadius.circular(4),
                        ),
                      ),
                    ),
                  ),
                ),

                // BUTTONS
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      if (_currentPage < pages.length - 1)
                        TextButton(
                          onPressed: () {
                            context.read<OnboardingBloc>().add(
                              const OnboardingEvent.skip(),
                            );
                          },
                          child: Text(context.l10n.featureAuthButtonSkip),
                        )
                      else
                        const SizedBox(width: 68), // biar rata

                      ElevatedButton(
                        onPressed: () {
                          if (_currentPage == pages.length - 1) {
                            context.read<OnboardingBloc>().add(
                              OnboardingEvent.next(
                                nextPage: _currentPage,
                                isLastPage: true,
                              ),
                            );
                          } else {
                            context.read<OnboardingBloc>().add(
                              OnboardingEvent.next(
                                nextPage: _currentPage + 1,
                                isLastPage: false,
                              ),
                            );
                            _controller.nextPage(
                              duration: const Duration(milliseconds: 300),
                              curve: Curves.easeInOut,
                            );
                          }
                        },
                        child: Text(
                          _currentPage == pages.length - 1
                              ? context.l10n.featureAuthButtonGetStarted
                              : context.l10n.featureAuthButtonNext,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildPage(
    BuildContext context, {
    required Key key,
    required _OnboardingContent content,
  }) {
    return Container(
      key: key,
      padding: const EdgeInsets.all(24.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(child: content.image),
          const SizedBox(height: 32),
          Text(
            content.title,
            style: context.textTheme.titleLarge?.copyWith(
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.left,
          ),
          const SizedBox(height: 12),
          Text(
            content.description,
            style: context.textTheme.bodyMedium,
            textAlign: TextAlign.left,
          ),
        ],
      ),
    );
  }
}

class _OnboardingContent {
  final String title;
  final String description;
  final Widget image;

  _OnboardingContent({
    required this.title,
    required this.description,
    required this.image,
  });
}
