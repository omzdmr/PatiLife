enum AdPlacement {
  todayAfterCare,
  diaryDeepFeed,
  lowRiskEndOfContent,
}

/// Domain/UI boundary only. No ad SDK belongs in care or health features.
abstract interface class AdSlotController {
  bool shouldShow(AdPlacement placement);
}

final class DisabledAdSlotController implements AdSlotController {
  const DisabledAdSlotController();
  @override
  bool shouldShow(AdPlacement placement) => false;
}
