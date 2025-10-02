// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract HotelRoom {
    address public owner;
    uint public roomPrice;

    // Enum to track status
    enum Status { Vacant, Occupied }
    Status public currentStatus;

    // Mapping: guest address → hasBooked
    mapping(address => bool) public hasBooked;

    // Events for logs
    event RoomBooked(address indexed guest, uint amount);
    event CheckedOut(address indexed guest);

    // Constructor: set owner + initial room price
    constructor(uint _price) {
        owner = msg.sender;
        roomPrice = _price;
        currentStatus = Status.Vacant;
    }

    // Modifier: only owner
    modifier onlyOwner() {
        require(msg.sender == owner, "Not the owner!");
        _;
    }

    // Modifier: check if room is vacant
    modifier onlyWhileVacant() {
        require(currentStatus == Status.Vacant, "Room is already occupied");
        _;
    }

    // Book room (payable)
    function bookRoom() public payable onlyWhileVacant {
        require(msg.value >= roomPrice, "Not enough Ether to book");
        
        currentStatus = Status.Occupied;
        hasBooked[msg.sender] = true;

        // Send payment to owner
        payable(owner).transfer(msg.value);

        emit RoomBooked(msg.sender, msg.value);
    }

    // Check out (only guest who booked can do this)
    function checkOut() public {
        require(hasBooked[msg.sender] == true, "You haven't booked this room");
        require(currentStatus == Status.Occupied, "Room is not occupied");

        hasBooked[msg.sender] = false;
        currentStatus = Status.Vacant;

        emit CheckedOut(msg.sender);
    }

    // Owner can update price
    function setRoomPrice(uint _price) public onlyOwner {
        roomPrice = _price;
    }

    // Get room status
    function getRoomStatus() public view returns (Status) {
        return currentStatus;
    }
}
