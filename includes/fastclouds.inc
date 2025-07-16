#macro fastclouds(LS,Cast,Fluffyness,Translate,Scale,Scale2,MinT,LColor,Ambient)
#ifndef (CloudForm)
	#declare CloudForm=
	pigment {
		bumps
		warp {turbulence .75 lambda 3}
		scale 10
		warp {turbulence .5 lambda 3}
		scale 1/10
		scale 100
		warp {turbulence 1 lambda 2}
		scale 1/100
		rotate 45
	}
#end
#declare Clouds=
pigment {
	pigment_pattern{CloudForm}
	color_map {
		[(1-Cast) rgb 0]
		[(1-Cast)+Fluffyness rgb 1]
	}
	translate Translate
	scale Scale2	
}
#declare Clouds3=
pigment {
	pigment_pattern{CloudForm}
	color_map {
		[(1-Cast)-Fluffyness/5 rgb 0]
		[(1-Cast)+Fluffyness*1.5 rgb 1]
	}
	translate Translate
	scale Scale2	
}
#local Clouds2=
pigment {
	pigment_pattern{CloudForm}
	color_map {
		[(1-Cast)/1 rgb 0]
		[1+Fluffyness rgb 1]
	}
	translate Translate
	translate -vnormalize(LS)*.25*Cast
	//rotate x*.5*Cast
	scale Scale2	
}
#declare Cloudsphere=
sphere {
	0,1
	pigment {
		pigment_pattern {Clouds}
		pigment_map {
			[0 
				pigment_pattern {Clouds2}
				color_map {
					[0 rgb 1 transmit 1]
					[1 rgb .5 transmit 1]
				}
			]
			[1 
				pigment_pattern {Clouds2}
				pigment_map {
					//[0 rgb 1 transmit MinT]
					[0	rgb (1*MinT)+LColor*(1-MinT) transmit .5+MinT/2]
					/*[0 pigment_pattern{Clouds}
						color_map {
							[0	rgb <2,1.5,1> transmit .5+MinT]
							[1 rgb MinT filter 1]
						}
					]*/
					[1 rgb MinT filter 1]
				}
			]
		}
	}
	finish {ambient Ambient diffuse 0}
	scale 500
	translate -y*450
	scale Scale
	hollow
}
object {Cloudsphere}
#end
