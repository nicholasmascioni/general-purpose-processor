# general-purpose-processor

A simple processor based on the final project I built for the Digital Systems course I took at school. This project was originally written in VHDL, however after learning Verilog over the summer, I decided to recreate the project in Verilog as a way to showcase what I've learned. 

The processor is comprised of registers, a 4x16 decoder, a finite state machine (FSM), an arithmetic logic unit (ALU), and 7-segment displays. Each component will be explained in detail. 

**Registers** <br>
These are the simplest components of the processor. They act as storage elements which are used to store the two 8-bit inputs for the processor. Technically speaking, they are *D Flip-flops* with an *asynchronous* active-high reset. This is to say that they will store the current input at the rising edge of the clock, and be reset to 0 when the reset pin is pulled high.

**4x16 Decoder** <br>
A decoder converts a coded input into a coded output. It will always have $n$ inputs and $2^n$ outputs. In the case of the 4x16 decoder used for this processor, it takes a 4-bit wide signal as an input and outputs a 16-bit wide signal, with only one of the output bits being high at any one time. The enable pin must be pulled high for the decoder to function, otherwise the output will be set to 0. The decoder is used to set the correct operation code for the ALU, and along with the FSM, comprises the control unit of the processor.

**Finite State Machine (FSM)** <br>
The particular FSM implemented in this processor is a *Mealy* FSM, meaning its output is dependent on both its input and present state. The FSM contains nine states $S_0, S_1, ... ,S_8$ which each correspond to a digit of my student number. The FSM cycles through these values and provides the 4-bit input for the 4x16 decoder, completing the control unit of the processor.

**Arithmetic Logic Unit (ALU)** <br>
The ALU can perform arithmetic and bitwise operations on two 8-bit inputs (A and B) depending on the operation code from the 4x16 decoder, which is set by the current state of the FSM. 

The ALU has four outputs: `result_1`, `result_2`, `neg`, and `carry`. The result of the operations is split into two 4-bit outputs `result_1` and `result_2` in order to display the result using 7-segment displays, which require 4-bit inputs. The `neg` output is connected to a seperate 7-segment display and is pulled high if the result of an operation is negative. Similarly, the `carry` output is pulled high if the result of an operation results in a carry bit being introduced. 

The following table summarizes the operation corresponding to each operation code:

| **Operation Code** | **Operation** | **Name** |
| -                  | -             | -        |
| 0000000000000001   | $A + B$       | Addition |
| 0000000000000010   | $A - B$       | Subtraction |
| 0000000000000100   | $\overline{A}$ | NOT     |
| 0000000000001000   | $\overline{(A\cdot B)}$ | NAND |
| 0000000000010000   | $\overline{(A + B)}$ | NOR |
| 0000000000100000   | $A \cdot B$ | AND |
| 0000000001000000   | $A \oplus B$ | XOR |
| 0000000010000000   | $A + B$ | OR |
| 0000000100000000   | $\overline{A \oplus B}$ | XNOR |

**7-Segment Displays** <br>
7-Segment displays are used to display the result of the operations performed on the two inputs. They can display values 0-15 in hexadecimal. (0-9, A-F) Each segment of the display is labelled with a letter a-g. By setting combinations of segments high, numbers and characters can be displayed. For example, setting the input of the display to $1111110$ will turn on segments a-f, and leave segment g off. This will display a 0 on the 7-segment display. Note that 7-segment displays come in two varities: `common-cathode` and `common-anode`. In a common-cathode display, the cathode (negative end) of each LED are tied together, and so to turn on each segment, they must be pulled high. In a common-anode display, the anode (positive end) of each LED are tied together, and so to turn on each segment, they must be pulled low. It is assumed common-cathode displays are used with this processor. For a common-anode display, the input would need to be inverted. 

By combining all these components, ensuring all sequential elements are connected to the same clock signal, the simple processor is realized. 