# mannich-mcp-server

An MCP server for reproducing and auditing the analyses in:

> Vasechkin, K. V.; Nikitin, I. D.; Fedorov, M. V.
> *A curated comprehensive dataset of asymmetric organocatalytic Mannich reaction.*
> **Scientific Data 2026.**
> https://doi.org/10.1038/s41597-026-08287-9

The server recomputes the data descriptor from the authors’ manually curated table: **4,015 reactions, 27 source fields and 153 normalized publication DOIs**. It preserves reaction records, conditions and axial stereochemical labels. It does not extract reactions from papers again. The dataset and scientific implementation are bundled in the pinned dependency; the analyses run on CPU.

Scientific code and source data are shared through [chem-repro-suite](https://github.com/chemagents/chem-repro-suite/tree/4be1e94c912db7a2790c831fb01d098ad290a88a), pinned to version 0.4.4, commit `4be1e94c912db7a2790c831fb01d098ad290a88a`. This repository supplies the MCP entry point, deployment configuration and checks. Tools operate on the fixed article dataset; they do not accept arbitrary uploaded datasets.

## Tools

| Tool | What it returns |
|---|---|
| `mannich_dataset_overview` | Record counts, molecular identities, missingness and duplicate-input audit |
| `mannich_enantioselectivity_distribution` | ee-to-absolute-ΔΔG‡ conversion, distributions and skewness |
| `mannich_reaction_conditions` | Temperature, solvent, time, yield and catalyst-loading statistics |
| `mannich_component_classification` | Ordered SMARTS classes, source-label audit and representative structures |
| `mannich_chemical_space` | Morgan fingerprint t-SNE maps with source identities and class labels |
| `mannich_scaffold_diversity` | Murcko scaffold populations, frequencies and acyclic exclusions |
| `mannich_selectivity_heatmaps` | Median ee and observation counts by catalyst–substrate class |
| `mannich_catalyst_structure_audit` | Deposited SDF geometry and point/axial stereochemistry checks |
| `mannich_regenerate_catalyst_structures` | Separate source-protocol and geometry-verified conformer generation |
| `mannich_reaction_space` | Explicit reconstruction of the supplementary reaction PCA |

Exact parameters and output schemas are in [api/tools.json](api/tools.json). Each result includes metrics, tables, limitations and provenance. Downloadable artifacts have a URL, byte count and SHA-256; full CSV files accompany table previews. `success` means the computation completed, not that every paper claim matched.

For example, ask CoScientist:

> Recompute the composition of the published Mannich dataset, the ee-to-absolute-ΔΔG‡ conversion, reaction-condition statistics and catalyst/substrate classes. Preserve every record and axial label, list missing values and discrepancies separately, and return the tables and figures.

See [REPRODUCTION_QUESTIONS.md](REPRODUCTION_QUESTIONS.md) for further questions and the tools expected to answer them.

## Reproduction fidelity

| Result | Recomputed result / comparison |
|---|---|
| Reactions / publications | 4,015 / 153 normalized DOIs |
| Catalysts / electrophiles / nucleophiles | 468 / 578 / 538; catalyst identity includes the axial label |
| Median ee / yield / reaction time | 89.4% / 83% / 24 h |
| ee / absolute ΔΔG‡ skewness | −1.547834 / 0.102246; stored conversion agrees to numerical precision |
| Catalyst class labels | No disagreements with the deposited labels |
| Catalyst / electrophile / nucleophile scaffolds | 207 / 114 / 112; the supplement reports 204 catalyst scaffolds |

The 468 catalyst identities correspond to 462 isomeric SMILES; ordinary Morgan bits do not encode axial R/S labels. Solvent counts depend on the definition: 51 non-mixture labels excluding neat conditions, 77 raw strings or 50 grouped categories. These are not interchangeable molecular-identity counts.

Heatmaps mask cells with fewer than 5 observations in `paper` mode and fewer than 4 in `notebook` mode. They describe literature observations, not prospective catalyst performance. The catalyst SDF audit retains unresolved or conflicting axial assignments. Reaction PCA is a declared reconstruction because the supplement does not specify the exact fingerprint and PCA settings.

## Run locally

Requires Git, Python 3.12 and uv:

```bash
git clone https://github.com/chemagents/mannich-mcp-server.git
cd mannich-mcp-server
uv sync --frozen --python 3.12
uv run mannich-mcp-server
```

The default port is 7343. This starts a local development instance; no LLM API key is required by the MCP server.

## Attach to CoScientist

Deploy once on a host reachable by CoScientist and register its Streamable HTTP `/mcp` endpoint. The same service exposes result files at `/files/…`. End users then ask questions through CoScientist.

**No shared hosted endpoint is currently published.** Set `MCP_BASE_URL` to the actual deployment address, without `/mcp`, and generate the configuration:

```bash
uv run python scripts/configure_endpoint.py --base-url "$MCP_BASE_URL"
```

[Deployment, Docker and registration instructions](COSCIENTIST_INTEGRATION.md) cover startup, artifact URLs, optional workers and verification from the client network. [server.json](server.json) records the integration contract and deployment status.

## Tests

```bash
python -m unittest discover -s tests -v
uv run python scripts/smoke_server.py --study mannich
```

[CI](https://github.com/chemagents/mannich-mcp-server/actions/workflows/smoke.yml) checks configuration, startup, tool discovery and artifact downloads in Python and Docker. These checks do not establish full scientific reproduction or acceptance of every CoScientist answer. The English questions define the system evaluation. Current end-to-end runs use local CoScientist fixes for MCP result capture, source access and reporting; they do not certify the unmodified upstream version. Scientific findings and source limitations are reviewed separately from successful execution.

## License / data

Code: [MIT](LICENSE). Source provenance and dataset licenses are listed in the [data manifest](https://github.com/chemagents/chem-repro-suite/blob/4be1e94c912db7a2790c831fb01d098ad290a88a/chem_repro/data/mannich/manifest.json) and [NOTICE](https://github.com/chemagents/chem-repro-suite/blob/4be1e94c912db7a2790c831fb01d098ad290a88a/NOTICE.md). Please cite the article when using its data or results.
