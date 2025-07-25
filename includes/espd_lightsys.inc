// ------------------------------------------------------------------
// Persistence of Vision Ray Tracer Include File
// Emissive Spectral Data library for PoV-Ray
// ------------------------------------------------------------------
// Mixed sources originally compiled by Jaime Vives Piqueres for the
// lightsys macros, converted to splines by Ive.
//
// Added Mitsubishi spectrums sampled by Ive
// 
// ------------------------------------------------------------------
/*
  Content:
  -------
  
  ES_GE_SW_Incandescent_60w  - GE Soft White incandescent 60 watt
  ES_GE_SW_Incandescent_100w - GE Soft White incandescent 100 watt
  ES_Nikon_SB16_XenonFlash   - Nikon SB-16 xenon flash
  ES_GTE_341_Warm            - warm white fluorescent tube
  ES_GTE_341_Cool            - cool white fluorescent tube

  ES_Phillips_PLS_11w        - Phillips PL-S compact white fluorescent 11 watt
  ES_Phillips_Mastercolor_3K - Phillips Mastercolor
  ES_Phillips_HPS            - Phillips High Pressure Sodium

  ES_Osram_CoolBeam_20w      - Osram Halogen 20 watt
  ES_Osram_CoolFluor_36w     - Osram Fluor 36 watt

  ES_Solux_Halog4700K        - Solux Halogen 47 VOR
  ES_Cornell_Box_Light       - Cornell box light (tungsten flood light with UV filter and diffusing glass plate)
  ES_Sunlight                - Sunlight (terrestrial - filtered by the atmosphere)
  ES_Extraterrestrial_Sun    - Sunlight (outer space - non filtered)
  ES_Daylight_Fluor          - Daylight fluorescent

  ES_Mitsubishi_Metal_Halide         -  ca. 4274K
  ES_Mitsubishi_Daylight_Fluorescent -  ca. 6245K
  ES_Mitsubishi_Moon_Fluorescent     -  ca. 4939K
  ES_Mitsubishi_Standard_Fluorescent -  ca. 4091K

*/

// Standard include file beginning stuff
#ifndef (espd_lightsys_Inc_Temp)
#declare espd_lightsys_Inc_Temp = 1;

#ifdef(View_POV_Include_Stack)
  #debug "Including espd_lightsys.inc\n"
#end

//=============================================================

