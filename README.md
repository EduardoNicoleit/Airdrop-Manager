# Airdrop Manager

## Overview

The AirdropManager consists of a smart contract written in Solidity and a JavaScript script for initiating token airdrops to multiple addresses on the Ethereum blockchain. The project enables efficient distribution of ERC20 tokens to a predefined list of recipients.

### Smart Contract

The AirdropManager smart contract facilitates the management and execution of token airdrops. It allows the contract owner to distribute tokens to multiple addresses and provides functions to withdraw tokens accidentally sent to the contract. Additionally, the contract can receive ERC20 tokens and Ether.

Key Features of the Smart Contract:

- Distribute tokens to multiple addresses.
- Withdraw tokens accidentally sent to the contract.
- Receive ERC20 tokens and Ether.

### JavaScript Script

The JavaScript script interacts with the AirdropManager smart contract to initiate token distributions. It utilizes the Web3 library to connect to the Ethereum network, deploys transactions, and communicates with the smart contract.

Key Features of the JavaScript Script:

- Load environment variables from a `.env` file.
- Initialize Web3 instance with the specified Infura URL.
- Create contract instance of the AirdropManager using ABI and contract address.
- Initiate the airdrop by calling the `distributeTokens` function of the smart contract.
- Read recipient addresses and corresponding token amounts from a JSON file.
- Estimate gas required for the transaction and send it to the smart contract.

## Project Structure

- **Smart Contract:** Contains the Solidity code for the AirdropManager contract (`AirdropManager.sol`).
- **JavaScript Script:** Includes the Node.js script for initiating airdrops (`airdrop.js`).
- **ABI:** Contains the ABI JSON file generated from the AirdropManager contract (`AirdropManager.json`).
- **Environment Variables:** `.env` file stores environment variables such as Infura URL, private key, and contract address.
- **Recipient Data:** `recipients.json` file stores recipient addresses and corresponding token amounts for the airdrop.

## Usage

1. **Smart Contract Deployment:**

   - Deploy the AirdropManager contract to the Ethereum blockchain using a development environment or a public testnet.
   - Note the deployed contract address for configuring the JavaScript script.
2. **Configure Environment Variables:**

   - Create a `.env` file and set the following variables:
     - `INFURA_URL`: URL of the Infura node.
     - `PRIVATE_KEY`: Private key of the Ethereum account.
     - `CONTRACT_ADDRESS`: Address of the deployed AirdropManager contract.
3. **Prepare Recipient Data:**

   - Create a JSON file (`recipients.json`) containing recipient addresses and token amounts.
4. **Initiate Airdrop:**

   - Run the JavaScript script (`airdrop.js`) using Node.js to initiate the token airdrop.

## Security Considerations

- **Private Key Security:** Keep the private key of the Ethereum account secure and do not expose it.
- **Recipient Verification:** Verify recipient addresses and token amounts before initiating the airdrop.
- **Smart Contract Auditing:** Ensure the smart contract functions as intended and is secure from vulnerabilities.
- **Environment Variables:** Safeguard environment variables containing sensitive information.

## Conclusion

The AirdropManager project provides a robust solution for managing and executing token airdrops on the Ethereum blockchain. By combining a smart contract for distribution logic and a JavaScript script for interaction, the project offers flexibility, efficiency, and security in conducting token distributions to multiple addresses.
