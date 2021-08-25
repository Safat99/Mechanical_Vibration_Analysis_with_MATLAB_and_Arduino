# Mechanical_Vibration_Analysis_with_MATLAB_and_Arduino
This is a real time project where I used ADXL335, a 3-axis-accelerometer to measure unknown vibration and then analyze them in matlab and plot them in excel

### The Main Objectives:
The main task is for this project is to find the car's (test object) vibration and analysis all the outputs. With the similar set-up and codes anykind of mechanical vibration of an object can be found.

### Flow-Diagram of the Project
![Flow Chart](imp_outputs/vibration_flow_1.png)

### Theoretical Background
* For understand about the mechanical vibration analysis, this paper is very much useful:
[Measuring-mechanical-vibrations.pdf](Measuring-mechanical-vibrations.pdf)
* To know how to work with ADXL335 sensor, this [LastMinuteEngineers](https://lastminuteengineers.com/adxl335-accelerometer-arduino-tutorial/) tutorial is very much helpful. 
* Check the [ADXL335 datasheet](ADXL335.pdf)

### Components
* Arduino
* ADXL335 3-axis accelerometer (minimum 2 for comparing outputs)
* long wires (I used cat6 cable)
* veroboard, male headers, jumper cable, soldering iron etc.
* 5V power-supply, can be a power-bank, or battery. (I used laptop's usb output as powering the setup) 
* Vibration speaker (I didn't have any. but it is very useful for check the results for a given frequency)
### The main setup 
The whole device looked like this.
![](output_vdos_and_pics/main_setup1.jpeg)

### The main operations and Results
To obtain the task, first the sensors data is collected from Arduino IDE's serial monitor. Then it is stored as csv file and MATLAB will read that csv as table. Then by applying **gaussian smooth** and **bandpass filter** the noises from the signal is reduced and the signal is looked like this:

![](https://github.com/Safat99/Mechanical_Vibration_Analysis_with_MATLAB_and_Arduino/blob/main/output_vdos_and_pics/graph%20outputs/after_bandpass.jpg)


then applying **fast fourier transform** the signal will shift from **Time Domain** to **Frequency Domain**. The frequency which has the peak power will be the natural measured frequency and rest of the frequencies are the noises.Check the [imp_outputs](imp_outputs/) folder's images for the details outputs.

![](https://github.com/Safat99/Mechanical_Vibration_Analysis_with_MATLAB_and_Arduino/blob/main/imp_outputs/smooth_back_fourier_result1.jpg)

And finally the another custom method for finding frequency is done by excel in [here](test_data/workbench.xlsx). And for different pressure of tire the differnet frequencies had found for both front and back sensors. The ouput of the final figures for different pressure is 

![](https://github.com/Safat99/Mechanical_Vibration_Analysis_with_MATLAB_and_Arduino/blob/main/output_vdos_and_pics/graph%20outputs/combined_back.png)

### Findings 
from all the figures and the graphs the vibration of the **car (where the sensor is placed)** was vaired because of several reasons inlcuding:
* acceleration and deacceleration of car
* noise of the sensors ( for the higher frequency we can see the noises )
* road defects and others 
