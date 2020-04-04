pragma solidity ^0.5.8;

import "openzeppelin-solidity/contracts/ownership/Ownable.sol";

// Ownable allows a Ethereum Wallet address to "Own" things.
// In our case a specific wallet address will "Own" run results
// Ex: Wallet address "123" "Owns" "2020 Boston Marathon time of 4 hours and 30 mins"
contract RunStats is Ownable {

    // Struct to hold a specfic event
    struct RunStat {
        string eventName;
        string timestamp;
        string place;
        string distance;
        string time;
        string description;
    }

    // Used to keep a list of all accepted events
    mapping(string => string) public events;
    // Mapping from wallet address to array of stats
    mapping(address => RunStat[]) public addressToStats;

    // Couldn't figure out how to return an array to the view so I just turned
    // an array to a string using these delimeters and then I split it up in the UI
    string public statDelim = "%s%";
    string public runDelim = "%r%";

    // Function to be called by our application
    // Used to create a new run stat for the user that has metamask account setup
    function createRunStat(
        string memory eventName,
        string memory timestamp,
        string memory place,
        string memory distance,
        string memory time,
        string memory description
    ) public {
        // Create RunStat and append the new running event to this user
        addressToStats[msg.sender].push(RunStat(eventName, timestamp, place, distance, time, description));
    }


    // Function to be called by application to return all running events by the metamask account that is logged in
    function getRunStats() public view returns (string memory) {
        // Convert all running events to a string and return that string
        string memory encodedRunStats;
        for (uint i=0; i<addressToStats[msg.sender].length; i++) {
            RunStat storage stat = addressToStats[msg.sender][i];
            encodedRunStats = string(abi.encodePacked(encodedRunStats, runDelim, stat.eventName, statDelim, stat.timestamp, statDelim, stat.place, statDelim, stat.distance, statDelim, stat.time, statDelim, stat.description));
        }
        return encodedRunStats;
    }
}