pragma solidity ^0.4.0;

contract Ballot {
    bool voted;

    struct Voter {
        uint8 vote;
        bool voted;
    }

    struct Proposal {
        uint voteCount;
    }

    address chairperson;
    mapping(address => Voter) voters;
    Proposal[] proposals;

    /// Create a new ballot with `numProposals` different proposals.
    function Ballot(uint8 _numProposals) public {
        chairperson = msg.sender;
        proposals.length = _numProposals;
    }

    /// Give `toVoter` the right to vote on this ballot.
    /// May only be called by `chairperson`.
    function register(address toVoter) public {
        voters[toVoter].voted = false;
    }

    /// Give a single vote to proposal `toProposal`.
    function vote(uint8 toProposal) public {
        Voter storage sender = voters[msg.sender];
        sender.voted = true;
        sender.vote = toProposal;
        proposals[toProposal].voteCount++;
    }

    function winningProposal() public constant returns (uint8 _winningProposal) {
        uint256 winningVoteCount = 0;
        for (uint8 prop = 0; prop < proposals.length; prop++) {
            if (proposals[prop].voteCount > winningVoteCount) {
                winningVoteCount = proposals[prop].voteCount;
                _winningProposal = prop;
            }
        }
    }
}
