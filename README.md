# Solvers Docker Package

This Docker package includes several solvers to enhance the development process, especially in GitHub workflows. By using this package, you can avoid the repetitive task of installing different solvers across various environments.

## Why Use This Package?

- **Speed Up Development:** Integrate seamlessly with GitHub workflows to streamline your CI/CD pipeline.
- **Consistency:** Ensure the same solver versions are used across different development environments.
- **Convenience:** Avoid the hassle of installing and configuring solvers individually.

## Included Solvers

The following solvers are pre-installed in this package:

| Solver    | Status   |
|-----------|----------|
| Bitwuzla  | Included |
| CVC5      | Included |
| Yices2    | Included |
| Z3        | Included |
| STP       | Included |
| Boolector | Included |

## Getting Started

To use this Docker package, you can pull it from GitHub Packages and run it locally or in your CI/CD pipeline.

### Pulling the Docker Image

```bash
docker pull ghcr.io/emperororokusaki/solvers:latest
```

### Running the docker container

```bash
docker run -it ghcr.io/emperororokusaki/solvers:latest
```

### Example Usage in GitHub Workflow

Here is an example of how to use this Docker package in a GitHub Actions workflow:

```yaml
name: CI

on: [push, pull_request]

jobs:
  build:
    runs-on: ubuntu-latest
    container:
      image: ghcr.io/emperororokusaki/solvers:latest
    steps:
      - name: Checkout code
        uses: actions/checkout@v2

      - name: Run solver
        run: |
          # Example command to run a solver
          z3 -in example.smt2
```

## Projects Using This

> [!Note]
> If your project uses this package, feel free to open a PR and add it!

- [halmos](https://github.com/a16z/halmos)

## Contributions

Contributions are welcome! Please open an issue or submit a pull request if you have any improvements or additions.

## Acknowledgments

This package was initially created for [`halmos`](https://github.com/a16z/halmos) at the request of [karma](https://twitter.com/0xkarmacoma)!