import { expect } from "chai";
import { ethers } from "hardhat";

describe("NewGame", async () => {
  const gameName = "whatever";
  const Contract = await ethers.getContractFactory("NewGameItems");
  const contract = await Contract.deploy(gameName, "0xabcFa978E8D0b9294D29E1215c0Cd11BEC8023A1");

  it("Owner should be 0xabcFa978E8D0b9294D29E1215c0Cd11BEC8023A1", async () => {
    expect(await contract.getOwner()).to.equal("0xabcFa978E8D0b9294D29E1215c0Cd11BEC8023A1");
  });
});
