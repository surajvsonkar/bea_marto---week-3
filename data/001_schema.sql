-- ============================================================
-- CardVault — Business Card Directory Schema
-- Run this in Supabase SQL Editor
-- ============================================================

-- Enable required extensions
CREATE EXTENSION IF NOT EXISTS "uuid-ossp";

-- ============================================================
-- TABLE: categories
-- ============================================================

CREATE TABLE categories (
  id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
  name TEXT NOT NULL UNIQUE,
  slug TEXT NOT NULL UNIQUE,
  color TEXT NOT NULL DEFAULT '#14b8a6',
  created_at TIMESTAMPTZ NOT NULL DEFAULT now()
);

CREATE INDEX idx_categories_slug ON categories(slug);

-- ============================================================
-- TABLE: cards
-- ============================================================

CREATE TABLE cards (
  id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
  name TEXT NOT NULL,
  title TEXT NOT NULL,
  company TEXT NOT NULL,
  email TEXT NOT NULL,
  phone TEXT,
  website TEXT,
  category_id UUID NOT NULL REFERENCES categories(id) ON DELETE CASCADE,
  avatar_seed TEXT NOT NULL DEFAULT 'default',
  created_at TIMESTAMPTZ NOT NULL DEFAULT now(),
  updated_at TIMESTAMPTZ NOT NULL DEFAULT now()
);

CREATE INDEX idx_cards_name ON cards(name);
CREATE INDEX idx_cards_category ON cards(category_id);
CREATE INDEX idx_cards_created_at ON cards(created_at DESC);

-- ============================================================
-- TRIGGER: auto-update updated_at
-- ============================================================

CREATE OR REPLACE FUNCTION update_updated_at()
RETURNS TRIGGER AS $$
BEGIN
  NEW.updated_at = now();
  RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER cards_updated_at
  BEFORE UPDATE ON cards
  FOR EACH ROW EXECUTE FUNCTION update_updated_at();

-- ============================================================
-- ROW LEVEL SECURITY
-- ============================================================

ALTER TABLE categories ENABLE ROW LEVEL SECURITY;
ALTER TABLE cards ENABLE ROW LEVEL SECURITY;

-- Categories: publicly readable
CREATE POLICY "Categories are publicly readable"
  ON categories FOR SELECT
  USING (true);

-- Cards: publicly readable
CREATE POLICY "Cards are publicly readable"
  ON cards FOR SELECT
  USING (true);

-- Cards: only authenticated users can insert
CREATE POLICY "Authenticated users can insert cards"
  ON cards FOR INSERT
  TO authenticated
  WITH CHECK (true);

-- Cards: only authenticated users can update
CREATE POLICY "Authenticated users can update cards"
  ON cards FOR UPDATE
  TO authenticated
  USING (true)
  WITH CHECK (true);

-- Cards: only authenticated users can delete
CREATE POLICY "Authenticated users can delete cards"
  ON cards FOR DELETE
  TO authenticated
  USING (true);

-- Categories: only authenticated users can modify
CREATE POLICY "Authenticated users can insert categories"
  ON categories FOR INSERT
  TO authenticated
  WITH CHECK (true);
