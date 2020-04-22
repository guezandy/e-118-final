# E-118 Intro to Bitcoin and Blockchain Final project

## Description
Decentralized application to save running event data to the blockchain and then retrieve your data.

## Production site
### https://guezandy.github.io/e-118-final/

Debugging tips:
* Ensure you have metamask installed
* Ensure you are on rinkeby test net
* Ensure you have some ether in your test account

Usage:
* Save stats by filling out the form and clicking `Create a new record`
* Retreive stats by clicking `Lookup your stats(s)`
* Contract transactions will be listed here: `https://rinkeby.etherscan.io/address/0xd3439e5c8b656d9266e22e57d56633259e119a73`

## Run application locally
* pull code
* Run `npm install`
* Launch local ganache
* Run `truffle compile`
* Run `truffle migrate`
* Replace contract address `0xd3439e5C8b656D9266E22e57d56633259e119a73` in  `index.html` with your new address
* Open `index.html` file in the browser
* All features should now work