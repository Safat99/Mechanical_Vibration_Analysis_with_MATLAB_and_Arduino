clear all;
close all;
clc;

a = arduino;
plotTitle = 'Arduino Real Time Data Log';
xLabel = 'time';
yLabel = 'AnalogValue';
yMax = 25;
yMin = 5;
xMin = 0;
xMax = 30;
delay = .005;                     % make sure sample faster than resolution 

%%%%%%%%% function variables 
time = 0;
data1=0;
data2 = 0;
data3 = 0;
count =0;

%%%%%%%%set up plot
plotGraph1 = plot(time,data1,'-r')
hold on
plotGraph2 = plot(time,data2,'-g')
plotGraph3 = plot(time,data3,'-b')
title(plotTitle,'FontSize',15);
xlabel(xLabel,'FontSize',15);
ylabel(yLabel, 'FontSize',15);
axis([xMin xMax yMin yMax]);
grid('on');



tic
while ishandle(plotGraph1)
    
    tmp1=0,tmp2=0,tmp3=0;
    for i=1:5
%         tmp1 = tmp1 + readVoltage(a,'A2') * 1023/5;
%         tmp2 = tmp2 + readVoltage(a,'A1') * 1023/5;
%         tmp3 = tmp3 + readVoltage(a,'A0') * 1023/5;
   
%         tmp1 = tmp1 + (readVoltage(a,'A2') - 1.65) * 3/1.65 ;
%         tmp2 = tmp2 + (readVoltage(a,'A1') - 1.65) * 3/1.65 ;
%         tmp3 = tmp3 + (readVoltage(a,'A0') - 1.65) * 3/1.65 ;
   
        tmp1 = tmp1 + (readVoltage(a,'A2'))*10;
        tmp2 = tmp2 + (readVoltage(a,'A1'))*10;
        tmp3 = tmp3 + (readVoltage(a,'A0'))*10;
    end
    
    xInput = tmp1/5;
    yInput = tmp2/5;
    zInput = tmp3/5;
%     
%     xInput = mapfun(xInput,0,1023,-3000,3000)/1000;
%     yInput = mapfun(yInput,0,1023,-3000,3000)/1000;
%     zInput = mapfun(zInput,0,1023,-3000,3000)/1000;
    
    count = count + 1;
    time(count) = toc;
    
    start = 0;
    if time(count) > 30
        start = time(count) - 30;
    end
    
    data1(count) = xInput;
    data2(count) = yInput; 
    data3(count) = zInput;
    
    set(plotGraph1,'XData',time,'YData',data1);
    set(plotGraph2,'XData',time,'YData',data2);
    set(plotGraph3,'XData',time,'YData',data3);
     
    axis([start time(count) yMin yMax]);
    
    pause(delay);

end

%delete(a);
disp('plot Closed and arduino object has been deleted');