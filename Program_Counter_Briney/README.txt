This circuit contains the flow control portion of the RISC-V OTTER architecture. 
It is built from foundational modules such as a 2:4 mux, 32x32 RAM, and slightly 
modified accumulator, which is the program counter. The mux controls which 
values (jal, jalr, branch, PC+4) are loaded into the program counter. The output 
of the program counter is sent to the RAM to control the address line input.

The PC has two types of input signals, control signals and data signals. The
clock is considered as a type of control signal. The other control signals 
include Rst, PCWrite and pcSource. The data signals include Jalr(jump and link 
register), Branch and Jal (jump and link).

With the jal (jump and link) instruction, the program counter is simply 
incremented using an immediate value. With jalr (jump and link register), the 
program counter is incremented using an immediate value in respect to a register 
location. Jalr is more useful for returning from subroutine calls, because it 
saves the memory location of where the subroutine needs to return to.

The memory module used is a 32 x 32 RAM. This equates to a capacity of 128 bytes 
or 32 words.

The mem dump file contains the memory addresses utilized by the provided assembly 
code. The addresses in the memory file are used to initialize the memory module. 
This bypasses the need to load the memory using additional circuitry.

It is important to note that The output produced from all the branch-related 
inputs either produced junk or zeros because they were all hardcoded to specific 
values. Looking at the OTTER Architecture schematic, these values will actually 
be obtained from the “BRANCH ADDR GEN” module in the final product. They were 
simply hardcoded now for testing purposes.

The PC is advanced by 4 when executing instructions because each instruction is 
4 bytes (32 bits) long. 

The IOBUS_IN is passed straight from the memories input to the memories output 
when the address is at or above the IO threshold. The IOBUS_IN is then stored in 
the Reg_File where the IBUS_OUT exists.
