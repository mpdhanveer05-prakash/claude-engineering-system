# MOBILE_APP_TEMPLATE

> Overlay of `UNIVERSAL_PROJECT_TEMPLATE` for native + cross-platform mobile.

## Stack defaults
| Layer | Choice |
|-------|--------|
| Cross-platform | React Native + Expo (managed) |
| Alternative | Flutter |
| State | Zustand or Redux Toolkit |
| Data | TanStack Query + offline-first persistence |
| Storage | MMKV / Hive |
| Navigation | Expo Router / React Navigation |
| Auth | Expo Auth Session / native SDKs |
| Push | Expo Notifications / FCM + APNs |
| Crash reporting | Sentry RN SDK |
| Analytics | PostHog mobile SDK |
| CI/CD | EAS Build + EAS Submit |

## Required additions to project `CLAUDE.md`

```markdown
## Mobile-specific rules
- Offline-first for core flows; queue mutations and sync on reconnect.
- Battery + bandwidth budgets per feature in `docs/performance/MOBILE_BUDGETS.md`.
- Cold start budget: <2s on iPhone 12 / Pixel 5.
- App size budget: <40MB initial download.
- Targets: iOS 15+, Android 10+ (API 29+).
- Crash-free sessions: ≥99.5% iOS, ≥99% Android.
- All native modules wrapped behind a TS interface so JS code is portable.
- Background tasks declared in app.json; iOS BGTaskScheduler / Android WorkManager.
- Sensitive data: Keychain (iOS) / Keystore (Android); never AsyncStorage.
- Universal links + deep links configured for major flows.
```

## Folders added
```
app/                     # Expo Router routes (or src/screens for RN bare)
components/
hooks/
native-modules/          # Custom native modules
assets/
```

## Release pipeline
- PR → EAS preview build
- Merge → EAS staging build → internal testers
- Tag → EAS production build → store submission
