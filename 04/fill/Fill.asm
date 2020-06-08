// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Fill.asm

// Runs an infinite loop that listens to the keyboard input.
// When a key is pressed (any key), the program blackens the screen,
// i.e. writes "black" in every pixel;
// the screen should remain fully black as long as the key is pressed. 
// When no key is pressed, the program clears the screen, i.e. writes
// "white" in every pixel;
// the screen should remain fully clear as long as no key is pressed.

(RESET)
    @8192
    D=A
    @R0
    M=D
(MAIN)
    @24576
    A=A
    D=M
    @BLACK
    D;JNE
    @WHITE
    0;JMP
(BACK)
    @R0
    M=M-1
    D=M
    @RESET
    D;JLT
    @MAIN
    0;JMP

(BLACK)
    @R0
    D=M
    @SCREEN
    A=A+D
    M=-1
    @BACK
    0;JMP

(WHITE)
    @R0
    D=M
    @SCREEN
    A=A+D
    M=0
    @BACK
    0;JMP
