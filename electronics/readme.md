# Electronics

<p align="center">
<img src="../images/electronics.jpeg?raw=true" height="300">
</p>

The electronics consist of two PCB assemblies. The control module runs the show and generates 180V for the nixie tubes, while the display module includes the nixie tubes and a high voltage shift register to drive them. The boards are interconnected with standard 0.1" headers. Everything is powered from an off-the-shelf 12V AC-DC adapter. 

Despite the 12V supply, the control module generates and the display module uses 180V at enough current to cause your heart to stop - don't work on this design unless you understand the risks and know how to safetly work on high voltage electronics. It was stated in the main readme, but is worth repeating here:  **If you choose to recreate any work documented in this repository, you do so entirely at your own risk.**

Both boards use 0805 passives and no leadless components for relatively pain-free hand soldering with nothing but a soldering iron, solder, and some flux! If you haven't done surface mount soldering before, don't let it scare you away. Surface mount soldering isn't as hard as it looks once you get the hang of it, and it opens up a whole new world of design opportunities.

Cleaning each board thoroughly after soldering and before powering up the board is critical, especially around the high voltage sections. This is true even if you use no-clean flux, which I found out the hard way after frying a couple $5 high-voltage shift registers.

## Control Module

<p align="center">
<img src="../images/control_module.jpeg?raw=true" height="300">
</p>

<a href="control_module/control_module.pdf">Schematic PDF</a>

This PCB includes the microcontroller, a temperature compensated real time clock IC with battery backup, and the boost converter that generates the 180V supply for the nixie tubes. 

The boost converter operates in DCM to achieve the 15x conversion ratio, and achieves ~70% efficency with widely available components at ~6mA output current. It includes a snubber to eliminate turn-off ringing at the drain of the switching mosfet. This slightly reduces overall efficiency, but improves output stability and might help reduce radiated EMI. The final value for the snubber resistance based on measurements (120 ohms) ended up being fairly different from the optimal value identified in simulation (300 ohms), indicating that there are probably some significant inaccuracies in the models used for simulation. However, the constructed converter is stable and tolerably efficient, so it's good enough for now.

For assembly, see the  <a href="control_module/control_module_bom.csv">BOM</a> and <a href="control_module/gerbers/control_module-F_Fab.pdf">fab drawing</a>

After assembly, the microcontroller must be programmed with the firmware. See the <a href=../firmware>firmware</a> folder for details.

### Through Hole Assembly Notes
* The 3- and 4-pin 0.1" pin header sockets (J3 and J4) must be mounted on the bottom side of the board (the opposite side from the surface mount components). I strongly recommend soldering only one pin on each socket first and verifying that the sockets are flush with and perpendicular to the board before soldering the rest of the pins.
* All other through hole components go on the top side of the board (the same side as the surface mount components).
* Make sure that the pushbuttons (SW1, SW2) and barrel jack (J5) are also installed flush with and perpendicular to the board so that final assembly goes smoothly.
* Make sure to observe the polarity of the supercapacitor C19 when installing.

## Display Module

<p align="center">
<img src="../images/display_module.jpeg?raw=true" height="300">
</p>

<a href="display_module/display_module.pdf">Schematic PDF</a>

This PCB includes the nixie tubes themselves, current limiting resistors, and the high voltage shift register. 

For assembly, see the  <a href="display_module/display_module_bom.csv">BOM</a> and <a href="display_module/gerbers/display_module-F_Fab.pdf">fab drawing</a>

### Through Hole Assembly Notes
* The tubes must be mounted on the bottom side of the board (the opposite side from the surface mount components).
* Aligning the tubes nicely is critical for the final appearance of the clock. There's a fairly large variation in the shape of the tubes themselves, so I strongly recommend soldering one pin on each tube and adjusting the position until they're nicely centered before soldering the rest of the pins. You can insert the display board into the clock body to verify tube positioning before soldering all of the pins.
* The 3- and 4-pin 0.1" headers go on the top side of the board (the same side as the surface mount components). A helpful trick for getting the best alignment is to insert the pin headers into the matching sockets on the control module to hold them in place while you're soldering them to the display module.