// Other light SPDs from graphics at the Cornell Univ:
// - GE Soft White incandescent -
#declare ES_GE_SW_Incandescent_60w = spline{ linear_spline
 350, 0
 400, 0.02
 450, 0.09
 500, 0.17
 550, 0.27
 600, 0.40
 650, 0.52
 700, 0.64
 750, 0.75
 800, 0.85
}
#declare ES_GE_SW_Incandescent_100w = spline{ linear_spline
 350, 0
 400, 0.05
 450, 0.13
 500, 0.26
 550, 0.41
 600, 0.60
 650, 0.79
 700, 0.96
 750, 1.15
 800, 1.3
}
// - Nikon SB-16 xenon flash -
#declare ES_Nikon_SB16_XenonFlash = spline{ linear_spline
 380, 0.04
 390, 0.05
 400, 0.04
 410, 0.08
 420, 0.54
 430, 0.77
 440, 0.84
 450, 0.92
 460, 0.94
 470, 0.98
 480, 0.95
 490, 0.90
 500, 0.84
 510, 0.83
 520, 0.82
 530, 0.84
 540, 0.83
 550, 0.80
 560, 0.79
 570, 0.77
 580, 0.76
 590, 0.75
 600, 0.74
 610, 0.73
 620, 0.72
 630, 0.71
 640, 0.68
 650, 0.68
 660, 0.66
 670, 0.65
 680, 0.64
 690, 0.66
 700, 0.63
 710, 0.60
 800, 0
}
// GTE Fluorescents:
// - warm white fluorescent tube -
#declare ES_GTE_341_Warm = spline{ linear_spline
 380, 0.2
 390, 0.3
 400, 2.7
 410, 2.7
 420, 0.5
 430, 7.5
 440, 7.5
 450, 1.1
 460, 1.2
 470, 1.3
 480, 1.2
 490, 1.1
 500, 1.0
 510, 0.9
 520, 1.0
 530, 1.3
 540, 6.0
 550, 6.0
 560, 5.0
 570, 6.5
 580, 7.6
 590, 7.0
 600, 6.2
 610, 4.9
 620, 3.5
 630, 2.8
 640, 2.1
 650, 1.7
 660, 1.2
 670, 0.9
 680, 0.5
 690, 0.2
 700, 0.1
 800, 0.0
}
// - cool white fluorescent tube -
#declare ES_GTE_341_Cool = spline{ linear_spline
 380, 0.5
 390, 0.7
 400, 3.8
 410, 3.8
 420, 1.5
 430, 1.8
 440, 8.0
 450, 2.6
 460, 2.7
 470, 2.8
 480, 2.7
 490, 2.6
 500, 2.5
 510, 2.4
 520, 2.5
 530, 2.6
 540, 6.6
 550, 4.8
 560, 5.2
 570, 6.0
 580, 6.7
 590, 5.8
 600, 4.9
 610, 3.8
 620, 2.8
 630, 2.1
 640, 1.6
 650, 1.3
 660, 1.0
 670, 0.8
 680, 0.5
 690, 0.4
 700, 0.3
 800, 0.0
}
// Several Phillips bulbs and tubes, extracted from data sheets at phillips.com:
// - compact white fluorescent Phillips PL-S 11W -
#declare ES_Phillips_PLS_11w = spline{ linear_spline
 350, 0.0
 400, 0.001
 406, 0.600
 412, 0.001
 425, 0.001
 436, 1.600
 450, 0.001
 462, 0.001
 475, 0.001
 488, 0.700
 500, 0.100
 525, 0.001
 546, 4.300
 550, 2.500
 562, 0.100
 575, 0.400
 587, 1.200
 600, 0.900
 612, 6.800
 625, 1.100
 650, 0.300
 662, 0.200
 675, 0.100
 687, 0.150
 700, 0.010
 710, 0.800
 725, 0.001
 800, 0.0
}
// - Mastercolor 3K -
#declare ES_Phillips_Mastercolor_3K = spline{ linear_spline
 350, 0.0
 400, 0.080
 405, 0.160
 410, 0.170
 415, 0.110
 420, 0.200
 425, 0.120
 430, 0.100
 435, 0.250
 440, 0.110
 445, 0.100
 450, 0.090
 455, 0.090
 460, 0.110
 465, 0.080
 470, 0.100
 475, 0.090
 480, 0.080
 485, 0.075
 490, 0.070
 495, 0.085
 500, 0.100
 505, 0.090
 510, 0.080
 515, 0.090
 520, 0.110
 525, 0.100
 530, 0.140
 537, 0.980
 540, 0.800
 546, 0.450
 550, 0.120
 555, 0.100
 560, 0.090
 565, 0.140
 570, 0.290
 575, 0.120
 580, 0.190
 588, 0.520
 590, 0.260
 595, 0.740
 600, 0.600
 605, 0.500
 610, 0.380
 615, 0.310
 620, 0.250
 625, 0.240
 630, 0.190
 635, 0.180
 640, 0.160
 645, 0.150
 650, 0.140
 655, 0.170
 660, 0.170
 665, 0.120
 670, 0.130
 675, 0.120
 680, 0.100
 685, 0.120
 690, 0.080
 695, 0.090
 700, 0.070
 800, 0.0
}

