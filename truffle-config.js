var HDWalletProvider = require('truffle-hdwallet-provider');
var mnemonic = 'plug vendor bracket treat month trophy opinion adjust fatigue apple rigid hat';

module.exports = {
  // See <http://truffleframework.com/docs/advanced/configuration>
  // to customize your Truffle configuration!
  networks: {
    development: {
      host: "localhost",
      port: 7545, // Ganache UI
      network_id: "*" // Match any network id
    },
    rinkeby: {
      provider: () => {
        return new HDWalletProvider(mnemonic, 'https://rinkeby.infura.io/v3/0ebda51d1e5344349355d3dbd9a5c468')
      },
      network_id: 4,
      gas: 4612388 // Gas limit used for deploys
    }
  }
};