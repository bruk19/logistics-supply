import { HardhatUserConfig } from "hardhat/config";
import "@nomicfoundation/hardhat-toolbox";
import "hardhat-deploy";
import dotenv from "dotenv";

dotenv.config();

const SEPOLIA_RPC_URL = process.env.SEPOLIA_RPC_URL;
const PRIVATE_KEY = process.env.PRIVATE_KEY!;
const ETHERSCAN_API_KEY = process.env.ETHERSCAN_API_KEY;

const config: HardhatUserConfig = {
  solidity: "0.8.24",
  networks: {
    sepolia: {
      url: SEPOLIA_RPC_URL,
      accounts: [PRIVATE_KEY],
      chainId: 11155111,
    }, 
    localhost: {
      url: "http://127.0.0.1:8545/",
      chainId: 31377,
    }
  }, 
  etherscan: {
    apiKey: ETHERSCAN_API_KEY,
  },
   namedAccounts: {
    owner: {
      default: 0,
    },
  },
   paths: {
    sources: "./contracts",
    tests: "./test",
  },
  mocha: {
    timeout: 40000,
  },
  sourcify: {
  enabled: true
}
};

export default config;
