# WEB_APP_TEMPLATE

> **Overlay** of `UNIVERSAL_PROJECT_TEMPLATE`. Copy the universal first, then overlay this delta.

## Bootstrap
```powershell
Copy-Item -Recurse "..\UNIVERSAL_PROJECT_TEMPLATE\*" "..\..\01_ACTIVE_PROJECTS\<slug>" -Force
Copy-Item -Recurse ".\*" "..\..\01_ACTIVE_PROJECTS\<slug>" -Force
```

## Stack defaults
| Layer | Choice |
|-------|--------|
| Framework | Next.js 15 (App Router) |
| Lang | TypeScript strict |
| UI | Tailwind + shadcn/ui + Radix |
| Forms | react-hook-form + Zod |
| Data | TanStack Query (client), RSC + server actions (server) |
| Auth | Auth.js or Clerk |
| Analytics | PostHog |
| i18n | next-intl |
| Email | Resend + React Email |
| Hosting | Vercel (Pro for ISR + edge functions) |

## Required additions to project `CLAUDE.md`

```markdown
## Web-specific rules
- Server components by default; client components only for interactivity (`"use client"` at the top).
- Use `<Image>` for all images; never raw <img>.
- Route handlers in `app/api/`; prefer server actions for mutations from forms.
- All forms use react-hook-form + Zod resolver.
- a11y verified with Storybook a11y addon + axe in e2e.
- Web Vitals tracked: LCP <2.5s, INP <200ms, CLS <0.1 on key pages.
- Bundle budget per route: <200KB JS gzipped over the wire.
```

## Folders added
```
app/                     # Next.js App Router
components/              # Shared components
components/ui/           # shadcn primitives
lib/                     # Pure logic, no JSX
hooks/                   # React hooks
public/                  # Static assets
styles/                  # Globals + Tailwind layers
```

## CI extras
- Lighthouse CI per PR with budgets in `lighthouserc.json`
- Playwright e2e with `@axe-core/playwright`
