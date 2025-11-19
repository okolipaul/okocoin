# okocoin

A simple fungible token smart contract for the Stacks blockchain, built with [Clarinet](https://github.com/hirosystems/clarinet).

## Project structure

- `LICENSE` – project license
- `README.md` – this documentation
- `clarinet/` – Clarinet project for the `okocoin` smart contract
  - `Clarinet.toml` – Clarinet project configuration
  - `contracts/okocoin.clar` – main Clarity smart contract
  - `tests/okocoin.test.ts` – TypeScript tests scaffold

## okocoin contract

The `okocoin` contract is a basic fungible token with:

- `okocoin` FT definition via `define-fungible-token`
- Owner-controlled minting
- Standard transfers between principals
- Optional burning by token holders
- Simple read-only endpoints for balances and total supply

### Key functions

- `get-owner()` – returns the contract owner principal
- `transfer(amount, sender, recipient)` – transfers tokens from `sender` to `recipient` (must be called by `sender`)
- `mint(amount, recipient)` – mints new tokens to `recipient` (owner only)
- `burn(amount, owner-)` – burns tokens from `owner-` (must be called by `owner-`)
- `get-balance(account)` – returns the balance of `account`
- `get-total-supply()` – returns the total minted supply

## Development

All Clarinet commands should be run from the `clarinet/` directory.

```bash
cd clarinet
```

### Check contracts

```bash
clarinet check
```

Runs the Clarity analyzer and ensures the `okocoin` contract type-checks.

### Console / REPL

```bash
clarinet console
```

Loads the contracts into a REPL so you can manually call functions, inspect balances, and experiment.

### Tests

TypeScript tests are scaffolded in `clarinet/tests/okocoin.test.ts`.

Install dependencies and run tests with:

```bash
cd clarinet
npm install
npm test
```

## Deployment

This repository focuses on local development with Clarinet. To deploy `okocoin` to a Stacks network:

1. Configure desired network in `clarinet/settings/*.toml`.
2. Use `clarinet deployments` / Devnet/Testnet flows as described in the Clarinet docs.

Refer to the official documentation for up-to-date deployment guides:
https://docs.hiro.so/clarinet
