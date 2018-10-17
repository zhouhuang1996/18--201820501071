x1=[-3,-2.7,-2.4,-2.1,-1.8,-1.5,-1.2,-0.9,-0.6,-0.3,0,0.3,0.6,0.9,1.2,1.5,1.8];
x2=[-2,-1.8,-1.6,-1.4,-1.2,-1,-0.8,-0.6,-0.4,-0.2,-2.2204,0.2,0.4,0.6,0.8,1,1.2];
y=sin(x1)+0.2*x2.*x2;
   y=[0.6589,0.2206,-0.1635,-0.4712,-0.6858,-0.7975,-0.8040,...
           -0.7113,-0.5326,-0.2875 ,0,0.3035,0.5966,0.8553,1.0600,1.1975,1.2618];    inputData  = [x1;x2]; %将x1,x2作为输入数据
   outputData = y;       %将y作为输出数据
 
   %使用用输入输出数据（inputData、outputData）建立网络，
   %神经网络隐节点个数设为3.其中隐层、输出层的传递函数分别为tansig和purelin，使用trainlm方法训练。
   net = newff(inputData,outputData,3,{'tansig','purelin'},'trainlm');
 
   %设置一些常用参数
   net.trainparam.goal = 0.0001; %训练目标：均方误差低于0.0001
   net.trainparam.show = 400;    %每训练400次展示一次结果
   net.trainparam.epochs = 15000;  %最大训练次数：15000.
 
%调用matlab神经网络工具箱自带的train函数训练网络
   [net,tr] = train(net,inputData,outputData); 
 
%调用matlab神经网络工具箱自带的sim函数得到网络的预测值
   simout = sim(net,inputData);  figure;  %新建画图窗口窗口
  t=1:length(simout);
  plot(t,y,t,simout,'r')%画图，对比原来的y和网络预测的y