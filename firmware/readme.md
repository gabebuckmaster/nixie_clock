# Firmware
The firmware is written using the [stm32duino core (8f53782b)](https://github.com/stm32duino/Arduino_Core_STM32) and [Adafruit's RTCLib 1.7.0](https://github.com/adafruit/RTClib). A custom board definition is used for the STM32F042C6T6 processor, which works for this application but has not been checked to be compatible with anything else.

To set up Arduino to compile for the STM32F042C6T6, perform the following steps:

* Install the stm32duino core

* Add the Generic_F042Cx folder to the variants folder in Arduino_Core_STM32.

* In boards.txt, under Generic F0, add:
```
# Generic STM32F042C6T8 board
GenF0.menu.pnum.Generic_F42C6=Generic STM32F042C6
GenF0.menu.pnum.Generic_F42C6.upload.maximum_size=32768
GenF0.menu.pnum.Generic_F42C6.upload.maximum_data_size=10240
GenF0.menu.pnum.Generic_F42C6.build.board=Generic_F042Cx
GenF0.menu.pnum.Generic_F42C6.build.product_line=STM32F042x6
GenF0.menu.pnum.Generic_F42C6.build.variant=Generic_F042Cx
```

Choose Sketch > Export compiled binary and flash to the controller board using STM32CubeProgrammer. You can use SWD (STLink V2 or similar, clones typically work fine and are only a couple of dollars) (tested) or USB DFU by carefully holding BOOT0 while resetting the board (untested). Extreme care should be taken when flashing the board due to the integrated high voltage supply.