// High Pressure Sodium
#declare ES_Phillips_HPS = spline{ linear_spline
 350, 0.0  
 400, 0.005,
 405, 0.0075
 410, 0.0100
 415, 0.0125
 420, 0.0150
 425, 0.0175
 430, 0.0200
 435, 0.0250
 440, 0.0250
 445, 0.0100
 450, 0.0300
 455, 0.0200
 460, 0.0100
 465, 0.0700
 470, 0.0300
 475, 0.0250
 480, 0.0010
 485, 0.0050
 490, 0.0100
 495, 0.0200
 598, 0.2300
 505, 0.0100
 510, 0.0100
 515, 0.0600
 520, 0.0100
 525, 0.0100
 530, 0.0100
 535, 0.0100
 540, 0.0100
 545, 0.0250
 550, 0.0200
 555, 0.0300
 560, 0.0500
 565, 0.1100
 569, 0.9300
 575, 0.1200
 580, 0.2100
 585, 0.6700
 590, 0.1200
 593, 0.6900
 600, 0.3700
 605, 0.2300
 610, 0.1800
 616, 0.3600
 620, 0.0900
 625, 0.0700
 630, 0.0600
 635, 0.0550
 640, 0.0500
 645, 0.0475
 650, 0.0450
 655, 0.0450
 660, 0.0400
 665, 0.0350
 670, 0.0400
 675, 0.0450
 680, 0.0350
 685, 0.0250
 690, 0.0200
 695, 0.0150
 700, 0.0100
 800, 0.0
}
// Osram lamps:
// - Tungsten Halogen -
#declare ES_Osram_CoolBeam_20w = spline{ linear_spline
 375, 0.05
 400, 0.10
 425, 0.20
 450, 0.35
 475, 0.50
 500, 0.75
 525, 1.00
 550, 1.30
 575, 1.70
 600, 1.90
 625, 2.30
 650, 2.55
 675, 2.90
 702, 3.20
 725, 2.80
 750, 2.30
 775, 1.75
}
// - Cool_White Fluorescent -
#declare ES_Osram_CoolFluor_36w = spline{ linear_spline
 300, 0.0
 406, 0.23
 425, 0.08
 436, 0.65
 475, 0.12
 500, 0.15
 525, 0.17
 546, 0.78
 578, 0.56
 600, 0.40
 625, 0.29
 650, 0.19
 675, 0.11
 700, 0.08
 725, 0.06
 750, 0.02
 800, 0.0
}
// Solux lamps:
// - Halogen 47 VOR -
#declare ES_Solux_Halog4700K = spline{ linear_spline
 380, 0.900
 400, 1.350
 420, 1.700
 440, 2.100
 460, 2.300
 480, 2.500
 500, 2.550
 520, 2.600
 540, 2.650
 560, 2.675
 580, 2.700
 600, 2.725
 620, 2.850
 640, 2.875
 660, 2.900
 680, 2.850
 700, 2.725
 720, 2.650
 740, 2.625
 760, 2.600
}
// - cornell box light (tungsten flood light with UV filter and diffusing glass plate) -
#declare ES_Cornell_Box_Light = spline{ linear_spline
 375, 0.40
 400, 0.35
 425, 0.50
 450, 0.85
 475, 1.30
 500, 1.75
 525, 2.20
 550, 2.60
 575, 3.45
 600, 4.00
 625, 4.40
 650, 4.75
 675, 4.85
 700, 4.30
 725, 3.60
 750, 2.90
 775, 2.50
}
// Pedro J. Aphalo:
// - sunlight -
#declare ES_Sunlight = spline{ linear_spline
 375, 1.2
 387, 1.5
 400, 2.0
 412, 3.0
 425, 3.1
 437, 3.5
 450, 3.5
 462, 4.8
 475, 5.4
 487, 5.2
 500, 5.6
 512, 5.7
 525, 5.8
 537, 6.0
 550, 6.2
 562, 6.2
 575, 6.2
 587, 6.5
 600, 6.5
 612, 6.5
 625, 6.5
 637, 6.7
 650, 6.7
 662, 7.0
 675, 7.1
 687, 6.1
 700, 6.7
 712, 7.0
 725, 6.1
 737, 6.8
 750, 7.0
 762, 3.6
}       

#declare ES_Extraterrestrial_Sun = spline{ linear_spline
 375.0, 1.400
 380.5, 1.289
 385.5, 1.000
 390.5, 1.223
 395.5, 1.378
 400.5, 1.649
 405.5, 1.672
 410.5, 1.502
 415.5, 1.736
 420.5, 1.760
 425.5, 1.697
 430.5, 1.470
 435.5, 1.725
 440.5, 1.715
 445.5, 1.823
 450.5, 2.146
 455.5, 2.036
 460.5, 2.042
 465.5, 2.044
 470.5, 1.879
 475.5, 2.018
 480.5, 2.037
 485.5, 1.920
 490.5, 1.694
 495.5, 1.928
 500.5, 1.859
 505.5, 1.995
 510.5, 1.949
 515.5, 1.902
 520.5, 1.625
 525.5, 1.920
 530.5, 1.780
 535.5, 1.900
 540.5, 1.772
 545.5, 1.903
 550.5, 1.864
 555.5, 1.899
 560.5, 1.845
 565.5, 1.800
 570.5, 1.772
 575.5, 1.832
 580.5, 1.840
 585.5, 1.786
 590.5, 1.710
 595.5, 1.785
 600.5, 1.748
 605.5, 1.766
 610.5, 1.705
 615.5, 1.715
 620.5, 1.736
 625.5, 1.634
 631.0, 1.641
 641.0, 1.616
 651.0, 1.408
 661.0, 1.573
 671.0, 1.518
 681.0, 1.494
 691.0, 1.450
 701.0, 1.388
 711.0, 1.387
 721.0, 1.332
 731.0, 1.327
 741.0, 1.259
 751.0, 1.263
 761.0, 1.238
} 

