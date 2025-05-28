# 🥤 Vending Machine FSM - Verilog Implementation

## 📌 Project Overview
This project simulates a simple **vending machine** using **Verilog HDL**, which dispenses a product priced at ₹15. The machine accepts ₹5 and ₹10 coins and maintains internal states to track the inserted amount.

---

## 🚦 FSM Design

### 🎯 Objective
- Accept ₹5 and ₹10 coins.
- Dispense the product when the total reaches ₹15.
- Return ₹5 as change if ₹20 is inserted.

### 🔄 States Description
| State | Value Inserted | Description                      |
|-------|----------------|----------------------------------|
| S0    | ₹0             | Initial state, no coins inserted |
| S1    | ₹5             | One ₹5 coin inserted             |
| S2    | ₹10            | Either one ₹10 or two ₹5 coins   |
| S3    | ₹15 or more    | Dispense product + optional change |

---

## 📥 Input Ports

| Name     | Width | Description                |
|----------|-------|----------------------------|
| `clk`    | 1-bit | System clock               |
| `rst`    | 1-bit | Asynchronous reset         |
| `coin_in`| 2-bit | Coin input (00 = ₹0, 01 = ₹5, 10 = ₹10) |

## 📤 Output Ports

| Name      | Width | Description                       |
|-----------|-------|-----------------------------------|
| `dispense`| 1-bit | 1 → Product dispensed             |
| `change`  | 2-bit | 00 = ₹0, 01 = ₹5, 10 = ₹10 (if any)|

---

## 📋 How It Works

1. Start in `S0`. Insert ₹5 or ₹10.
2. Transition through states based on the total inserted.
3. When ₹15 is reached:
   - **Dispense** the product.
   - **Return ₹5 change** if total is ₹20.
   - Reset to `S0` after dispensing.

---

## 🧪 Simulation Tips

- Use a testbench to simulate clock and coin input sequences.
- Observe state transitions using waveform viewer (Vivado or ModelSim).
- Ensure **non-blocking assignments (`<=`)** are used for sequential logic.

---

## 🏗️ Tools Used

- Language: **Verilog HDL**
- Simulator: **Xilinx Vivado Simulator**
- Target: RTL simulation

---

## 🙏 Credits

Designed by **Pulipati Lokesh Varma**  
Please correct me if I was wrong. 😊

---

## 📬 Contact

📧 Email: [lokeshvarmap2004@gmail.com](mailto:lokeshvarmap2004@gmail.com)  
🔗 LinkedIn: [Pulipati Lokesh Varma](https://www.linkedin.com/in/lokeshvarma04)

