import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../url_helper.dart';
import '../theme.dart';

class HeroSection extends StatefulWidget {
  final VoidCallback? onExploreTap;
  const HeroSection({super.key, this.onExploreTap});

  @override
  State<HeroSection> createState() => _HeroSectionState();
}

class _HeroSectionState extends State<HeroSection>
    with SingleTickerProviderStateMixin {
  late AnimationController _fadeCtrl;
  late Animation<double> _fadeAnim;

  @override
  void initState() {
    super.initState();
    _fadeCtrl = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 900),
    );
    _fadeAnim = CurvedAnimation(parent: _fadeCtrl, curve: Curves.easeOut);
    _fadeCtrl.forward();
  }

  @override
  void dispose() {
    _fadeCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final isWide = width > 900;

    return Container(
      width: double.infinity,
      decoration: const BoxDecoration(
        color: kBlack,
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: isWide ? 60 : 24,
          vertical: 50,
        ),
        child: Column(
          children: [
            // Top Hero Row
            isWide
                ? Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        flex: 5,
                        child: _LeftContent(
                          fadeAnim: _fadeAnim,
                          onExploreTap: widget.onExploreTap,
                        ),
                      ),
                      const SizedBox(width: 40),
                      const Expanded(
                        flex: 5,
                        child: _MascotImage(),
                      ),
                    ],
                  )
                : Column(
                    children: [
                      _LeftContent(
                        fadeAnim: _fadeAnim,
                        onExploreTap: widget.onExploreTap,
                      ),
                      const SizedBox(height: 40),
                      const _MascotImage(),
                    ],
                  ),

            const SizedBox(height: 60),

            // Why TAMIYANOIA Cat Feature Section
            _WhyTamiyanoiaSection(isWide: isWide),
          ],
        ),
      ),
    );
  }
}

class _LeftContent extends StatelessWidget {
  final Animation<double> fadeAnim;
  final VoidCallback? onExploreTap;
  const _LeftContent({required this.fadeAnim, this.onExploreTap});

  void _showWhitepaperDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        backgroundColor: kWhite,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        title: Row(
          children: [
            const Text('🐱 ', style: TextStyle(fontSize: 24)),
            Text(
              'TAMIYANOIA Cat Whitepaper',
              style: GoogleFonts.inter(fontWeight: FontWeight.w700, color: kTextDark),
            ),
          ],
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'One Community. One Ecosystem. One Journey.',
              style: GoogleFonts.inter(color: kPurple, fontWeight: FontWeight.w600, fontSize: 14),
            ),
            const SizedBox(height: 12),
            Text(
              'The official TAMIYANOIA Cat Whitepaper detailing our full vision, BEP-20 tokenomics, ecosystem utility layers, and global roadmap will be released during Phase 01.\n\nJoin our community channels to participate in the early contributor program and receive the first release.',
              style: GoogleFonts.inter(color: kTextMuted, fontSize: 13, height: 1.6),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(ctx).pop(),
            child: Text('Close', style: GoogleFonts.inter(color: kTextMuted)),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: kPurple,
              foregroundColor: Colors.white,
            ),
            onPressed: () {
              Navigator.of(ctx).pop();
              openUrl('https://x.com/tamiyanoia_cat');
            },
            child: const Text('Join Community'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: fadeAnim,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Tagline badge
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
            decoration: BoxDecoration(
              color: kYellow.withOpacity(0.12),
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: kYellow.withOpacity(0.3)),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text('🌍 ', style: TextStyle(fontSize: 14)),
                Text(
                  'From Africa to the World.',
                  style: GoogleFonts.inter(
                    fontSize: 13,
                    fontWeight: FontWeight.w700,
                    color: kYellow,
                    letterSpacing: 0.5,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),

          // Hero Graphic Title
          ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 480, maxHeight: 160),
            child: Image.asset(
              'assets/images/t.png',
              fit: BoxFit.contain,
              alignment: Alignment.centerLeft,
            ),
          ),
          const SizedBox(height: 16),

