//PLEASE IGNORE THIS FILE AS IT IS NOT PART OF THE PROJECT, Thanks

// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;


contract USElection{
struct Candidate{
  string name;
  string description;
  uint256 voteCount; 
}
mapping ( uint256 => Candidate) public candidates; // mapping from candidate id to candidate
mapping ( address => bool ) public hasVoted; // mapping from voter address to bool
uint256 public candidateCount;

constructor(){
    candidateCount = 0;
}

 function addCandidate(string memory _name, string memory _description) public {
    candidateCount ++;
    candidates[candidateCount] = Candidate({
        name: _name,
        description: _description,
        voteCount: 0
    });
     }

  function vote (uint256 _candidateID) public {
    require(!hasVoted[msg.sender], "You have already voted");
    require(_candidateID > 0 && _candidateID <= candidateCount);
    candidates[_candidateID].voteCount ++;
    hasVoted[msg.sender] = true; 
  }
  function getWinner() public view returns (string memory winnerName, uint256 totalVotes) {
    require(conditionCount > 0, "No cannot vote for a candidates, if no one is a candidate");

    uint highestVotes;
    uint256 winnerID;
    for(uint256 i = 1; i <= candidateCount; i++) {
      if (candidates[i].voteCount > highestVotes) {
        highestVotes = candidates[i].voteCount;
        winnerID = i;
      }
    }
winnerName = candidates[winningID].name;
stateVotes = candidates[winningID].voteCount


  }


}
