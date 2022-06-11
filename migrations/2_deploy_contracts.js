//Import Contractconst DStorage = artifacts.require("DStorage");

const DStorage = artifacts.require("DStorage");

module.exports = function(deployer) {
  deployer.deploy(DStorage);
};