          // Core Description - Part 1
          Text(
            'A community-driven Web3 ecosystem built around culture, creativity, entertainment, and decentralized participation.',
            style: GoogleFonts.inter(
              fontSize: 15,
              color: kTextMuted,
              height: 1.7,
            ),
          ),
          const SizedBox(height: 20),

          // Emblem in the middle of the writing — centered & large
          Center(
            child: SizedBox(
              height: 280,
              width: 280,
              child: Image.asset(
                'assets/images/afr5.png',
                fit: BoxFit.contain,
              ),
            ),
          ),
          const SizedBox(height: 20),

          // Core Description - Part 2
          Text(
            'TAMIYANOIA Cat brings people together through community, digital culture, blockchain technology, and an ecosystem designed to grow with its members.',
            style: GoogleFonts.inter(
              fontSize: 15,
              color: kTextMuted,
              height: 1.7,
            ),
          ),
          const SizedBox(height: 20),

          // Short Tagline
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
            decoration: BoxDecoration(
              color: kPurpleSoft,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: kPurple.withOpacity(0.25)),
            ),
            child: Text(
              'One Community. One Ecosystem. One Journey.',
              style: GoogleFonts.inter(
                fontSize: 13,
                fontWeight: FontWeight.w600,
                color: kPurpleDark,
                letterSpacing: 0.8,
              ),
            ),
          ),
          const SizedBox(height: 32),

          // CTA Buttons
          Wrap(
            spacing: 12,
            runSpacing: 12,
            children: [
              _HeroCTA(
                label: 'Explore TAMIYANOIA  ↓',
                isPrimary: true,
                onTap: onExploreTap ?? () => openUrl('https://dexscreener.com/bsc/0x8bea530150675c1eC537Bde45c0480164590c898'),
              ),
              _HeroCTA(
                label: 'Join Community',
                iconAsset: 'assets/images/face.png',
                isPrimary: false,
                onTap: () => openUrl('https://x.com/tamiyanoia_cat'),
              ),
              _HeroCTA(
                label: 'Read Whitepaper',
                isPrimary: false,
                onTap: () => _showWhitepaperDialog(context),
              ),
            ],
          ),
          const SizedBox(height: 36),

          // BNB Chain badge & BSC Wallet
          Wrap(
            crossAxisAlignment: WrapCrossAlignment.center,
            spacing: 12,
            runSpacing: 10,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
                decoration: BoxDecoration(
                  border: Border.all(color: kBorderColor, width: 1.2),
                  borderRadius: BorderRadius.circular(10),
                  color: kOffWhite,
                ),
                child: Image.asset(
                  'assets/images/bnb.png',
                  height: 34,
                  fit: BoxFit.contain,
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'BEP-20 on BNB Chain',
                    style: GoogleFonts.inter(
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                      color: kTextMuted,
                      letterSpacing: 0.8,
                    ),
                  ),
                  const SizedBox(height: 3),
                  MouseRegion(
                    cursor: SystemMouseCursors.click,
                    child: GestureDetector(
                      onTap: () => openUrl('https://bscscan.com/token/0x8bea530150675c1eC537Bde45c0480164590c898'),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            'BSC Wallet: 0x8bea...c898',
                            style: GoogleFonts.inter(
                              fontSize: 11,
                              fontWeight: FontWeight.w700,
                              color: kYellow,
                              letterSpacing: 0.5,
                            ),
                          ),
                          const SizedBox(width: 4),
                          Icon(Icons.open_in_new_rounded, size: 12, color: kYellow.withOpacity(0.8)),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _MascotImage extends StatelessWidget {
  const _MascotImage();

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(maxHeight: 560, maxWidth: 620),
      child: Stack(
        alignment: Alignment.center,
        clipBehavior: Clip.none,
        children: [
          // Glow behind mascot
          Container(
            width: 420,
            height: 420,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: RadialGradient(
                colors: [
                  kPurple.withOpacity(0.18),
                  Colors.transparent,
                ],
              ),
            ),
          ),
          // Primary Mascot
          Image.asset(
            'assets/images/grumpolia.png',
            fit: BoxFit.contain,
          ),
        ],
      ),
    );
  }
}

