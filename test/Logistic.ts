import {
  loadFixture,
} from "@nomicfoundation/hardhat-toolbox/network-helpers";
import { expect } from "chai";
import { ethers } from "hardhat";

describe("LogisticSupply", function () {
  async function deployLogisticFixture() {
    const [owner] = await ethers.getSigners();
    const LogisticSupply = await ethers.getContractFactory("LogisticSupply");
    const supply = await LogisticSupply.deploy();
    return { supply, owner };
  }

  describe("Deployment", function () {
    it("Should set the right owner", async function () {
      const { supply, owner } = await loadFixture(deployLogisticFixture);
      expect(await supply.owner()).to.equal(owner.address);
    });
  });

  it("should update raw material count", async function () {
    const { supply } = await loadFixture(deployLogisticFixture);
    const initialRawMatCount = Number(await supply.rawMatCount());
    await supply.addRMS("Raw Material A", "0x1234567890123456789012345678901234", "Goba");

    expect(Number(await supply.rawMatCount())).to.equal(initialRawMatCount + 1);
  });

  it("should add a new RMS", async function () {
    const { supply } = await loadFixture(deployLogisticFixture);
    await supply.addRMS("Raw Material A", "0x1234567890123456789012345678901234", "Goba");

    const rms = await supply.RMS(0);
    expect(rms.name).to.equal("Raw Material A");
    expect(rms._addr).to.equal("0x1234567890123456789012345678901234");
    expect(rms.place).to.equal("Goba");
  });
  
});
