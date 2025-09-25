import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:uikit/generated/assets.gen.dart';
import 'package:uikit/l10n/app_localizations.dart';
import 'package:uikit/theme/theme_extension.dart';
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
    final l10n = AppLocalizations.of(context);

    final pages = [
      _OnboardingContent(
        title: l10n.onboardingQuranTitle,
        description: l10n.onboardingQuranDesc,
        image: AppAssets.images.imgOnboardingQuran.image(
          fit: BoxFit.contain,
          height: MediaQuery.of(context).size.height * 0.35,
        ),
      ),
      _OnboardingContent(
        title: l10n.onboardingPrayerTitle,
        description: l10n.onboardingPrayerDesc,
        image: AppAssets.images.imgOnboardingPrayerTimes.image(
          fit: BoxFit.contain,
          height: MediaQuery.of(context).size.height * 0.35,
        ),
      ),
      _OnboardingContent(
        title: l10n.onboardingQiblaTitle,
        description: l10n.onboardingQiblaDesc,
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
                          final offsetAnimation = Tween<Offset>(
                            begin: const Offset(0, 0.2), // dari bawah
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
                  padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
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
                              : context.colorScheme.onSurface.withOpacity(0.3),
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
                            context
                                .read<OnboardingBloc>()
                                .add(const OnboardingEvent.skip());
                          },
                          child: Text(l10n.skip),
                        )
                      else
                        const SizedBox(width: 68), // placeholder biar rata

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
                              ? l10n.getStarted
                              : l10n.next,
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

  Widget _buildPage(BuildContext context,
      {required Key key, required _OnboardingContent content}) {
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