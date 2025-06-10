ARG PYTHON_VERSION=3.13.4
ARG POETRY_VERSION=2.1.3

FROM python:${PYTHON_VERSION}-slim-bookworm AS base

RUN --mount=type=cache,target=/var/lib/apt,sharing=locked \
    --mount=type=cache,target=/var/cache/apt,sharing=locked \
    apt-get update && apt-get -y dist-upgrade && \
    apt-get -y install --no-install-recommends \
    curl && \
    curl -sSL https://install.python-poetry.org | POETRY_VERSION=${POETRY_VERSION} python3 -