# Mechanical_Vibration_Analysis_with_MATLAB_and_Arduino
This is a real-time project where I used ADXL335, a 3-axis-accelerometer to measure unknown vibrations and then analyze them in Matlab and plot them in Excel

I uploaded the project video as this [Linkedin post](https://www.linkedin.com/posts/sarker-safat-mahmud-safat99_matlab-arduinoproject-vibrationanalysis-activity-6836175024676843520-7reA).
You can check for the demonstration and... Enjoy!!!

### The Main Objectives:
The main task of this project is to find the car's (test object) vibration and analyze all the outputs. With a similar setup and codes, any kind of mechanical vibration of an object can be found.

### Flow-Diagram of the Project
![Flow Chart](imp_outputs/vibration_flow_1.png)

### Theoretical Background
* For understanding about the mechanical vibration analysis, this paper is very much useful:
[Measuring-mechanical-vibrations.pdf](Measuring-mechanical-vibrations.pdf)
* To know how to work with ADXL335 sensor, this [LastMinuteEngineers](https://lastminuteengineers.com/adxl335-accelerometer-arduino-tutorial/) tutorial is very much helpful. 
* Check the [ADXL335 datasheet](ADXL335.pdf)

### Components
* Arduino
* ADXL335 3-axis accelerometer (minimum 2 for comparing outputs)
* long wires (I used cat6 cable)
* veroboard, male headers, jumper cable, soldering iron, etc.
* 5V power supply, can be a power-bank, or battery. (I used the laptop's USB output for powering the setup) 
* Vibration speaker (I didn't have any. but it is very useful for checking the results for a given frequency)

### Circuit Diagram
Circuit Diagram is made using [circuito.io](https://www.circuito.io/) an easy readymade drag-and-drop circuit design app
![](https://github.com/Safat99/Mechanical_Vibration_Analysis_with_MATLAB_and_Arduino/blob/main/imp_outputs/circuit_diagram.png)

### The main setup 
The whole device looked like this. Here I have used CAT6 cables for covering long distances.
![](output_vdos_and_pics/main_setup1.jpeg)


### The main operations and Results
To obtain the task, first, the sensors' data is collected from Arduino IDE's serial monitor. Then it is stored as a CSV file and MATLAB will read that CSV as a table. Then by applying **gaussian smooth** and **bandpass filter** the noises from the signal were reduced and the signal now looked like this:

![](https://github.com/Safat99/Mechanical_Vibration_Analysis_with_MATLAB_and_Arduino/blob/main/output_vdos_and_pics/graph%20outputs/after_bandpass.jpg)


then applying **fast fourier transform** the signal will shift from **Time Domain** to **Frequency Domain**. The frequency that has the peak power will be the naturally measured frequency and the rest of the frequencies are the noises. You can check the [imp_outputs](imp_outputs/) folder's images for the details outputs.

![](https://github.com/Safat99/Mechanical_Vibration_Analysis_with_MATLAB_and_Arduino/blob/main/imp_outputs/smooth_back_fourier_result1.jpg)

Finally, another custom method for finding frequency is done by Excel in [here](test_data/workbench.xlsx). For different tire pressures, different frequencies were found for both front and back sensors. The output of the final figures for different pressures is 

![](https://github.com/Safat99/Mechanical_Vibration_Analysis_with_MATLAB_and_Arduino/blob/main/output_vdos_and_pics/graph%20outputs/combined_back.png)

### Findings 
from all the figures and the graphs the vibration of the **car (where the sensor is placed)** was varied for several reasons including:
* acceleration and deacceleration of car
* noise of the sensors ( for the higher frequency we can see the noises )
* road defects and others 
