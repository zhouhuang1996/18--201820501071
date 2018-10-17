x1=[-3,-2.7,-2.4,-2.1,-1.8,-1.5,-1.2,-0.9,-0.6,-0.3,0,0.3,0.6,0.9,1.2,1.5,1.8];
x2=[-2,-1.8,-1.6,-1.4,-1.2,-1,-0.8,-0.6,-0.4,-0.2,-2.2204,0.2,0.4,0.6,0.8,1,1.2];
y=sin(x1)+0.2*x2.*x2;
   y=[0.6589,0.2206,-0.1635,-0.4712,-0.6858,-0.7975,-0.8040,...
           -0.7113,-0.5326,-0.2875 ,0,0.3035,0.5966,0.8553,1.0600,1.1975,1.2618];    inputData  = [x1;x2]; %��x1,x2��Ϊ��������
   outputData = y;       %��y��Ϊ�������
 
   %ʹ��������������ݣ�inputData��outputData���������磬
   %���������ڵ������Ϊ3.�������㡢�����Ĵ��ݺ����ֱ�Ϊtansig��purelin��ʹ��trainlm����ѵ����
   net = newff(inputData,outputData,3,{'tansig','purelin'},'trainlm');
 
   %����һЩ���ò���
   net.trainparam.goal = 0.0001; %ѵ��Ŀ�꣺����������0.0001
   net.trainparam.show = 400;    %ÿѵ��400��չʾһ�ν��
   net.trainparam.epochs = 15000;  %���ѵ��������15000.
 
%����matlab�����繤�����Դ���train����ѵ������
   [net,tr] = train(net,inputData,outputData); 
 
%����matlab�����繤�����Դ���sim�����õ������Ԥ��ֵ
   simout = sim(net,inputData);  figure;  %�½���ͼ���ڴ���
  t=1:length(simout);
  plot(t,y,t,simout,'r')%��ͼ���Ա�ԭ����y������Ԥ���y