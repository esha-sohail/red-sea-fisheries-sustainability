# Red Sea Fisheries Sustainability Analytics

Analyzing 70+ years of reconstructed fisheries catch data to assess the sustainability of Saudi Arabia's Red Sea fishery — trends in catch volume, species concentration, unreported/illegal fishing, discards, and economic value.

Inspired by ongoing research into data-driven approaches to Red Sea fisheries and aquatic food system sustainability.

---

## Project Overview

This project explores whether Saudi Arabia's Red Sea fishery shows signs of overfishing, ecosystem stress, or data/reporting gaps using publicly available reconstructed catch data. The analysis moves through nine stages:

1. **Scale** — how has total catch changed since 1950?
2. **Peak & decline** — when did catch peak, and how far below that peak are we now?
3. **Species concentration** — is the fishery becoming reliant on fewer species?
4. **Composition shift** — is the catch shifting toward smaller, lower-trophic-level species ("fishing down the food web")?
5. **Who's fishing** — how has the mix of industrial, artisanal, subsistence, and recreational fishing changed?
6. **Reporting gaps** — what share of catch is unreported, and is this improving or worsening?
7. **Discards** — how much catch is wasted, and by which gear/species?
8. **Economics** — is landed value keeping pace with catch volume?
9. **Data reliability** — where is uncertainty highest, and which findings should be treated cautiously?
10. **Structural change** — how does the fishery today compare to the fishery of the 1950s–70s?

---

## Data Source

- **Source:** [Sea Around Us](https://www.seaaroundus.org/) — Global Fisheries Catch Database
- **Coverage:** Saudi Arabia (Red Sea EEZ), reconstructed catch data, 1950–present
- **Fields used:** year, scientific/common name, functional group, commercial group, fishing entity, fishing sector, catch type, reporting status, gear type, end-use type, tonnes, landed value, uncertainty score
- **License:** Data licensed under [CC BY-NC-SA 4.0](http://creativecommons.org/licenses/by-nc-sa/4.0/). Used here for non-commercial, educational/portfolio purposes.
- **Citation:** Sea Around Us. (2026). *Global Fisheries Catch Data — Saudi Arabia (Red Sea EEZ)*. Retrieved from https://www.seaaroundus.org/

> Note: "Reconstructed" catch data combines officially reported statistics (via FAO FishStat) with estimates of unreported and discarded catch. This is standard methodology for fisheries research in data-limited regions.

---

## Tech Stack

| Layer | Tool |
|---|---|
| Data cleaning & inspection | Excel |
| Data storage & querying | PostgreSQL |
| Dashboard & visualization | Power BI |

---

## Project Structure

```
red-sea-fisheries-sustainability/
│                   
├── sql/
│   ├── schema.sql            # Table creation
│   ├── load_data.sql         # Data import
│   └── queries/                # Individual analysis queries (one .sql file per question)
│
├── dashboard/
│   └── red_sea_fisheries.pbix   # Power BI dashboard file
│
├── docs/
│   └── insights_summary.md      # Written findings and key takeaways
│
└── README.md
```

---

## Key Questions Answered

- How has total catch changed from 1950 to present?
- Which year recorded peak catch, and how far below that peak is the fishery today?
- Which species dominate total catch, and is the fishery becoming more concentrated?
- Has catch composition shifted toward smaller/lower-trophic-level species?
- How has the mix of fishing sectors (industrial/artisanal/subsistence/recreational) changed over time?
- What proportion of catch is unreported, and how has that changed?
- How much catch is discarded, and which gear types/species drive it?
- How has landed value moved relative to catch volume?
- Where is data uncertainty highest, and which conclusions should be treated cautiously?
- How does the fishery's overall structure compare across early, middle, and recent periods?

---

## Key Insights

- Catch has declined 44.6% since its 2010 peak — from 70,964 tonnes (2010) to 39,296 tonnes (2019), following an 8x growth run from 1950-2010.
- The collapse was driven almost entirely by industrial fishing, not a fishery-wide decline — industrial catch fell 66.6% in a single year (2010→2011) and never     recovered, while artisanal catch stayed flat and has grown modestly since.
- The fishery has structurally reverted to its 1950s-70s shape — industrial bottom-trawl demersal fishing once accounted for ~29% of all catch (1980-2009) alone,    then collapsed 89% in the recent period; artisanal fishing is dominant again.
- Clear "fishing down the food web" signal — large sharks, large reef fish, and large pelagics have all shrunk as a share of total catch since the 1950s-70s,        replaced by smaller, lower-trophic-level species. This independently reproduces findings from published Red Sea research (Berumen et al.) on shrinking baselines.
- Bottom trawling drives virtually 100% of discarded catch — 206,554 tonnes (8.25% of all catch ever recorded) was discarded, almost entirely via one non-           selective gear type.
- One species — slipmouths/ponyfishes — accounts for 63% of all discards, with every single tonne ever caught of that species discarded, none landed.
- Unreported catch is at its highest sustained level since the 1950s — averaging ~29% from 2011-2019, coinciding with the shift back toward harder-to-monitor        artisanal fishing.
- Value per tonne dropped and hasn't recovered — falling from $2,396/tonne (2010) to as low as $1,473/tonne (2012), still below 2000s levels by 2019 — the fishery   is catching less, and what it catches is worth less.
- A large share of historical catch was never identified to species level ("Marine fishes not identified" is the single largest category in the dataset, 2.3x the    top named species) — a meaningful data-coverage gap for any species-specific conclusions.
- Data confidence varies by estimation method, not by fishing type — industrial catch estimates carry the highest uncertainty scores despite being the most          formally documented sector, indicating the metric reflects reconstruction methodology rather than real-world monitoring quality.

---

## Dashboard Preview

<img width="1451" height="867" alt="red sea 3" src="https://github.com/user-attachments/assets/2b618a62-de99-46e0-9b21-5530a3533a5a" />


---

## How to Reproduce

1. Download the Saudi Arabia (Red Sea) EEZ dataset from [Sea Around Us](https://www.seaaroundus.org/).
2. Run `sql/01_schema.sql` to create the table structure in PostgreSQL.
3. Run `sql/02_load_data.sql` to load the CSV into the database.
4. Run the queries in `sql/queries/` to reproduce each analysis.
5. Open `dashboard/red_sea_fisheries.pbix` in Power BI and refresh the data connection.

---

## Limitations

- Data for Saudi Arabia only; does not yet cover other Red Sea nations (Egypt, Sudan, Eritrea, Djibouti, Yemen).
- "Unreported catch" figures are modeled estimates, not direct measurements — treat as indicative, not precise.
- Uncertainty scores vary by record; high-uncertainty findings are flagged separately in the analysis.

---

## Author

Esha Sohail — Data Analyst|Data Scientist
