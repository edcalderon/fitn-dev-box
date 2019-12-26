/* const Medidor = artifacts.require("ConvertLib"); */
/* const MetaCoin = artifacts.require("MetaCoin"); */

/* module.exports = function(deployer) {
  deployer.deploy(ConvertLib);
  deployer.link(ConvertLib, MetaCoin);
  deployer.deploy(MetaCoin);
}; */

const Medidor = artifacts.require("MedidorUnergy");

module.exports = function(deployer, network, accounts) {
 deployer.deploy(Medidor,{from: accounts[0]});
};