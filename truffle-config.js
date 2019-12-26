var HDWalletProvider = require("truffle-hdwallet-provider");
var mnemonic = "visit since chaos scare empty future over erode destroy stock liquid token";

module.exports = {
 networks: {
  development: {
   host: "127.0.0.1",
   port: 8545,
   network_id: "*"
  },
  rinkeby: {
      provider: function() { 
       return new HDWalletProvider(mnemonic, "https://rinkeby.infura.io/v3/989cb18083114110ba7f613d29397642");
      },
      network_id: 4,
      gas: 4500000,
      gasPrice: 10000000000,
  }
 }
};
