import { ethers } from "hardhat";

async function main() {
  const LogisticSupply = await ethers.getContractFactory("LogisticSupply")
  const supply = await LogisticSupply.deploy()

  console.log("Logistic Supply Contarct deployed to:", supply.target);
  const deploymentTransaction = supply.deploymentTransaction();
  if (deploymentTransaction) {
    await deploymentTransaction.wait(6)
  }
}

main()
.then(() => process.exit(0))
.catch((error) => {
  console.error(error);
  process.exit(1);
});