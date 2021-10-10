//SPDX-License-Identifier: MIT
pragma solidity 0.8.0;

interface IPool {
  struct PoolModel {
    uint256 hardCap; // how much project wants to raise
    uint256 softCap; // how much of the raise will be accepted as successful IDO
    uint256 startDateTime;
    uint256 endDateTime;
    address walletAddress; // address where Ether is sent
    address projectTokenAddress; //the address of the token that project is offering in return
    uint16 minAllocationPerUser;
    uint256 maxAllocationPerUser;
    uint status; //: by default “Upcoming”,
    uint256 totalTokenProvided;
    uint256 exchangeRate;
    uint256 tokenPrice;
    uint256 totalTokenSold;
  }

  struct ParticipantDetails {
    address addressOfParticipant;
    uint256 totalRaisedInWei;
  }

  // Pool data that needs to be retrieved:
  struct PoolDetails {
    ParticipantDetails[] investorsAndAllocations;
    uint256 countOfInvestors;
    uint256 totalRaised;
    uint256 hardCap;
    uint256 softCap;
    uint16 minAllocationPerUser;
    uint256 maxAllocationPerUser;
    uint256 startDateTime;
  }

  enum PoolStatus {
    Upcoming,
    Ongoing,
    Finished,
    Paused,
    Cancelled
  }

  function deposit() external payable returns (bool success);

  function getPoolDetails()
    external
    view
    returns (PoolDetails memory poolDetails);

  function updatePoolStatus(uint _newStatus) external;
}