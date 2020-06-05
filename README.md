# Nixie Tube Clock

<p align="center">
<img src="images/main_image.jpeg?raw=true" height="400">
</p>

A minimalist nixie tube clock design in a cnc-machined hardwood case using IN12B tubes.

All of the design files and detailed assembly/compilation instructions for the electronics, mechanical components, and firmware can be found in the respective subfolders: <a href=electronics>Electronics</a>, <a href=mechanical>Mechanical</a>, and <a href=firmware>Firmware</a>. 

This design has gone through several iterations, mostly to simplify the design and remove extraneous features that I thought would be a good idea but ultimately weren't. While nixie tubes are beautiful, they objectively have some significant shortcomings as a display technology: their viewing angle is extremely limited, and they can't be dimmed to arbitrarily low brightnesses - not to mention the difficulty in working with the high voltages needed to drive them. Over the course of the project, the goal converged to showing off the beauty of nixie tubes with the minimum possible set of features, and I'm happy with how the final result aligns with this goal.

I learned a lot about cnc machining, and am left with a great respect for the people who do this for a living. An incredible amount of effort (and skill among those who practice this professionally) goes into simply clamping the work piece in a way that allows the router/mill the necessary access. I also learned a lot about boost converter design, specifically core losses, the huge range of magnetic core materials, and why power electronics people often advise against designing boost converters that operate in DCM.

## License and Disclaimer
I built this clock because I wanted it to exist, and I’m distributing the documentation in the hopes that others find it interesting and/or educational. To this end, the files provided in this repository are licensed under the MIT license unless otherwise noted a given file.

This design is not FCC, CE, or UL certified, and thus it is probably not legal nor advisable to sell this design as a finished product in your jurisdiction. This project involves potentially dangerous power tools, potentially lethal voltages, and potential fire hazard due to housing electronics in a flammable material. **If you choose to recreate any work documented in this repository, you do so entirely at your own risk.**

## Final Assembly
The bill of materials for the final assembly is in <a href="final_assembly_bom.csv">Final Assembly BOM</a>.

### Pseudo-exploded view of the final assembly
<p align="center">
<img src="images/exploded_view.jpeg?raw=true" height="400">
</p>

### Video of final assembly
<p align="center">
<a href=https://www.youtube.com/watch?v=DrY8m4QcN1I><img src="images/final_assembly.gif?raw=true" width="320"></a>
</p>
Click through for longer/higher resolution video of final assembly.

## More Photos
### Final Assembly
<p align="center">
<img src="images/clock_front.jpeg?raw=true" height="300">
<img src="images/clock_front_angle_1.jpeg?raw=true" height="300">
<img src="images/clock_front_angle_2.jpeg?raw=true" height="300">
<img src="images/clock_back.jpeg?raw=true" height="300">
<img src="images/clock_back_angle_1.jpeg?raw=true" height="300">
<img src="images/clock_back_angle_2.jpeg?raw=true" height="300">
</p>

### Electronics
<p align="center">
<img src="images/electronics.jpeg?raw=true" height="300">
<img src="images/control_module.jpeg?raw=true" height="300">
<img src="images/display_module.jpeg?raw=true" height="300">
</p>

### Clock Body
<p align="center">
<img src="images/clock_body_back.jpeg?raw=true" height="300">
<img src="images/clock_body_back_angle.jpeg?raw=true" height="300">
<img src="images/clock_body_front.jpeg?raw=true" height="300">
</p>

### Back Panel
<p align="center">
<img src="images/back_panel.jpeg?raw=true" height="300">
</p>
