# Universal Cloud Database Setup — Raid Report

इस version में local data के साथ **shared cloud database** का विकल्प जोड़ा गया है। इससे एक ही Supabase database से जुड़े कई Android phones/app installations में वही Raid Report entries दिखाई जा सकती हैं।

## जरूरी बात
ZIP अकेले cloud database नहीं बना सकता। एक Supabase project बनाना और उसका URL + anon/publishable key `www/cloud-config.js` में डालना जरूरी है। **Service-role/secret key कभी भी ऐप में न डालें।**

## 1. Supabase project
Supabase में नया project बनाएं और SQL Editor खोलें। नीचे का SQL चलाएं:

```sql
create table if not exists public.raid_entries (
  id text primary key,
  entry_by text,
  date text,
  entity text,
  item text,
  complainant text,
  accused text,
  permission text,
  officials text,
  fir text,
  station text,
  photo text,
  updated_at timestamptz default now()
);

alter table public.raid_entries enable row level security;

-- Quick shared-database mode:
-- सभी ऐप users एक ही shared dataset देख सकते हैं।
-- Production/official use में Auth + per-user/per-role policies लगाना बेहतर है.
create policy "shared read" on public.raid_entries for select using (true);
create policy "shared insert" on public.raid_entries for insert with check (true);
-- Public users can submit entries and read the shared dataset.
-- Delete/update are intentionally NOT enabled for public users.

```

> **Security note:** ऊपर की policies shared/open mode हैं। Official sensitive data के लिए इसे production में बिना authentication के इस्तेमाल न करें। अगला upgrade username/password + role based access के साथ करना चाहिए।

## 2. App में URL/key डालें
`www/cloud-config.js` में:

```js
window.RAID_CLOUD = {
  url: 'https://YOUR_PROJECT.supabase.co',
  anonKey: 'YOUR_SUPABASE_ANON_OR_PUBLISHABLE_KEY',
  table: 'raid_entries'
};
```

Supabase Dashboard → Project Settings → API से Project URL और **anon/publishable** key लें। Service role key नहीं।

## 3. Build

```bash
npm install
npx cap sync android
cd android
./gradlew assembleDebug
```

## 4. फोन पर इस्तेमाल
1. कोई भी व्यक्ति ऐप खोलकर **New Entry** में Entry By/अन्य विवरण भरकर **Save New Entry** कर सकता है। Cloud configured होने पर Entry अपने-आप Cloud में Submit हो जाएगी.
2. आपके फोन में **दूसरे फोन से Data लोड करें** दबाने पर सभी submitted Entries दिखाई देंगी.
3. दोनों phones में उसी Supabase project का URL/key रहने से shared database मिलेगा.
4. नया data डालने के बाद **Cloud Sync / Upload** करें; दूसरे phone पर **दूसरे फोन से Data लोड करें**.

## अगला सुरक्षित upgrade
अगर data सरकारी/official है, shared-open policy की जगह **Username + Password + Admin/User roles + Row Level Security** लगाना चाहिए। इससे हर user को केवल अनुमति वाला data दिखाया जा सकता है।