// - Daylight Fluorescent -
#declare ES_Daylight_Fluor = spline{ linear_spline
 380, 0.15
 390, 0.24
 400, 0.29
 410, 0.39
 420, 0.50
 430, 0.61
 440, 0.74
 450, 0.81
 460, 0.85
 470, 0.89
 480, 0.87
 490, 0.87
 500, 0.82
 510, 0.75
 520, 0.74
 530, 0.75
 540, 0.81
 550, 0.91
 560, 1.00
 570, 1.08
 580, 1.15
 590, 1.00
 600, 0.88
 610, 0.72
 620, 0.57
 630, 0.46
 640, 0.36
 650, 0.29
 660, 0.20
 670, 0.14
 680, 0.08
 690, 0.03
 700, 0.02
 760, 0.01
}

// Mitsubishi fluorescent lamps 
#declare ES_Mitsubishi_Metal_Halide = spline {linear_spline
 380, 0.05537
 385, 0.06442
 390, 0.06739
 395, 0.07781
 400, 0.08670
 405, 0.09800
 410, 0.10126
 415, 0.15310
 420, 0.25617
 425, 0.15692
 430, 0.13052
 435, 0.13058
 440, 0.10770
 445, 0.11281
 450, 0.13211
 455, 0.14657
 460, 0.17680
 465, 0.14886
 470, 0.15378
 475, 0.17005
 480, 0.20368
 485, 0.15713
 490, 0.20226
 495, 0.16863
 500, 0.18168
 505, 0.22725
 510, 0.21829
 515, 0.22002
 520, 0.17948
 525, 0.20085
 530, 0.22348
 535, 1.00000
 540, 0.44727
 545, 0.26827
 550, 0.17853
 555, 0.19613
 560, 0.17633
 565, 0.23762
 570, 0.23794
 575, 0.26481
 580, 0.24187
 585, 0.23008
 590, 0.23668
 595, 0.29373
 600, 0.37231
 605, 0.29687
 610, 0.37294
 615, 0.32956
 620, 0.26214
 625, 0.33428
 630, 0.25318
 635, 0.27188
 640, 0.26686
 645, 0.26418
 650, 0.25428
 655, 0.30646
 660, 0.27298
 665, 0.28917
 670, 0.24344
 675, 0.28037
 680, 0.25381
 685, 0.36634
 690, 0.25617
 695, 0.23700
 700, 0.26057
 705, 0.21279
 710, 0.16392
 715, 0.15480
 720, 0.13659
}

#declare ES_Mitsubishi_Daylight_Fluorescent = spline {linear_spline
 380, 0.03800
 385, 0.04914
 390, 0.06142
 395, 0.07214
 400, 0.08608
 405, 0.40442
 410, 0.12744
 415, 0.13014
 420, 0.14677
 425, 0.16333
 430, 0.18058
 435, 1.00000
 440, 0.21268
 445, 0.22404
 450, 0.24385
 455, 0.25627
 460, 0.26363
 465, 0.26432
 470, 0.26478
 475, 0.26662
 480, 0.26731
 485, 0.27099
 490, 0.27260
 495, 0.26593
 500, 0.26064
 505, 0.25282
 510, 0.24707
 515, 0.24109
 520, 0.23856
 525, 0.23626
 530, 0.23787
 535, 0.24454
 540, 0.25903
 545, 0.69611
 550, 0.28756
 555, 0.30297
 560, 0.31861
 565, 0.33241
 570, 0.34208
 575, 0.39361
 580, 0.41592
 585, 0.33678
 590, 0.32183
 595, 0.30320
 600, 0.28226
 605, 0.25903
 610, 0.24017
 615, 0.21452
 620, 0.19013
 625, 0.16846
 630, 0.14925
 635, 0.12938
 640, 0.11300
 645, 0.09922
 650, 0.08707
 655, 0.07525
 660, 0.06616
 665, 0.05848
 670, 0.05188
 675, 0.04585
 680, 0.04049
 685, 0.03653
 690, 0.03366
 695, 0.02998
 700, 0.02733
 705, 0.02448
 710, 0.02416
 715, 0.02019
 720, 0.01911
}

