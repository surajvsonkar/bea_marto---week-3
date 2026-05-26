# Week 3 — Business Card Directory (CardVault)

A modern, responsive business card directory built with **Next.js 15**, **Supabase**, and **Tailwind CSS v4**. Browse professionals by category, view profiles with DiceBear avatars, and filter through an interactive UI.

## ✨ Features

- **Supabase Integration** — `categories` and `cards` tables with RLS policies
- **Category Filtering** — Color-coded filter pills with "All" button
- **DiceBear Avatars** — Unique adventurer-style avatars for each card
- **Hover Animations** — Glassmorphism cards with lift + glow on hover
- **Sorted by Name** — Cards are alphabetically ordered
- **Responsive Grid** — 1–4 columns depending on screen size
- **Dark Theme** — Teal/emerald accent palette with mesh gradient background
- **Server Components** — Data fetched server-side for optimal performance

## 📁 Project Structure

```
week-03-business-card-directory/
├── app/
│   ├── globals.css          # Tailwind theme + glassmorphism styles
│   ├── layout.tsx           # Root layout with Outfit font
│   └── page.tsx             # Home page (server component)
├── components/
│   ├── Header.tsx           # Hero header with branding
│   ├── CategoryFilter.tsx   # Category filter bar
│   ├── CardGrid.tsx         # Responsive card grid
│   └── BusinessCard.tsx     # Individual card component
├── lib/
│   ├── supabase/
│   │   ├── client.ts        # Browser Supabase client
│   │   └── server.ts        # Server Supabase client
│   └── db/
│       ├── cards.ts         # Cards data access layer
│       └── categories.ts    # Categories data access layer
├── types/
│   └── database.ts          # TypeScript types
├── data/
│   ├── 001_schema.sql       # Database schema + RLS
│   └── 002_seed.sql         # Sample data (8 categories, 21 cards)
├── middleware.ts             # Supabase session refresh
├── .env.example             # Environment variable template
└── README.md                # This file
```

## 🚀 Getting Started

### 1. Install Dependencies

```bash
cd week-03-business-card-directory
npm install
```

### 2. Set Up Supabase

1. Create a project at [supabase.com](https://supabase.com)
2. Go to **SQL Editor** and run:
   - `data/001_schema.sql` (creates tables + RLS policies)
   - `data/002_seed.sql` (inserts sample data)

### 3. Configure Environment

```bash
cp .env.example .env.local
```

Fill in your Supabase keys from **Project Settings → API**:

```env
NEXT_PUBLIC_SUPABASE_URL=https://your-project.supabase.co
NEXT_PUBLIC_SUPABASE_ANON_KEY=your-anon-key
```

### 4. Run Development Server

```bash
npm run dev
```

Open [http://localhost:3000](http://localhost:3000).

## 🌐 Deploy to Vercel

1. Push this folder to a GitHub repository
2. Import the repo in [Vercel](https://vercel.com)
3. Set **Root Directory** to `week-03-business-card-directory` (if in a monorepo)
4. Add the environment variables in Vercel's project settings
5. Deploy

## 🧪 Testing Checklist

- [ ] Page loads and displays all 21 cards sorted by name
- [ ] Category filter pills render for all 8 categories
- [ ] Clicking a category filters the cards correctly
- [ ] "All" button resets the filter and shows all cards
- [ ] DiceBear avatars render for each card
- [ ] Hover animation works (card lifts + glow effect)
- [ ] Responsive layout: 1 col on mobile → 4 cols on desktop
- [ ] Empty state message shows when no cards match a filter
- [ ] Editing a card in Supabase Dashboard reflects after page refresh

## 🎨 Theme

This project uses a **teal/emerald dark theme** with glassmorphism accents — deliberately different from the class demo. Key design choices:

- **Font**: Outfit (Google Fonts)
- **Background**: Dark slate (`#020617`) with mesh gradient
- **Accent**: Teal-400 → Emerald-400 gradient
- **Cards**: Glassmorphism with category-specific color accents
- **Animations**: Framer Motion entrance + CSS hover transforms

## 📝 Notes

- All cards are fetched server-side (React Server Components)
- Category filtering uses URL search params for shareable/bookmarkable URLs
- RLS policies allow public reads; writes require authentication
- No authentication needed for Week 3 — that's added in Week 4
