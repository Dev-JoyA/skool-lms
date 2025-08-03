// This setup uses Hardhat Ignition to manage smart contract deployments.
// Learn more about it at https://hardhat.org/ignition

const { buildModule } = require("@nomicfoundation/hardhat-ignition/modules");

const _tuition = 1000000000; 

module.exports = buildModule("RModule", (m) => {

    const tuition = m.getParameter("tuiton", _tuition);

    const registration = m.contract("RegistrationContract", [tuition]);
  

  return { registration };
});
