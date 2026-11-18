# Каталог инструментов

Каталог получен через MCP `tools/list` из кода, побайтно сверенного с закреплённой ревизией backend. Полные ограничения параметров и схема результата находятся в [api/tools.json](../api/tools.json).

Область каждого вызова — закреплённый набор статьи. Аргументы не являются произвольной загрузкой CSV. Числовые значения по умолчанию нужно интерпретировать вместе с выбранным протоколом.

## `mannich_dataset_overview`

Study: Mannich2026; paper DOI: 10.1038/s41597-026-08287-9; dataset: mannich_2026.
How many asymmetric organocatalytic Mannich reactions, source papers, catalysts and substrates
are in the curated dataset? Recompute identities including R/S axial configurations; audit
missingness, units/ranges, dr ratios, duplicate inputs, charge/heavy-atom inventories and unspecified
product carbon stereo. Full row diagnostics are downloadable; no automatic exclusions or OCR.

| Аргумент | Обязательный | По умолчанию | Допустимые значения |
|---|---|---|---|
| `include_audit` | Нет | `true` | См. JSON Schema |

[Как читать результат](INTEGRATION.md#результат-инструмента).

## `mannich_enantioselectivity_distribution`

Study: Mannich2026; paper DOI: 10.1038/s41597-026-08287-9; dataset: mannich_2026.
Why convert Mannich ee to |ΔΔG‡|? Recompute the Eyring conversion, target distribution and
skewness; check stored values, temperature units and the 99.9% cap. Never conflate ee with dr.

| Аргумент | Обязательный | По умолчанию | Допустимые значения |
|---|---|---|---|
| `include_figures` | Нет | `true` | См. JSON Schema |

[Как читать результат](INTEGRATION.md#результат-инструмента).

## `mannich_reaction_conditions`

Study: Mannich2026; paper DOI: 10.1038/s41597-026-08287-9; dataset: mannich_2026.
What temperatures, solvents, times, yields and catalyst loadings occur in the Mannich data?
Recompute Figure 3 statistics with declared mixture/solvent normalization and missingness.

| Аргумент | Обязательный | По умолчанию | Допустимые значения |
|---|---|---|---|
| `include_figures` | Нет | `true` | См. JSON Schema |

[Как читать результат](INTEGRATION.md#результат-инструмента).

## `mannich_component_classification`

Study: Mannich2026; paper DOI: 10.1038/s41597-026-08287-9; dataset: mannich_2026.
Which catalyst, nucleophile and imine families dominate asymmetric Mannich reactions?
Recompute the paper's ordered SMARTS rules; preserve distinct axial catalysts and count both
unique structures and reaction records. Audit disagreements with deposited catalyst labels.

| Аргумент | Обязательный | По умолчанию | Допустимые значения |
|---|---|---|---|
| `include_figures` | Нет | `true` | См. JSON Schema |

[Как читать результат](INTEGRATION.md#результат-инструмента).

## `mannich_scaffold_diversity`

Study: Mannich2026; paper DOI: 10.1038/s41597-026-08287-9; dataset: mannich_2026.
How many Murcko scaffolds are represented by Mannich catalysts and substrates?
Recompute the three supplementary scaffold populations; distinguish acyclic exclusions,
reaction frequency and unique chemical identities. Axial identity is preserved before grouping.

| Аргумент | Обязательный | По умолчанию | Допустимые значения |
|---|---|---|---|
| `include_figures` | Нет | `true` | См. JSON Schema |

[Как читать результат](INTEGRATION.md#результат-инструмента).

## `mannich_selectivity_heatmaps`

Study: Mannich2026; paper DOI: 10.1038/s41597-026-08287-9; dataset: mannich_2026.
Which Mannich catalyst–substrate classes have high median ee and adequate observation counts?
Recompute both Figure 7 tables. Paper masks n<5; notebook uses n<4. These are descriptive
literature medians, not causal catalyst recommendations or prospective validation.

| Аргумент | Обязательный | По умолчанию | Допустимые значения |
|---|---|---|---|
| `protocol` | Нет | `"paper"` | ["paper", "notebook"] |
| `include_figures` | Нет | `true` | См. JSON Schema |

[Как читать результат](INTEGRATION.md#результат-инструмента).

## `mannich_chemical_space`

Study: Mannich2026; paper DOI: 10.1038/s41597-026-08287-9; dataset: mannich_2026.
How are the 468 Mannich catalysts and substrate pools distributed in chemical space?
Recompute Figures 4/6 Morgan t-SNE coordinates, source identities and class labels.
Notebook catalyst fingerprints omit chirality despite the paper wording; a separately labeled
point-chirality sensitivity mode is available. Axial R/S is not encoded in Morgan bits.

| Аргумент | Обязательный | По умолчанию | Допустимые значения |
|---|---|---|---|
| `population` | Нет | `"catalysts"` | ["catalysts", "reagents"] |
| `protocol` | Нет | `"notebook"` | ["notebook", "chirality_sensitivity"] |
| `include_figures` | Нет | `true` | См. JSON Schema |

[Как читать результат](INTEGRATION.md#результат-инструмента).

## `mannich_catalyst_structure_audit`

Study: Mannich2026; paper DOI: 10.1038/s41597-026-08287-9; dataset: mannich_2026.
Are the Mannich catalyst SDF files consistent with the curated SMILES and axial R/S annotations?
Audit all actual SDF records, explicit point stereochemistry, finite 3-D geometry and axial CIP
evidence. Exclude macOS archive metadata; do not confuse an R/S text property with verified geometry.

| Аргумент | Обязательный | По умолчанию | Допустимые значения |
|---|---|---|---|
| Нет параметров | — | — | — |

[Как читать результат](INTEGRATION.md#результат-инструмента).

## `mannich_reaction_space`

Study: Mannich2026; paper DOI: 10.1038/s41597-026-08287-9; dataset: mannich_2026.
Reconstruct the supplementary Mannich reaction PCA for all curated records. Roles are
reactants=nucleophile+electrophile, agent=catalyst, product=product. Export coordinates,
structural fingerprint bits and PCA loadings. The supplement omits exact fingerprint/PCA
settings; this declared reconstruction is not asserted to reproduce its unknown coordinates.
No OCR, atom mapping or target-informed feature construction is performed.

| Аргумент | Обязательный | По умолчанию | Допустимые значения |
|---|---|---|---|
| `include_agents` | Нет | `true` | См. JSON Schema |
| `include_figures` | Нет | `true` | См. JSON Schema |

[Как читать результат](INTEGRATION.md#результат-инструмента).

## `mannich_regenerate_catalyst_structures`

Study: Mannich2026; paper DOI: 10.1038/s41597-026-08287-9; dataset: mannich_2026.
Regenerate Mannich catalyst SDFs from the curated SMILES and axial labels with the pinned
source ETKDGv3/MMFF94 algorithm (five conformers,20 bridged seeds,seed 42). Return per-record
failures, point/axial checks, aligned RMSD to deposited structures and a downloadable SDF archive.
geometry_verified is a separate corrected protocol using nominated-axis CIP constraints; it never
masquerades as source replay. Default covers all468; filenames optionally selects exact source names.

| Аргумент | Обязательный | По умолчанию | Допустимые значения |
|---|---|---|---|
| `protocol` | Нет | `"source_notebook"` | ["source_notebook", "geometry_verified"] |
| `filenames` | Нет | `null` | См. JSON Schema |

[Как читать результат](INTEGRATION.md#результат-инструмента).
