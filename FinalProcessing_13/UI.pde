
String textValue = "";

void controlP5setup() {
  //controll p5
  cp5 = new ControlP5(this);
  Textlabel myTextlabelA;
  // change the default font 
  PFont p = createFont("boxed", 10);
  PFont pbig = createFont("boxed", 40); 
  cp5.setControlFont(p);

  cp5.setColorLabel(color(255));

  controlWindow = cp5.addControlWindow("Control Panel", 1100, 1100)
    //.hideCoordinates()
    .setBackground(color(0))
      ;

  /////////////////////////////////Tabs///////////////////////
  cp5.getTab("default")
    .activateEvent(true)
      .setLabel("my default tab")
        .setId(1)
          ;


  cp5.addTab("Communicate")
    .setHeight(100) 
      .setColorBackground(color(0))
        .setColorLabel(color(0))
          .setColorActive(color(0))
            .setLabel("Communicate")
              .moveTo(controlWindow)


                ;

  cp5.addTab("Robot_01")
    .setColorBackground(color(0, 160, 100))
      .setColorLabel(color(255))
        .setColorActive(color(255, 128, 0))
          .setLabel("Robot_01")
            .moveTo(controlWindow)

              ;
  cp5.addTab("Robot_02")
    .setColorBackground(color(0, 160, 100))
      .setColorLabel(color(255))
        .setColorActive(color(255, 128, 0))
          .setLabel("Robot_02")
            .moveTo(controlWindow)

              ;
  cp5.addTab("Robot_03")
    .setColorBackground(color(0, 160, 100))
      .setColorLabel(color(255))
        .setColorActive(color(255, 128, 0))
          .setLabel("Robot_0")
            .moveTo(controlWindow)

              ;   

  cp5.addTab("Visualize")
    .setColorBackground(color(0, 160, 100))
      .setColorLabel(color(255))
        .setColorActive(color(255, 128, 0))
          .setLabel("Visualize")
            .moveTo(controlWindow)
              ; 



  //  cp5.tab("DEFAULT").setWidth(200).setHeight(100);
  cp5.tab("Communicate").setWidth(200).setHeight(80)  .setColorBackground(color(0)).setColorForeground(color(0)).setColorActive(color(0));
  cp5.getTab("Communicate").getCaptionLabel().setFont(createFont("boxed", 15)).align(ControlP5.CENTER, 0).setPaddingX(0);
  cp5.tab("Robot_01").setWidth(200).setHeight(80)  .setColorBackground(color(0)).setColorForeground(color(0)).setColorActive(color(0));
  cp5.getTab("Robot_01").getCaptionLabel().setFont(createFont("boxed", 15)).align(ControlP5.CENTER, 0).setPaddingX(0);   
  cp5.tab("Robot_02").setWidth(200).setHeight(80)  .setColorBackground(color(0)).setColorForeground(color(0)).setColorActive(color(0));
  cp5.getTab("Robot_02").getCaptionLabel().setFont(createFont("boxed", 15)).align(ControlP5.CENTER, 0).setPaddingX(0);
  cp5.tab("Robot_03").setWidth(200).setHeight(80)  .setColorBackground(color(0)).setColorForeground(color(0)).setColorActive(color(0));
  cp5.getTab("Robot_03").getCaptionLabel().setFont(createFont("boxed", 15)).align(ControlP5.CENTER, 0).setPaddingX(0);
  cp5.tab("Visualize").setWidth(200).setHeight(80)  .setColorBackground(color(0)).setColorForeground(color(0)).setColorActive(color(0));
  cp5.getTab("Visualize").getCaptionLabel().setFont(createFont("boxed", 15)).align(ControlP5.CENTER, 0).setPaddingX(0);


  myTextlabelA = cp5.addTextlabel("label3")
    .setText("____________")
      .setPosition(92, 70)
        .setFont(createFont("boxed", 20))
          .moveTo(controlWindow)
            .moveTo("Communicate")
              ;                   

  myTextlabelA = cp5.addTextlabel("label4")
    .setText("____________")
      .setPosition(292, 70)
        .setFont(createFont("boxed", 20))
          .moveTo(controlWindow)
            .moveTo("Robot_01")
              ;                  

  myTextlabelA = cp5.addTextlabel("label5")
    .setText("____________")
      .setPosition(497, 70)
        .setFont(createFont("boxed", 20))
          .moveTo(controlWindow)
            .moveTo("Robot_02")
              ;  
  myTextlabelA = cp5.addTextlabel("label6")
    .setText("____________")
      .setPosition(701, 70)
        .setFont(createFont("boxed", 20))
          .moveTo(controlWindow)
            .moveTo("Robot_03")
              ;  
  myTextlabelA = cp5.addTextlabel("label7")
    .setText("____________")
      .setPosition(908, 70)
        .setFont(createFont("boxed", 20))
          .moveTo(controlWindow)
            .moveTo("Visualize")
              ;  


  PImage[] imgs33= {
    loadImage("botibotcian.png"), loadImage("botibotbleu.png"), loadImage("botibotpink.png")
    };              
    cp5.addButton("triggerxx")
      .setPosition(70, 700)
        .setSize(400, 200)
          .moveTo(controlWindow)
            .setColorBackground( color( 237, 42, 123 ) )
              //  .setLabel("Home")
              .setImages(imgs33)
                //.updateSize()
                // .moveTo("default");

                ;
  ///////////////////////// COMUNICATION /////////////
  PImage[] imgs0 = {
    loadImage("icon_293cian.png"), loadImage("icon_293bleu.png"), loadImage("icon_293pink.png")
    };              
    cp5.addButton("triggerAA")
      .setPosition(90, 500)
        .setSize(400, 200)
          .moveTo(controlWindow)
            .setColorBackground( color( 237, 42, 123 ) )
              .setLabel("Home")
                .setImages(imgs0)
                  //.updateSize()
                  .moveTo("Communicate")
                    ;


  PImage[] imgs1 = {
    loadImage("icon_23052cian.png"), loadImage("icon_23052bleu.png"), loadImage("icon_23052pink.png")
    };    
    cp5.addButton("triggerBB")
      .setPosition(350, 500)
        .setSize(40, 20)
          .moveTo(controlWindow)
            .setColorBackground( color( 237, 42, 123 ) )        
              .setLabel("On")
                .setImages(imgs1)
                  .updateSize()
                    .moveTo("Communicate")
                      ;


  PImage[] imgs2 = {
    loadImage("icon_4930cian.png"), loadImage("icon_4930bleu.png"), loadImage("icon_4930pink.png")
    };    
    cp5.addButton("triggerE")
      .setPosition(610, 500)
        .setSize(40, 20)
          .moveTo(controlWindow)
            .setColorBackground( color(237, 42, 123 ) )        
              .setLabel("Off")
                .setImages(imgs2)
                  .updateSize()
                    .moveTo("Communicate")
                      ;


  PImage[] imgs3 = {
    loadImage("icon_4298cian.png"), loadImage("icon_4298bleu.png"), loadImage("icon_4298pink.png")
    };    
    cp5.addButton("triggerFF")
      .setPosition(870, 500)
        .setSize(40, 20)
          .moveTo(controlWindow)
            .setColorBackground( color( 237, 42, 123 ) )        
              .setLabel("Data")
                .setImages(imgs3)
                  .updateSize()
                    .moveTo("Communicate")
                      ;



  ///////////////////////////////////////      BOT 1      ///////////////////////////////////////////



  cp5.addSlider("speedBot1") 

    .setPosition(330, 210)
      .setSize(250, 820)
        .setRange(0, 300)
          .setValue(120)
            .setNumberOfTickMarks(21)
              .moveTo(controlWindow)
                .setColorBackground( color( 237, 42, 123 ) )
                  .setColorActive( color( 0, 113, 197) )
                    .setColorForeground ( color( 0, 173, 239) ) 
                      .setTriggerEvent(Slider.RELEASE)
                        .setLabel("Speed")
                          .moveTo("Robot_01")

                            ;
  cp5.getController("speedBot1").getValueLabel().setFont(createFont("boxed", 40));
  cp5.getController("speedBot1").getCaptionLabel().setFont(createFont("boxed", 20)).align(ControlP5.CENTER, ControlP5.BOTTOM_OUTSIDE).setPaddingX(0);
  ;



  PImage[] imgs12 = {
    loadImage("icon_4930cian.png"), loadImage("icon_4930bleu.png"), loadImage("icon_4930pink.png")
    };     

    cp5.addButton("triggerL")
      .setPosition(90, 200)
        .setSize(40, 40)
          .moveTo(controlWindow)
            .setColorBackground( color( 237, 42, 123 ) )        
              .setLabel("bot1_on/off")
                .setImages(imgs12)
                  .updateSize()
                    .moveTo("Robot_01")
                      ;


  PImage[] imgs14 = {
    loadImage("icon_19460cian.png"), loadImage("icon_19460bleu.png"), loadImage("icon_19460pink.png")
    };    
    cp5.addButton("triggerR")
      .setPosition(90, 550)
        .setSize(40, 40)
          .moveTo(controlWindow)
            .setColorBackground( color( 237, 42, 123 ) )        
              .setLabel("speedUp")
                .setImages(imgs14)
                  .updateSize()
                    .moveTo("Robot_01")
                      ;  



  PImage[] imgs19 = {
    loadImage("icon_2850cian.png"), loadImage("icon_2850bleu.png"), loadImage("icon_2850pink.png")
    };    
    cp5.addButton("triggerS")
      .setPosition(90, 900)
        .setSize(40, 40)
          .moveTo(controlWindow)
            .setColorForeground( color( 237, 42, 123) )   
              .setLabel("SspeedDown")
                .setImages(imgs19)
                  .updateSize()
                    .moveTo("Robot_01")
                      ;



  PImage[] imgs18 = {
    loadImage("icon_19460cian.png"), loadImage("icon_19460bleu.png"), loadImage("icon_19460pink.png")
    };    
    cp5.addButton("triggerbot1b")
      .setPosition(870, 550)
        .setSize(40, 40)
          .moveTo(controlWindow)
            .setColorBackground( color( 237, 42, 123 ) )        
              .setLabel("cnc_Up")
                .setImages(imgs18)
                  .updateSize()
                    .moveTo("Robot_01")

                      ;   


  PImage[] imgs13 = {
    loadImage("icon_2850cian.png"), loadImage("icon_2850bleu.png"), loadImage("icon_2850pink.png")
    };    
    cp5.addButton("triggerM")
      .setPosition(870, 900)
        .setSize(40, 40)
          .moveTo(controlWindow)
            .setColorBackground( color( 237, 42, 123 ) )        
              .setLabel("cncDown")
                .setImages(imgs13)
                  .updateSize()
                    .moveTo("Robot_01")
                      ;  


  myTextlabelA = cp5.addTextlabel("label")
    .setText("CNC")
      .setPosition(900, 760)
        .setFont(createFont("boxed", 30))
          .moveTo(controlWindow)
            .moveTo("Robot_01")
              ;   


  /////////////////////////////BOT 2///////////////////////

  PImage[] imgs9 = {
    loadImage("icon_4930cian.png"), loadImage("icon_4930bleu.png"), loadImage("icon_4930pink.png")
    };   
    cp5.addButton("triggerD")
      .setPosition(90, 200)
        .setSize(40, 40)
          .moveTo(controlWindow)
            .setColorBackground( color( 237, 42, 123 ) )        
              .setLabel("bot2_on/off")
                .setImages(imgs9)
                  .updateSize()
                    .moveTo("Robot_02")
                      ;



  PImage[] imgs8 = {
    loadImage("icon_19460cian.png"), loadImage("icon_19460bleu.png"), loadImage("icon_19460pink.png")
    };    
    cp5.addButton("triggerC")
      .setPosition(90, 550)
        .setSize(40, 40)
          .moveTo(controlWindow)
            .setColorForeground( color( 237, 42, 123) )   
              .setLabel("bot2_speedUp")
                .setImages(imgs8)
                  .updateSize()
                    .moveTo("Robot_02")

                      ; 


  PImage[] imgs16 = {
    loadImage("icon_2850cian.png"), loadImage("icon_2850bleu.png"), loadImage("icon_2850pink.png")
    };    
    cp5.addButton("triggerQ")
      .setPosition(90, 900)
        .setSize(40, 40)
          .moveTo(controlWindow)
            .setColorBackground( color( 237, 42, 123 ) )        
              .setLabel("bot2_speedDown")
                .setImages(imgs16)
                  .updateSize()
                    .moveTo("Robot_02")
                      ;                      


  cp5.addSlider("speed") 
    .setPosition(330, 210)
      .setSize(150, 820)
        .setRange(0, 100)
          .setValue(0)        
            .setNumberOfTickMarks(21)
              .moveTo(controlWindow)
                .setColorBackground( color( 237, 42, 123 ) )
                  .setColorActive( color( 0, 113, 197) )
                    .setColorForeground ( color( 0, 173, 239) ) 
                      .setTriggerEvent(Slider.RELEASE)
                        .setLabel("Speed")
                          .moveTo("Robot_02")
                            ; 


  cp5.getController("speed").getValueLabel().setFont(createFont("boxed", 40));
  cp5.getController("speed").getCaptionLabel().setFont(createFont("boxed", 20)).align(ControlP5.CENTER, ControlP5.BOTTOM_OUTSIDE).setPaddingX(0);                        



  PImage[] imgs15 = {
    loadImage("icon_19460cian.png"), loadImage("icon_19460bleu.png"), loadImage("icon_19460pink.png")
    };    
    cp5.addButton("triggerP")
      .setPosition(680, 200)
        .setSize(40, 40)
          .moveTo(controlWindow)
            .setColorBackground( color( 237, 42, 123 ) )        
              .setLabel("goUp")
                .setImages(imgs15)
                  .updateSize()
                    .moveTo("Robot_02")
                      ;

  PImage[] imgs23 = {
    loadImage("icon_2850cian.png"), loadImage("icon_2850bleu.png"), loadImage("icon_2850pink.png")
    };   
    cp5.addButton("triggerT")
      .setPosition(680, 550)
        .setSize(40, 40)
          .moveTo(controlWindow)
            .setColorBackground( color( 237, 42, 123 ) )        
              .setImages(imgs23)
                .updateSize()
                  .moveTo("Robot_02")
                    ;


  cp5.addSlider("steer") 
    .setPosition(930, 210)
      .setSize(80, 460)
        .setRange(-5, 5)
          .setValue(0)
            .setNumberOfTickMarks(11)
              .setSliderMode(Slider.FLEXIBLE)
                .moveTo(controlWindow)
                  .setColorBackground( color( 237, 42, 123 ) )
                    .setColorActive( color( 0, 113, 197) )
                      .setColorForeground ( color( 0, 173, 239) ) 
                        .setTriggerEvent(Slider.RELEASE)
                          .setLabel("Steer")
                            .moveTo("Robot_02")
                              ; 

  cp5.getController("steer").getValueLabel().setFont(createFont("boxed", 40)).setPaddingX(10);
  cp5.getController("steer").getCaptionLabel().setFont(createFont("boxed", 20)).align(ControlP5.CENTER, ControlP5.BOTTOM_OUTSIDE).setPaddingX(0);                             

  //cp5.getController("steer").getCaptionLabel().align(ControlP5.LEFT, ControlP5.BOTTOM_OUTSIDE).setPaddingX(0).setPaddingY(14);


  cp5.addSlider("shifts") 
    .setPosition(680, 790)
      .setSize(350, 60)
        .setRange(-5, 5)
          .setValue(-5)
            .setNumberOfTickMarks(11)
              .setSliderMode(Slider.FLEXIBLE)
                .moveTo(controlWindow)
                  .setColorBackground( color( 237, 42, 123 ) )
                    .setColorActive( color( 0, 113, 197) )
                      .setColorForeground ( color( 0, 173, 239) ) 
                        .setTriggerEvent(Slider.RELEASE)
                          .setLabel("Shifts")
                            .moveTo("Robot_02")
                              ; 

  cp5.getController("shifts").getValueLabel().setFont(createFont("boxed", 40)).align(ControlP5.LEFT, ControlP5.LEFT_OUTSIDE).setPaddingX(-50);
  cp5.getController("shifts").getCaptionLabel().setFont(createFont("boxed", 20)).align(ControlP5.CENTER, ControlP5.BOTTOM_OUTSIDE).setPaddingX(0).setPaddingY(14);  




  PImage[] imgs22 = {
    loadImage("icon_2850cian.png"), loadImage("icon_2850bleu.png"), loadImage("icon_2850pink.png")
    };  
    cp5.addButton("triggerW")
      .setPosition(680, 900)
        .setSize(40, 40)
          .moveTo(controlWindow)
            .setColorForeground( color( 237, 42, 123) )   
              .setImages(imgs22)
                .updateSize()
                  .moveTo("Robot_02")

                    ; 


  PImage[] imgs21 = {
    loadImage("icon_19460cian.png"), loadImage("icon_19460bleu.png"), loadImage("icon_19460pink.png")
    };      

    cp5.addButton("triggerX")
      .setPosition(900, 900)
        .setSize(40, 40)
          .moveTo(controlWindow)
            .setColorBackground( color( 237, 42, 123 ) )        
              .setImages(imgs21)
                .updateSize()
                  .moveTo("Robot_02")
                    ;   






  /////////////////////////////////////////////    BOT 3   /////////////////////////////////////////////////////  

  PImage[] imgs26 = {
    loadImage("icon_4930cian.png"), loadImage("icon_4930bleu.png"), loadImage("icon_4930pink.png")
    };   
    cp5.addButton("triggerY")
      .setPosition(90, 200)
        .setSize(40, 40)
          .moveTo(controlWindow)
            .setColorBackground( color( 237, 42, 123 ) )        
              .setLabel("3rd on/off")
                .setImages(imgs26)
                  .updateSize()
                    .moveTo("Robot_03")
                      ;


  PImage[] imgs28 = {
    loadImage("icon_19460cian.png"), loadImage("icon_19460bleu.png"), loadImage("icon_19460pink.png")
    };    
    cp5.addButton("triggerZ")
      .setPosition(90, 550)
        .setSize(40, 40)
          .moveTo(controlWindow)
            .setColorForeground( color( 237, 42, 123) )   
              .setLabel("3rd speed up")
                .setImages(imgs28)
                  .updateSize()
                    .moveTo("Robot_03")

                      ; 


  PImage[] imgs27 = {
    loadImage("icon_2850cian.png"), loadImage("icon_2850bleu.png"), loadImage("icon_2850pink.png")
    };    
    cp5.addButton("triggerF")
      .setPosition(90, 900)
        .setSize(40, 40)
          .moveTo(controlWindow)
            .setColorBackground( color( 237, 42, 123 ) )        
              .setLabel("3rd speed down")
                .setImages(imgs27)
                  .updateSize()
                    .moveTo("Robot_03")
                      ;    

  cp5.addSlider("speedJin") 
    .setPosition(330, 210)
      .setSize(150, 820)
        .setRange(0, 100)
          .setValue(0)
            .setNumberOfTickMarks(21)
              .moveTo(controlWindow)
                .setColorBackground( color( 237, 42, 123 ) )
                  .setColorActive( color( 0, 113, 197) )
                    .setColorForeground ( color( 0, 173, 239) ) 
                      .setTriggerEvent(Slider.RELEASE)
                        .setLabel("Speed")
                          .moveTo("Robot_03")
                            ;
  cp5.getController("speedJin").getValueLabel().setFont(createFont("boxed", 40));
  cp5.getController("speedJin").getCaptionLabel().setFont(createFont("boxed", 20)).align(ControlP5.CENTER, ControlP5.BOTTOM_OUTSIDE).setPaddingX(0);   


  PImage[] imgs10 = {
    loadImage("icon_2751cian.png"), loadImage("icon_2751bleu.png"), loadImage("icon_2751pink.png")
    };    
    cp5.addButton("triggerI")
      .setPosition(680, 200)
        .setSize(40, 40)
          .moveTo(controlWindow)
            .setColorForeground( color( 237, 42, 123) )   
              .setLabel("3rdBot front")
                .setImages(imgs10)
                  .updateSize()
                    .moveTo("Robot_03")
                      ; 

  PImage[] imgs11 = {
    loadImage("icon_2751ciandown.png"), loadImage("icon_2751bleudown.png"), loadImage("icon_2751pinkdown.png")
    };    
    cp5.addButton("triggerJ")
      .setPosition(900, 200)
        .setSize(40, 40)
          .moveTo(controlWindow)
            .setColorBackground( color( 237, 42, 123 ) )        
              .setLabel("3rdBot back")
                .setImages(imgs11)
                  .updateSize()
                    .moveTo("Robot_03")

                      ; 



  cp5.addSlider("steerJin")
    .setPosition(680, 740)
      .setSize(350, 80)
        .setRange(-20, 20) 
          .setValue(0)
            .setNumberOfTickMarks(17)
              .setSliderMode(Slider.FLEXIBLE)
                .moveTo(controlWindow)
                  .setColorBackground( color( 237, 42, 123 ) )
                    .setColorActive( color( 0, 113, 197) )
                      .setColorForeground ( color( 0, 173, 239) ) 
                        .setTriggerEvent(Slider.RELEASE) 
                          .setLabel("Steer") 
                            .moveTo("Robot_03")
                              ;

  cp5.getController("steerJin").getValueLabel().setFont(createFont("boxed", 40)).align(ControlP5.LEFT, ControlP5.LEFT_OUTSIDE).setPaddingX(-80);
  cp5.getController("steerJin").getCaptionLabel().setFont(createFont("boxed", 20)).align(ControlP5.CENTER, ControlP5.BOTTOM_OUTSIDE).setPaddingX(0).setPaddingY(14);  


  PImage[] imgs25 = {
    loadImage("icon_2850cian.png"), loadImage("icon_2850bleu.png"), loadImage("icon_2850pink.png")
    };    
    cp5.addButton("triggerB")
      .setPosition(680, 900)
        .setSize(40, 40)
          .moveTo(controlWindow)
            .setColorForeground( color( 237, 42, 123) )   
              .setImages(imgs25)
                .updateSize()
                  .moveTo("Robot_03")

                    ; 



  PImage[] imgs24 = {
    loadImage("icon_19460cian.png"), loadImage("icon_19460bleu.png"), loadImage("icon_19460pink.png")
    };    
    cp5.addButton("triggerA")
      .setPosition(900, 900)
        .setSize(40, 40)
          .moveTo(controlWindow)
            .setColorBackground( color( 237, 42, 123 ) )        
              .setImages(imgs24)
                .updateSize()
                  .moveTo("Robot_03")
                    ;   

  myTextlabelA = cp5.addTextlabel("label2")
    .setText("FRONT / BACK")
      .setPosition(795, 350)
        .setFont(createFont("boxed", 20))
          .moveTo(controlWindow)
            .moveTo("Robot_03")
              ;     










  /////////////////////////////////// VISUALISATION ///////////////////////////////

  PImage[] imgs4 = {
    loadImage("icon_2108cian.png"), loadImage("icon_2108bleu.png"), loadImage("icon_2108pink.png")
    };    
    cp5.addButton("path")
      // .setSwitch(false).setOff()
      .setPosition(90, 500)
        .setSize(400, 200)
          .moveTo(controlWindow)
            .setColorBackground( color( 237, 42, 123 ) ) 
              .setLabel("path")
                .setImages(imgs4)
                  .updateSize()
                    .moveTo("Visualize")


                      ;
  PImage[] imgs5 = {
    loadImage("pointscian.png"), loadImage("pointsbleu.png"), loadImage("pointspink.png")
    };    
    cp5.addButton("pts")
      // .setSwitch(false).setOff()
      .setPosition(350, 500)
        .setSize(40, 20)
          .moveTo(controlWindow)
            .setColorBackground( color( 237, 42, 123 ) ) 
              .setLabel("points")
                .setImages(imgs5)
                  .updateSize()
                    .moveTo("Visualize")

                      ;
  PImage[] imgs6 = {
    loadImage("icon_6508cian.png"), loadImage("icon_6508bleu.png"), loadImage("icon_6508pink.png")
    };    
    cp5.addButton("autoMode")
      .setPosition(610, 500)
        .setSize(40, 20)
          .moveTo(controlWindow)
            .setColorBackground( color( 237, 42, 123 ) ) 
              .setLabel("Auto")
                .setImages(imgs6)
                  .updateSize()
                    .moveTo("Visualize")
                      ;
  PImage[] imgs7 = {
    loadImage("icon_6506cian.png"), loadImage("icon_6506bleu.png"), loadImage("icon_6506pink.png")
    };    
    cp5.addButton("manualNewStep")
      .setPosition(870, 500)
        .setSize(40, 20)
          .moveTo(controlWindow)
            .setColorBackground( color( 237, 42, 123 ) ) 
              .setLabel("Manual")
                .setImages(imgs7)
                  .updateSize()
                    .moveTo("Visualize")
                      ;
}

