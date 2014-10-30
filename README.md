Retinafy
==================================================
Retinafy is a script & mixin collection to optimize your website for all possible retina image sizes!
This package contains of three main scripts:

1) A bash script to generate the seven different image sizes

2) A less mixin to generate the required css code, to let the browser always load the correct image size for the current device. E.g. iPhone 6 --> @2x; iPhone 6 Plus --> @3x, etc.

3) A jade mixin to include the required html code for a retina image that is also responsive in bootstrap.

Generate the required images
--------------------------------------------------

1) Create the your original image with four times the required size. That means if you want your image to be 100*100 pixels on a non-retina screen (@1x) you need to create it with 4 times the resolution (@4x), e.g. 400*400.
2) Copy that image in the original folder
3) Run the bash script:
  
    sh retinafy.sh

4) Copy over the resized folder structure within the converted folder, to your /img folder of your web project.

Installation
--------------------------------------------------

1) Copy over the retina-image.jade file & include it in your main jade template:

    include mixins/retina-image

2) Copy over the retina-image.less file & include it in your main less file:
    
    @import "retina-image.less";

Usage
--------------------------------------------------

1) Use the retinaImage mixin in your jade templates like this:

    +retinaImage(className, center, altTag)
    // e.g.:
    +retinaImage("myImageName", false, "This is my Awesome Image!")
 

2) Define a list of your retina images in your less file:

    .retinaImage(
        brand png 234 57,
        logoMain png 640 360,
        myImageName jpg 200 300;
    );
Note that is a 2 dimensional css-list. Hence the separator is the comma and then the space. The semicolon at the end is always needed to tell less that it is a list.
