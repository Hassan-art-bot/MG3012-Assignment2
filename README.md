# Campus Notice Board dApp (MG3012 - Assignment 2)

A mini decentralized application: a Solidity smart contract on the **Sepolia testnet** plus a single-page HTML/CSS/JS frontend that talks to it through **MetaMask** and **ethers.js**.

- **Student:** YOUR NAME - YOUR ROLL NO
- **Course:** MG3012 Blockchain Technology for Business (BSFT, 5th Semester)
- **Contract address (Sepolia):** `0x40e72F9ad883f0fa9f56f673E384509A3e9f12B9`
- **Etherscan:** https://sepolia.etherscan.io/address/0x40e72F9ad883f0fa9f56f673E384509A3e9f12B9

## Smart contract functions (`SmartContract.sol`)
| Function | Type | Purpose |
|---|---|---|
| `postNotice(string)` | write | Post a new notice |
| `likeNotice(uint256)` | write | Like a notice (once per address) |
| `getNoticeCount()` | read | Total notices |
| `getNotice(uint256)` | read | Get notice by id |
| `getLatestNotice()` | read | Get newest notice |

## Setup
1. Install MetaMask, switch to **Sepolia**, get test ETH from a faucet.
2. Open [Remix IDE](https://remix.ethereum.org), create `SmartContract.sol`, paste the code.
3. Compile with Solidity 0.8.20+.
4. In *Deploy & Run*, choose **Injected Provider - MetaMask**, deploy, confirm in MetaMask.
5. Copy the deployed contract address.
6. Open `index.html` and replace `0x40e72F9ad883f0fa9f56f673E384509A3e9f12B9` in `CONTRACT_ADDRESS`.
7. Serve the folder (MetaMask does not inject on some `file://` setups):
   `python -m http.server 8000`, then open http://localhost:8000
8. Click **Connect MetaMask**, post a notice, read and like notices.

## Screenshots (`screenshots/`)
1. `1_deployment.png` - Remix deployment on Sepolia
2. `2_wallet_connected.png` - UI with wallet connected
3. `3_transaction.png` - Transaction confirmed with hash

## Tech
Solidity ^0.8.20, Remix IDE, MetaMask, ethers.js v6, HTML/CSS/JS.
