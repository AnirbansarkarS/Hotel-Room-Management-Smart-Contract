# 🏨 Hotel Room Management Smart Contract

A simple smart contract written in Solidity to simulate a **hotel room booking system** on Ethereum.  
Users can book a room by paying Ether, and the owner receives the funds directly.  
The contract demonstrates **enums, modifiers, events, and payable functions** in Solidity.

---

## ✨ Features
- ✅ Room availability check (Vacant / Occupied) using **Enums**
- ✅ **Payable function** to allow users to send Ether
- ✅ Access control with **Modifiers**
- ✅ Event logging for bookings
- ✅ Funds automatically transferred to the owner

## 🚀 Deployment (Using Remix IDE)

1. Open [Remix IDE](https://remix.ethereum.org/).
2. Create a new file `HotelRoom.sol` and paste the code above.
3. Compile the contract using Solidity version `0.8.0` or above.
4. Deploy the contract:

   * Enter the room price in **Wei** (e.g., `1000000000000000000` = 1 Ether).
   * Click **Deploy**.
5. In the **Deployed Contracts** panel:

   * Enter the value (in Ether) in the `Value` field.
   * Click **bookRoom** to book.

---

## 🛠 Example

* Deploy contract with price `1 ether`.
* In Remix “Value” field, enter `1` and select **Ether** from dropdown.
* Call `bookRoom()` → Event is emitted + funds sent to owner.

---

## 📚 Concepts Covered

* **Enums** for state management (`Vacant` / `Occupied`)
* **Events** for logging
* **Modifiers** for access control
* **Payable functions** to accept Ether
* **Constructor** for initialization

---

## 🔮 Future Improvements

* Allow multiple rooms with dynamic pricing.
* Add cancellation & refunds.
* Track guest history with mappings.
* Integrate with a front-end using **React + Ethers.js**.

---

## 🏷 License

This project is licensed under the **MIT License**.

