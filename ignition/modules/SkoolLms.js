// This setup uses Hardhat Ignition to manage smart contract deployments.
// Learn more about it at https://hardhat.org/ignition

const { buildModule } = require("@nomicfoundation/hardhat-ignition/modules");

const registrationAddress = "0xeE82b260269c56E9E74BcD4A48c8eDC70D0Fa010"

module.exports = buildModule("SkoolLmsModule", (m) => {
  
const _registrationAddress = m.getParameter("_registrationAddress", registrationAddress);
  
  const SkoolLms = m.contract("SkoolLmsContract", [_registrationAddress]);

  return { SkoolLms };
});
