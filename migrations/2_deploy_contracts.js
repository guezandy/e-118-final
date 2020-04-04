// Used to migrate smart contract onto the blockchain
const RunStats = artifacts.require("RunStats");

module.exports = function(deployer) {
  deployer.deploy(RunStats);
};
