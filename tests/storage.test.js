// Right click on the script name and hit "Run" to execute
const { expect } = require("chai");
const { ethers } = require("hardhat");

describe("xtelptNFT", function () {
  it("test initial supply value", async function () {
    const XtelptNFT = await ethers.getContractFactory("xtelptNFT");
    const xtelptNFT = await XtelptNFT.deploy();
    await xtelptNFT.deployed();
    console.log('xtelptNFT deployed at:'+ xtelptNFT.address)
    expect((await xtelptNFT.totalSupply()).toNumber()).to.equal(0);
  });
   
});