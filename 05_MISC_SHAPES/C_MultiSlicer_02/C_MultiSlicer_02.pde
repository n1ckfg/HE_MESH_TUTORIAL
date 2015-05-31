/*
PLEASE READ INTRO TAB
 */

/////////////////////////// GLOBALS ////////////////////////////
// LIBRARY
import wblut.math.*;
import wblut.processing.*;
import wblut.core.*;
import wblut.hemesh.*;
import wblut.geom.*;
import processing.opengl.*;

// HEMESH CLASSES & OBJECTS
HE_Mesh MESH; // Our mesh object
WB_Render RENDER; // Our render object
WB_Plane P;
int OPLANE_X, OPLANE_Y, OPLANE_Z;
int dPLANE_X, dPLANE_Y, dPLANE_Z;
int RADIUSBOTTOM, RADIUSBOTOP, FACETS,CONEHEIGHT, STEPS;
// CAM
import peasy.*;
PeasyCam CAM;

//ControlP5
import controlP5.*;

ControlP5 INTERFACES;
ControlWindow CW;
int PLATOTYPE;
int EXTRUDEDIST, CHAMFEREDGE, SLICE_OFFSET;
float BLENDING, STRETCH_FACT; 
boolean CATMULL, SLICE, CAP, SLICE_CAP, STRETCH;

float d;
/////////////////////////// SETUP ////////////////////////////

void setup() {
  size(800, 600, OPENGL);
  CAM = new PeasyCam(this, 300);
  PLATOTYPE = 1;  
  createMesh();
  createModifiers();
  controlInit();
}

/////////////////////////// DRAW ////////////////////////////
void draw() {
  background(255);
  //CAMERA
  CAM.beginHUD(); // this method disables PeasyCam for the commands between beginHUD & endHUD
  directionalLight(130, 130, 130, 1, 1, -1);
  directionalLight(255, 255, 255, -1, -1, 1);
  CAM.endHUD();

  //HEMESH
  noStroke();
  fill(255);
  createMesh();
  createModifiers();
  RENDER.drawFaces( MESH ); // Draw MESH faces
}

/////////////////////////// FUNCTIONS ////////////////////////////

// SOME KEYS INTERACTION
void keyPressed() {

  if (key == 'e') {
    // Hemesh includes a method for exporting geometry
    // in stl file format wich is very handy for 3D printing ;–)
    HET_Export.saveToSTL(MESH, sketchPath("export.stl"), 1.0);
    HET_Export.saveToOBJ(MESH, sketchPath("export"+ frameCount +".obj"));

  }

  if (key == 's') {
    saveFrame("screenShot_###.png");
    println("screen shot taken");
  }
  if (key == 'o') {
    // reset camera origin positions  - do this before
    // exporting your shape so your shape is positioned
    // on a flat plane ready for 3D printing
    CAM.reset(1000);
  }
  // Print camera position - could be helpful
  if (key == 'p') {
    float[] camPos = CAM.getPosition();
    println(camPos);
  }
  
   if ((keyCode == UP) && (PLATOTYPE !=5)) {
    PLATOTYPE ++;
  }
  if ((keyCode == DOWN)&& (PLATOTYPE !=1)) {
    PLATOTYPE --;
  }
}

