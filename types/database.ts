export interface Category {
  id: string;
  name: string;
  slug: string;
  color: string;
  created_at: string;
}

export interface Card {
  id: string;
  name: string;
  title: string;
  company: string;
  email: string;
  phone: string | null;
  website: string | null;
  category_id: string;
  avatar_seed: string;
  created_at: string;
  updated_at: string;
  category?: Category;
}

export interface Database {
  public: {
    Tables: {
      categories: {
        Row: Category;
        Insert: Omit<Category, 'id' | 'created_at'>;
        Update: Partial<Omit<Category, 'id' | 'created_at'>>;
      };
      cards: {
        Row: Card;
        Insert: Omit<Card, 'id' | 'created_at' | 'updated_at' | 'category'>;
        Update: Partial<Omit<Card, 'id' | 'created_at' | 'category'>>;
      };
    };
  };
}
