# Sokoban-FPGA

Sokoban and minesweeper implemented in FPGA. 

We developed this digital system as short term project. This system is fully implemented with PS2 keyboard and mouse input and 800x600 SVGA output in `XUP Virtex-II Pro XC2V30` . If you have this development system, you can just use the `./ise/top/top.bit` or `./ise/top/final.mcs` to program the board, and then attach your mouse, keyboard and SVGA monitor, reset the system, then have fun with these games. For other development system, you may need to rebuild the whole ise project yourself. The whole system was tested in ModelSim SE 6.5 and XUP Virtex-II Pro XC2V30, everything worked fine, but you may need to refine the timer of watchdog for the mouse as you are using a different board. 

## Control

### Sokoban

- W - Move up, A - Move left, S - Move down, D - Move right, ESC - retry, Backspace - retract, Enter - confirm&next
- Mouse can work well, just left-click to lead the man moving. Left-click the button to retry or retract. Right-clicking means reset the game. 

### Minesweeper

- Pressing M to switch the game.
- Like the normal minesweeper, you can use left-click, right-click and  double-click. And only the retry button works.

## Simulation

![sk-1](https://user-images.githubusercontent.com/1665437/30521245-5462e634-9bef-11e7-8428-f758781204c7.png)

![ms-1](https://user-images.githubusercontent.com/1665437/30521244-5461b1d8-9bef-11e7-83c8-ee655b6288b9.png)