class _WhyTamiyanoiaSection extends StatelessWidget {
  final bool isWide;
  const _WhyTamiyanoiaSection({required this.isWide});

  static const _features = [
    {
      'image': 'assets/images/afr1.png',
      'title': 'Global Community',
      'desc': 'Born from an African community and built for people everywhere.',
      'details': 'TAMIYANOIA Cat is founded with an African soul and built to unite builders, creators, artists, and Web3 enthusiasts across every continent without boundaries.',
    },
    {
      'image': 'assets/images/afr2.png',
      'title': 'Strong Identity',
      'desc': 'TAMIYANOIA Cat has a recognizable character, culture, and community identity.',
      'details': 'From distinctive artwork and memorable characters to vibrant community culture, TAMIYANOIA Cat stands out with authentic brand power and unique style.',
    },
    {
      'image': 'assets/images/afr3.png',
      'title': 'Web3 Powered',
      'desc': 'Blockchain technology provides transparent ownership and on-chain participation.',
      'details': 'Built transparently on BNB Chain (BEP-20) offering decentralized participation, verifiable smart contracts, fast transactions, and low fees.',
    },
    {
      'image': 'assets/images/afr4.png',
      'title': 'Community First',
      'desc': "The community isn't an afterthought — it is the core of the ecosystem.",
      'details': 'Every initiative, feature, and reward is crafted for and driven by our community. Members lead the conversations and shape the future of the ecosystem.',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(28),
      decoration: BoxDecoration(
        color: kOffWhite,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: kBorderColor),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                'Why TAMIYANOIA Cat?',
                style: GoogleFonts.inter(
                  fontSize: 22,
                  fontWeight: FontWeight.w800,
                  color: kTextDark,
                  letterSpacing: -0.5,
                ),
              ),
              const SizedBox(width: 12),
              Container(
                height: 2,
                width: 60,
                color: kYellow,
              ),
            ],
          ),
          const SizedBox(height: 20),
          isWide
              ? Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: _features
                      .map(
                        (f) => Expanded(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: _FeatureCard(
                              image: f['image']!,
                              title: f['title']!,
                              desc: f['desc']!,
                              details: f['details']!,
                            ),
                          ),
                        ),
                      )
                      .toList(),
                )
              : Column(
                  children: _features
                      .map(
                        (f) => Padding(
                          padding: const EdgeInsets.only(bottom: 16),
                          child: _FeatureCard(
                            image: f['image']!,
                            title: f['title']!,
                            desc: f['desc']!,
                            details: f['details']!,
                          ),
                        ),
                      )
                      .toList(),
                ),
        ],
      ),
    );
  }
}

class _FeatureCard extends StatefulWidget {
  final String image;
  final String title;
  final String desc;
  final String details;

  const _FeatureCard({
    required this.image,
    required this.title,
    required this.desc,
    required this.details,
  });

  @override
  State<_FeatureCard> createState() => _FeatureCardState();
}

class _FeatureCardState extends State<_FeatureCard> {
  bool _hovered = false;

