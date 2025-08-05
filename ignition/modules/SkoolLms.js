// This setup uses Hardhat Ignition to manage smart contract deployments.
// Learn more about it at https://hardhat.org/ignition

const { buildModule } = require("@nomicfoundation/hardhat-ignition/modules");


module.exports = buildModule("SkoolLmsModule", (m) => {
  const registrationAddress = "0xdcd42cA3B9286BC08e5FeB0125196c0AEbad2416"
  
  const _registrationAddress = m.getParameter("_registrationAddress", registrationAddress);
  
  const lock = m.contract("SkoolLms", [_registrationAddress]);

  return { SkoolLms };
});
