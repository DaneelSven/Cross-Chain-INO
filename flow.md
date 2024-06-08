# Cross-Chain Initial NFT Offering with Account Abstraction

This guide outlines the implementation of a cross-chain Initial NFT Offering (INO) with account abstraction where the admin pays for all gas fees.

## Key Components

1. **User**: The participant in the NFT sale who wants to purchase an NFT.
2. **Trusted Forwarder**: A contract that facilitates meta-transactions by forwarding signed user operations to the sale contract.
3. **Relayer**: An entity (admin) that submits user-signed transactions to the blockchain, paying for the gas fees.
4. **CrossChainNFT**: The ERC721 NFT contract where the NFTs are minted.
5. **CrossChainNFTSale**: The sale contract that manages the NFT sale.
6. **Blockchain A and Blockchain B**: Two different blockchain networks involved in the cross-chain INO.

## Flow of Interactions

1. **User signs a meta-transaction**:
   - The user signs a transaction off-chain that indicates their intention to buy an NFT.
   - This transaction includes details such as the user’s address, the amount of ETH being sent, and a nonce to prevent replay attacks.

2. **User sends signed meta-transaction to the Trusted Forwarder**:
   - The user sends the signed meta-transaction to the Trusted Forwarder.

3. **Trusted Forwarder verifies and forwards the transaction to the Relayer**:
   - The Trusted Forwarder verifies the signature and forwards the transaction to the Relayer for execution.

4. **Relayer submits the transaction to the blockchain**:
   - The Relayer submits the transaction to the blockchain, paying the gas fees.
   - The transaction invokes the `buyNFT` function on the `CrossChainNFTSale` contract.

5. **CrossChainNFTSale contract processes the transaction**:
   - The `buyNFT` function verifies that the sale is active and that the correct amount of ETH is sent.
   - The contract then calls the `createNFT` function on the `CrossChainNFT` contract to mint the NFT.

6. **CrossChainNFT contract mints the NFT**:
   - The `createNFT` function mints the NFT and assigns it to the user’s address.
   - An event is emitted indicating that the NFT has been successfully purchased and minted.

7. **User receives the NFT**:
   - The user’s wallet now contains the newly minted NFT.

## Diagram

Here’s a visual representation of the flow:

      +-----------+          +---------------------+          +-------------+
      |           |          |                     |          |             |
      |   User    | <------> |  Trusted Forwarder  | <------> |   Relayer   |
      |           |          |                     |          |             |
      +-----------+          +---------------------+          +-------------+
            |                           |                           |
            |                           |                           |
            v                           v                           v
      +-----------+          +---------------------+          +-------------+
      |           |          |                     |          |             |
      | CrossChain| <------> | CrossChainNFTSale   | <------> | Blockchain A|
      |    NFT    |          |                     |          |             |
      |           |          |                     |          |             |
      +-----------+          +---------------------+          +-------------+
            ^                                                         |
            |                                                         |
            +---------------------------------------------------------+
                                  Interacts with




## Detailed Steps

1. **User Interaction**:
   - **User**: Signs a transaction off-chain.
   - **Meta-Transaction**: Contains the user’s intent to purchase an NFT.

2. **Trusted Forwarder**:
   - **Verification**: Checks the signature.
   - **Forwarding**: Sends the transaction to the Relayer.

3. **Relayer**:
   - **Submission**: Submits the transaction to the blockchain, paying gas fees.
   - **Invokes**: Calls `buyNFT` on the `CrossChainNFTSale` contract.

4. **CrossChainNFTSale**:
   - **Validation**: Verifies sale conditions.
   - **Minting**: Calls `createNFT` on `CrossChainNFT`.

5. **CrossChainNFT**:
   - **Minting**: Mints the NFT and assigns it to the user.
   - **Event**: Emits an event indicating successful minting.

6. **Blockchain Interaction**:
   - **Execution**: The transaction is processed and recorded on the blockchain.

7. **User Receives NFT**:
   - **NFT Assignment**: The user’s wallet receives the NFT.
