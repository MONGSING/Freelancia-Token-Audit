const Freelancia = artifacts.require("Freelancia");

module.exports = function(deployer) {
  deployer.deploy(Freelancia);
};