  void _openModal() {
    showDialog(
      context: context,
      builder: (ctx) => Dialog(
        backgroundColor: Colors.transparent,
        insetPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
        child: Container(
          constraints: const BoxConstraints(maxWidth: 480),
          decoration: BoxDecoration(
            color: kWhite,
            borderRadius: BorderRadius.circular(24),
            border: Border.all(color: kBorderColor, width: 1.5),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.25),
                blurRadius: 30,
                offset: const Offset(0, 10),
              ),
            ],
          ),
          padding: const EdgeInsets.all(28),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                    decoration: BoxDecoration(
                      color: kPurpleSoft,
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: Text(
                      'WHY TAMIYANOIA CAT',
                      style: GoogleFonts.inter(
                        fontSize: 11,
                        fontWeight: FontWeight.w800,
                        color: kPurpleDark,
                        letterSpacing: 1.1,
                      ),
                    ),
                  ),
                  IconButton(
                    onPressed: () => Navigator.of(ctx).pop(),
                    icon: const Icon(Icons.close, color: kTextMuted),
                    splashRadius: 20,
                  ),
                ],
              ),
              const SizedBox(height: 12),
              Container(
                height: 220,
                alignment: Alignment.center,
                child: Image.asset(
                  widget.image,
                  fit: BoxFit.contain,
                ),
              ),
              const SizedBox(height: 20),
              Text(
                widget.title,
                style: GoogleFonts.inter(
                  fontSize: 24,
                  fontWeight: FontWeight.w800,
                  color: kTextDark,
                  letterSpacing: -0.5,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 10),
              Text(
                widget.desc,
                style: GoogleFonts.inter(
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                  color: kPurple,
                  height: 1.5,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 12),
              Text(
                widget.details,
                style: GoogleFonts.inter(
                  fontSize: 14,
                  color: kTextMuted,
                  height: 1.6,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 24),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () => Navigator.of(ctx).pop(),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: kPurple,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: Text(
                    'Close',
                    style: GoogleFonts.inter(
                      fontWeight: FontWeight.w700,
                      fontSize: 15,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      child: GestureDetector(
        onTap: _openModal,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 180),
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: _hovered ? kWhite : kWhite,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(
              color: _hovered ? kPurple : kBorderColor,
              width: _hovered ? 1.8 : 1,
            ),
            boxShadow: [
              BoxShadow(
                color: _hovered
                    ? kPurple.withOpacity(0.18)
                    : Colors.black.withOpacity(0.04),
                blurRadius: _hovered ? 20 : 8,
                offset: Offset(0, _hovered ? 8 : 3),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: SizedBox(
                  width: 100,
                  height: 100,
                  child: Image.asset(
                    widget.image,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              const SizedBox(height: 16),
              Text(
                widget.title,
                style: GoogleFonts.inter(
                  fontSize: 17,
                  fontWeight: FontWeight.w800,
                  color: kTextDark,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                widget.desc,
                style: GoogleFonts.inter(
                  fontSize: 13,
                  color: kTextMuted,
                  height: 1.5,
                ),
              ),
              const SizedBox(height: 12),
              Row(
                children: [
                  Text(
                    'Learn more',
                    style: GoogleFonts.inter(
                      fontSize: 12,
                      fontWeight: FontWeight.w700,
                      color: kPurple,
                    ),
                  ),
                  const SizedBox(width: 4),
                  Icon(
                    Icons.arrow_forward,
                    size: 13,
                    color: kPurple,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _HeroCTA extends StatefulWidget {
  final String label;
  final bool isPrimary;
  final String? iconAsset;
  final VoidCallback onTap;

  const _HeroCTA({
    required this.label,
    required this.isPrimary,
    this.iconAsset,
    required this.onTap,
  });

  @override
  State<_HeroCTA> createState() => _HeroCTAState();
}

class _HeroCTAState extends State<_HeroCTA> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      child: GestureDetector(
        onTap: widget.onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 180),
          constraints: const BoxConstraints(minHeight: 48),
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
          decoration: BoxDecoration(
            color: widget.isPrimary
                ? (_hovered ? kPurpleDark : kPurple)
                : (_hovered ? kPurpleSoft : Colors.transparent),
            border: Border.all(
              color: widget.isPrimary
                  ? Colors.transparent
                  : (_hovered ? kPurple : kBorderColor),
              width: 1.5,
            ),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (widget.iconAsset != null) ...[
                Image.asset(
                  widget.iconAsset!,
                  width: 24,
                  height: 24,
                  fit: BoxFit.contain,
                ),
                const SizedBox(width: 8),
              ],
              Text(
                widget.label,
                style: GoogleFonts.inter(
                  fontSize: 14,
                  fontWeight: FontWeight.w700,
                  color: widget.isPrimary ? Colors.white : kTextDark,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
