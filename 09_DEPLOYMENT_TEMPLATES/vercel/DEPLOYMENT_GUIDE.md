# Vercel Deployment Guide

## When to use
Next.js apps. Edge functions. Static + SSR + ISR mix.

## Setup
1. `pnpm dlx vercel link` in the repo
2. Set env vars in Vercel dashboard per environment (dev / preview / production)
3. Connect GitHub repo for auto-deploys

## Branch strategy
- `main` → production
- PRs → preview deploy per PR with unique URL
- Tags → not used; production tracks `main`

## Build config
- Framework preset: Next.js
- Install: `pnpm install --frozen-lockfile`
- Build: `pnpm build`
- Output: `.next`
- Node version: 20.x

## Env vars
- `NEXT_PUBLIC_*` exposed to browser — never put secrets in these
- Use Vercel's encrypted env vars; group per environment

## Custom domain
- Production domain in Vercel → DNS via Vercel or your registrar (CNAME)
- Add HSTS preload after 14-day stability

## Monitoring
- Vercel Speed Insights (Web Vitals)
- Vercel Logs (functions)
- Forward to Sentry / Datadog via OTel exporter
- Set spend cap + budget alert

## Rollback
- "Promote to Production" in Vercel UI on the previous green deploy
- Or `vercel promote <deployment-url> --prod`

## Edge function rules
- Edge runtime: stateless, ≤4MB, no Node APIs requiring full runtime
- Database access from edge: use HTTP-based drivers (Neon serverless, PlanetScale)
- Long-running tasks: queue + worker, not edge

## ISR
- `revalidate` set per route; document in PR
- On-demand revalidation: protected endpoint with secret
