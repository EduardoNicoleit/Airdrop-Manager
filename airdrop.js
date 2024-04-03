require('dotenv').config(); //// Load environment variables from .env file 

const { Web3 } = require('web3'); // Importing Web3 using object destructuring
const AirdropManagerABI = require('./abi/AirdropManager.json'); // ABI of AirdropManager contract
const fs = require('fs');
const infuraURL = process.env.INFURA_URL;
const privateKey = process.env.PRIVATE_KEY;
const contractAddress = process.env.CONTRACT_ADDRESS

// Initialize Web3 with an HTTP provider
const web3 = new Web3(infuraURL);
// Create contract instance
const airdropManagerContract = new web3.eth.Contract(AirdropManagerABI, contractAddress);

// Function to initiate the airdrop
async function initiateAirdrop() {
    const recipientsData = JSON.parse(fs.readFileSync('recipients.json'));
    const recipients = recipientsData.recipients;
    const amounts = recipientsData.amounts;

    // Estimate gas required for the transaction
    const gas = await airdropManagerContract.methods.distributeTokens(recipients, amounts).estimateGas({ from: web3.eth.accounts.wallet[0].address });

    // Send transaction to initiate the airdrop
    const tx = await airdropManagerContract.methods.distributeTokens(recipients, amounts).send({
        from: web3.eth.accounts.wallet[0].address,
        gas: gas
    });

    console.log('Airdrop initiated. Transaction hash:', tx.transactionHash);
}

// Unlock account and initiate airdrop
web3.eth.accounts.wallet.add(privateKey);
initiateAirdrop();
