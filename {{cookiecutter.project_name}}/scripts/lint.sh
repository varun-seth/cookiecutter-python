#!/bin/bash
set -euxo pipefail

poetry run cruft check
poetry run mypy {{cookiecutter.project_name}}/
poetry run isort --check --diff {{cookiecutter.project_name}}/ tests/
poetry run black --check {{cookiecutter.project_name}}/ tests/
poetry run flake8 {{cookiecutter.project_name}}/ tests/
poetry run safety check
poetry run bandit -r {{cookiecutter.project_name}}/
