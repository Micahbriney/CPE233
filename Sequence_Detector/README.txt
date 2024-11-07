Sequence Detector

Program uses sourced code for the purpose of creating a resetting Moore 
type Finite State Machine (FSM) sequence detector. This is used to interpret 
messages using secure lines as it requires a certain input in order for the 
sequence ahead to be registered and saved. The inputs include a clock, switches 
and a binary transmission (string of binary numbers). Outputs include segments, 
a display and the LED’s on the board.

The circuit takes three inputs and provides three outputs. The inputs are the 
clock, switches on the board and a button. The switches allow for input of the 
sequence and the button allows access to the other sequence. The output segments 
show the word CrAP when the sequence is not set on the board. When the correct 
sequence is set on the board the segments will display Cool when the FSM 
transitions through each state. This confirms that the entered sequence was 
correct. The LEDS will illuminate above the switch the FSM is currently checking.