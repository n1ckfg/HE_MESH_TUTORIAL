
////////////////// ControlP5 INTERFACE

void controlInit() {
  INTERFACES = new ControlP5(this);  
  INTERFACES.setAutoDraw(false); 

  // Create a new window (doesn't work in Processing 2.0+)
  CW = INTERFACES.addControlWindow("controlP5window", 10, 10, 200, 300, 30);

  //Create a Slider with val from 0 to 50, starting at val 10

    Slider coneTwist = INTERFACES.addSlider("TWISTANGLE").setPosition(10, 20).setRange(0.1, 6.0 ).setValue(.1); 
  // Some additional slider methods you can configure
  coneTwist.getCaptionLabel().setColorBackground(color(255, 20, 30)); 
  coneTwist.getCaptionLabel().getStyle().setPadding(4, 2, 2, 2); 
  // shift the caption label up by 4px
  coneTwist.getCaptionLabel().getStyle().setMargin(-5, 0, 0, 0); 

  Slider cylinderHeight = INTERFACES.addSlider("CYLINDERHEIGHT").setPosition(10, 40).setRange(10, 400).setValue(100); 
  Slider radTop = INTERFACES.addSlider("RADIUSTOP").setPosition(10, 60).setRange(50, 250).setValue(100); 
  Slider radBottom = INTERFACES.addSlider("RADIUSBOTTOM").setPosition(10, 80).setRange(10, 150).setValue(50); 

  Slider facets = INTERFACES.addSlider("FACETS").setPosition(10, 100).setRange(2, 30).setValue(7); 
  Slider steps = INTERFACES.addSlider("STEPS").setPosition(10, 120).setRange(1, 15).setValue(2); 

  Toggle t1 = INTERFACES.addToggle("STRUT").setPosition(10, 140).setSize(15, 15).setValue(false).setLabel("STRUT ON/OFF");
  Slider strutOFF = INTERFACES.addSlider("STRUTOFF").setPosition(10, 180).setRange(1, 15).setValue(6); 

  Slider strutFINESSE = INTERFACES.addSlider("FINESSE").setPosition(10, 200).setRange(0.1, 5.0).setValue(3.0); 


  // Add slider to new window
  coneTwist.setWindow(CW);
  cylinderHeight.setWindow(CW);
  radTop.setWindow(CW);
  radBottom.setWindow(CW);
  facets.setWindow(CW);
  steps.setWindow(CW);
  t1.setWindow(CW);
  strutOFF.setWindow(CW);
  strutFINESSE.setWindow(CW);
}

