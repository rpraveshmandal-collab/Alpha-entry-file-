# Raid Report Android App — Import/Export + Universal Cloud Database

Features:
- New Entry form
- JPG photo capture/gallery
- Local data storage
- JSON backup/import
- CSV import/export
- Excel export
- PDF export
- Universal shared cloud database integration (Supabase)
- Cloud Upload and Cloud Download buttons

See `SUPABASE_SETUP.md` before building for cloud synchronization.


## Public Entry / Shared Data
Any person using the app can submit a new entry. If Supabase is configured, the entry is automatically uploaded to the shared cloud database. The owner can load all submitted entries from the Entries screen. Public users are not granted delete/update permissions by the supplied SQL.
