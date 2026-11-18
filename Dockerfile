FROM python:3.12-slim
RUN apt-get update && apt-get install -y --no-install-recommends git libgomp1 libcairo2 libxrender1 libxext6 fonts-dejavu-core && rm -rf /var/lib/apt/lists/*
RUN pip install --no-cache-dir uv==0.7.11
WORKDIR /app
COPY pyproject.toml uv.lock ./
COPY mannich_mcp ./mannich_mcp
RUN uv sync --frozen --no-dev --no-editable
ENV PATH=/app/.venv/bin:$PATH PYTHONUNBUFFERED=1 MPLBACKEND=Agg OPENBLAS_NUM_THREADS=2 OMP_NUM_THREADS=2 CHEM_REPRO_ARTIFACTS_DIR=/outputs
EXPOSE 7343
CMD ["mannich-mcp-server", "--host", "0.0.0.0"]
