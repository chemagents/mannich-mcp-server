# Reproduction questions

Ask these questions through CoScientist after registering the server. Return computed values, cohort definitions, methods, limitations and all generated figures/tables with download URLs and SHA-256 hashes. Download full tables rather than relying on previews.

The tool names below describe expected execution; they are not evidence that a run succeeded. [cases/cases.json](cases/cases.json) contains separate scientific checks; [cases/prompts.jsonl](cases/prompts.jsonl) contains prompts without reference answers. Keep expected numerical values out of blind test prompts.

**M01**

> What is the composition of the asymmetric organocatalytic Mannich dataset in Scientific Data 2026? Recompute reaction, publication, catalyst and reagent counts, preserving axial stereochemistry and explaining deduplication.

Tools: `mannich_dataset_overview`.

**M02**

> Why convert Mannich ee to |ΔΔG‡|? Independently recompute values from ee and temperature, compare the stored column, and show distributions and skewness. Explain the ee=100% limit and the distinction from dr.

Tools: `mannich_enantioselectivity_distribution`.

**M03**

> Which temperatures, solvents, times, yields and catalyst loadings occur in the Mannich dataset? Reproduce the distributions and compare solvent counts with the paper, handling mixtures and synonyms explicitly.

Tools: `mannich_reaction_conditions`.

**M04**

> Which catalyst and reagent classes dominate the Mannich dataset? Recompute SMARTS classification, audit stored labels, and show the most frequent catalyst in each class with its structure and frequency.

Tools: `mannich_component_classification`.

**M05**

> Reproduce chemical-space maps for Mannich catalysts and reagents. Retain the source identity of every point and check how stereochemistry is encoded relative to the paper.

Tools: `mannich_chemical_space`.

**M06**

> How diverse are Mannich catalyst, electrophile and nucleophile scaffolds? Reproduce the supplementary scaffold populations and frequencies, reporting acyclic exclusions and disagreements with published counts separately.

Tools: `mannich_scaffold_diversity`.

**M07**

> Which Mannich catalyst–substrate classes have high median ee? Produce both heatmaps with observation counts and compare the paper and notebook masking rules. Can these observations identify the best catalyst for a new substrate?

Tools: `mannich_selectivity_heatmaps`.

**M08**

> Audit all Mannich catalyst 3-D structures against tabulated SMILES and point/axial stereochemistry. Distinguish graph errors, additional unspecified stereochemistry and unverified absolute R/S. Then reproduce structure generation without OCR.

Tools: `mannich_catalyst_structure_audit`, `mannich_regenerate_catalyst_structures`.

**M09**

> Reconstruct the supplementary PCA of all Mannich reactions. Preserve reagent, catalyst and product roles, and return structural reaction-fingerprint settings, explained variance and coordinates. Disclose missing original settings instead of silently substituting defaults.

Tools: `mannich_reaction_space`.

Record adapter/core revisions, parameters and input hashes with each run. Compare computed results with the article independently of whether the final narrative sounds plausible. See the [README](README.md#reproduction-fidelity) for known discrepancies.