#declare ES_Mitsubishi_Moon_Fluorescent = spline {linear_spline
 380, 0.02951
 385, 0.03851
 390, 0.04821
 395, 0.05574
 400, 0.06740
 405, 0.36860
 410, 0.10009
 415, 0.10201
 420, 0.11446
 425, 0.12822
 430, 0.14304
 435, 1.00000
 440, 0.16901
 445, 0.17798
 450, 0.19317
 455, 0.20469
 460, 0.21135
 465, 0.21383
 470, 0.21442
 475, 0.21748
 480, 0.22084
 485, 0.22166
 490, 0.22450
 495, 0.21852
 500, 0.21412
 505, 0.21022
 510, 0.20451
 515, 0.20162
 520, 0.19957
 525, 0.19869
 530, 0.20372
 535, 0.21254
 540, 0.22829
 545, 0.66885
 550, 0.27115
 555, 0.29686
 560, 0.32393
 565, 0.35055
 570, 0.36973
 575, 0.43537
 580, 0.45861
 585, 0.38890
 590, 0.37875
 595, 0.36612
 600, 0.34108
 605, 0.31423
 610, 0.28987
 615, 0.26619
 620, 0.24340
 625, 0.20609
 630, 0.18101
 635, 0.15782
 640, 0.13772
 645, 0.11999
 650, 0.10453
 655, 0.09071
 660, 0.07868
 665, 0.06740
 670, 0.05946
 675, 0.05258
 680, 0.04597
 685, 0.04094
 690, 0.03727
 695, 0.03287
 700, 0.03325
 705, 0.02822
 710, 0.02466
 715, 0.02100
 720, 0.01952
}

#declare ES_Mitsubishi_Standard_Fluorescent = spline {linear_spline
 380, 0.02713
 385, 0.03494
 390, 0.04322
 395, 0.04965
 400, 0.05946
 405, 0.39188
 410, 0.09092
 415, 0.08761
 420, 0.09899
 425, 0.10964
 430, 0.12315
 435, 1.00000
 440, 0.14402
 445, 0.15086
 450, 0.16245
 455, 0.17122
 460, 0.17499
 465, 0.17661
 470, 0.17731
 475, 0.17838
 480, 0.18118
 485, 0.18135
 490, 0.18270
 495, 0.17816
 500, 0.17536
 505, 0.17289
 510, 0.17045
 515, 0.17272
 520, 0.17867
 525, 0.19043
 530, 0.20901
 535, 0.23566
 540, 0.27253
 545, 0.77821
 550, 0.35637
 555, 0.40227
 560, 0.44890
 565, 0.48659
 570, 0.51631
 575, 0.59386
 580, 0.60860
 585, 0.52331
 590, 0.50616
 595, 0.47693
 600, 0.44383
 605, 0.40565
 610, 0.36458
 615, 0.32568
 620, 0.28751
 625, 0.25054
 630, 0.21730
 635, 0.18756
 640, 0.16175
 645, 0.13861
 650, 0.11918
 655, 0.10135
 660, 0.08623
 665, 0.07345
 670, 0.06349
 675, 0.05431
 680, 0.04721
 685, 0.04088
 690, 0.03581
 695, 0.03105
 700, 0.02742
 705, 0.02355
 710, 0.02242
 715, 0.01858
 720, 0.01644
}

//=============================================================

#macro espd_lightsys_Release()
  #undef ES_GE_SW_Incandescent_60w
  #undef ES_GE_SW_Incandescent_100w
  #undef ES_Nikon_SB16_XenonFlash
  #undef ES_GTE_341_Warm
  #undef ES_GTE_341_Cool
  #undef ES_Phillips_PLS_11w
  #undef ES_Phillips_Mastercolor_3K
  #undef ES_Phillips_HPS
  #undef ES_Osram_CoolBeam_20w
  #undef ES_Osram_CoolFluor_36w
  #undef ES_Solux_Halog4700K
  #undef ES_Cornell_Box_Light
  #undef ES_Sunlight
  #undef ES_Extraterrestrial_Sun
  #undef ES_Daylight_Fluor
  #undef ES_Mitsubishi_Metal_Halide
  #undef ES_Mitsubishi_Daylight_Fluorescent
  #undef ES_Mitsubishi_Moon_Fluorescent
  #undef ES_Mitsubishi_Standard_Fluorescent
  #undef espd_lightsys_Inc_Temp
#end  

//=============================================================
       
#end // eof
