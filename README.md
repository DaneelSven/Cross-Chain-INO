# Cross-Chain Initial NFT Offering with Account Abstraction

This project implements a cross-chain Initial NFT Offering (INO) with account abstraction, where the admin pays for all gas fees. It utilizes Foundry for development, testing, and deployment, and integrates Chainlink oracles to provide reliable and tamper-proof price feeds.

## Project Components

### Contracts

1. **CrossChainNFT**: An ERC721 NFT contract responsible for minting NFTs.
2. **CrossChainNFTSale**: A contract managing the NFT sale, ensuring proper transaction handling.
3. **Trusted Forwarder**: Facilitates meta-transactions by forwarding signed user operations to the sale contract.
4. **Oracle**: Integrates Chainlink oracles to fetch real-time ETH prices.

### Tools and Frameworks

- **Foundry**: A blazing-fast, portable, and modular toolkit for Ethereum application development.
- **Chainlink Oracles**: Provides secure and reliable price feeds for smart contracts.

## Features

1. **Account Abstraction**: Users can interact with the NFT sale contract without directly paying gas fees. The admin (relayer) handles gas fees.
2. **Cross-Chain Capability**: Supports interactions across multiple blockchain networks.
3. **Meta-Transactions**: Allows users to sign transactions off-chain, which are then broadcasted by a trusted relayer.
4. **Chainlink Integration**: Ensures accurate and up-to-date price feeds for transactions.

## Setup and Installation

### Prerequisites

- Node.js and npm
- Foundry
- Environment variables for deployment (`RPC_URL`, `PRIVATE_KEY`)

### Installation

1. **Clone the Repository**:
   ```sh
   git clone https://github.com/your-repo/cross-chain-ino.git
   cd cross-chain-ino


2. install foundry submodules
`git submodule init`
`git submodule update`
