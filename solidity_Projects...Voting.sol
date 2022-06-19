//SPDX-License-Identifier:MIT
pragma solidity ^0.8.7;
// Contract to vote for Adam, Hamza or Rahul 
// from one address only one vote can be done
contract Voting{
         uint256 public Adam;
         uint256 public Rahul;
         uint256 public Hamza;
        // Struct with voter details and who they are voting
         struct Voter{
             string _votername;
             address _voteraddress;
             bool _voterstatus;
           string candidate;
         }

         Voter[] public person; 
         mapping(string=>address)  name;
         mapping(address=>bool) status;
          mapping(bool=>uint256) selection;
// vote4 function which shows who voted for whom
         function vote4(string memory _yourname,string memory _yourcandidate) public{
            for(uint i=0;i<person.length;i++)
            require(person[i]._voteraddress!=msg.sender,"Already Voted");
            address voteraddress=msg.sender;
            bool presentstatus=true;
           name[_yourname]=voteraddress;
           status[voteraddress]=presentstatus;
           if(keccak256(bytes(_yourcandidate))==keccak256(bytes("Adam")) || keccak256(bytes(_yourcandidate))==keccak256(bytes("adam")) ||  keccak256(bytes(_yourcandidate))==keccak256(bytes("ADAM")))
            {Adam=Adam+1;
           selection[presentstatus]=Adam;
           person.push(Voter(_yourname,voteraddress,presentstatus,"Adam"));}
        else if(keccak256(bytes(_yourcandidate))==keccak256(bytes("Rahul")) || keccak256(bytes(_yourcandidate))==keccak256(bytes("rahul")) ||  keccak256(bytes(_yourcandidate))==keccak256(bytes("RAHUL")))
            {Rahul=Rahul+1;
           selection[presentstatus]=Rahul;
           person.push(Voter(_yourname,voteraddress,presentstatus,"Rahul"));}
          else if(keccak256(bytes(_yourcandidate))==keccak256(bytes("Hamza")) || keccak256(bytes(_yourcandidate))==keccak256(bytes("hamza")) ||  keccak256(bytes(_yourcandidate))==keccak256(bytes("HAMZA")))
            {Hamza=Hamza+1;
           selection[presentstatus]=Hamza;
           person.push(Voter(_yourname,voteraddress,presentstatus,"Hamza"));}
}}