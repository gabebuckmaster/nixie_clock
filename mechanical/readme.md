# Mechanical Components

The mechanical components include the main body of the clock and the aluminum back panel. They were fabricated on a Shapeoko 3 cnc router as documented here and in the cad/cam files in the respective subfolders.

## Clock Body Fabrication

<p align="center">
<img src="../images/clock_body_back_angle.jpeg?raw=true" width="360">
<img src="../images/clock_body_front.jpeg?raw=true" width="360">
</p>

I used a 3"x5"x5" Myrtle bowl blank from Cook Woods for this build, but have also had nice results with a Bocote blank from Woodcraft. Both were sold as green stock, but I haven't had any issues with splitting or deformation when I've applied polyurethane immediately after machining.

* Mount a wasteboard to the router. I simply screwed the wasteboard down with wood screws. Face the wasteboard if necessary.

* Face the stock (on both sides if necessary) to 50mm thick. These surfaces will form the front and back of the clock and should be fairly smooth.

* Cut the stock to ~55mm x ~121mm (2.5 mm beyond final dimensions on each side). 

* Mount the stock to the waste board using side clamps, leaving the entire top surface free for machining operations (Shop Fox D3347 is an economical option). Alternatively, use top clamps but be very careful about placement!

* Using a 1/4" square end mill with at least ~60mm exposure, zero the router on the center of the top face of the stock and run the "cavity_rough_and_finish" progam.

<a href="https://www.youtube.com/watch?v=8Qd0kOpR0zQ"><img src="https://img.youtube.com/vi/8Qd0kOpR0zQ/0.jpg" width="240"></a>

This video (click through to view) shows the main cavity machining operation. This operation takes about 38 minutes.

* Clamp the piece from the inside using a spare display circuit board and some wood screws (or make a custom jig to clamp the clock body from the inside). Make sure the display circuit board is centered, as the board will guide the drill bit in the drilling step later.
    * Alternatively, you may want to switch to the 1/16" drill bit and make the drills before switching the clamping method so that the internal clamping jig (a.k.a. spare display circuit board) doesn't guide the drill hit. 

<a href="https://www.youtube.com/watch?v=gnCcfwPS03c"><img src="https://img.youtube.com/vi/gnCcfwPS03c/0.jpg" width="240"></a>

This video (click through to view) shows the switch to internal clamping, allowing the router to shape the outer profile.

* Again using a 1/4" square end mill with at least ~60mm exposure, run the "outer_profile_roughing_and_finishing" program. 

<a href="https://www.youtube.com/watch?v=ot6x--sOY_w"><img src="https://img.youtube.com/vi/ot6x--sOY_w/0.jpg" width="240"></a>

This video (click through to view) shows the outer profile milling operation. This operation takes about 6 minutes.

* Switch to a 1/16" drill bit with ~50mm exposure. I cut a 1/16" x 6" long drill bit down to about 3", and used an ER-16 collet extender with 1/4" shank and 1/16" collet to hold the bit with acceptable runout. The drill chuck style holders that I tried were useless for this because of their terrible runout. It's a little sketchy to run such a long, skinny bit in a router, but at the lowest speed setting on my DWP-611 it worked fine. 

<a href="https://www.youtube.com/watch?v=VWveq8YT8ts"><img src="https://img.youtube.com/vi/VWveq8YT8ts/0.jpg" width="240"></a>

This video (click through to view) shows the drilling operation. This operation uses peck drilling for the relatively high aspect ratio drills and only takes about a minute.

* Lastly, finish as you see fit: I sanded to 300 grit and then finished with a matte polyurethane.

## Back Panel Fabrication

<p align="center">
<img src="../images/back_panel.jpeg?raw=true" width="480">
</p>

* Mount a wasteboard to the router. As with the clock body, I screwed the wasteboard down with wood screws. Face the wasteboard if necessary.

<img src="../images/router_wasteboard.jpeg?raw=true" width="240">

* Use double-sided tape to attach 1/16" 6061-T6 aluminum sheet to wasteboard. I strongly recommend against using 3003 aluminum, even if it's easier to find: I found it basically impossible to find feed rate and spindle speed settings that gave clean cuts in 3003 aluminum.
* Using a 2.5mm drill bit (#2 screw clearance hole) and the 1/4" to 1/8" collet reducer, set zeros and run the drills program. In all of the NC files I've created for this project, the origin is at the center of the top face of the stock.

<a href="https://www.youtube.com/watch?v=6rfOrdr60so"><img src="https://img.youtube.com/vi/6rfOrdr60so/0.jpg" width="240"></a>

This video (click through to view) shows the "3x" design on a 6"x6" sheet of aluminum. The drilling operation for the 3 back panels took ~45s.

* Attach aluminum sheet to wasteboard with back panel screws for a more secure mount.
* Using a 1/8" end mill and the 1/4" to 1/8" collet reducer, zero the Z axis only, and run the back panel milling program.

<a href="https://www.youtube.com/watch?v=lyJ3KeP0NEw"><img src="https://img.youtube.com/vi/lyJ3KeP0NEw/0.jpg" width="240"></a>

This video (click thorugh to view) shows the "3x" design on a 6"x6" sheet of aluminum. The milling operation for the 3 back panels took ~20m. 

* Finish the back panels as you see fit: I rounded the sharp outer edges with some sand paper and slightly chamfered the holes for the buttons by hand with a large drill bit.
