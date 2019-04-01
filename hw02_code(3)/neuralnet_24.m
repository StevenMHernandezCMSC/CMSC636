#%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
# Contains: Neural Network for truthtable in HW1.4
# Name: 2_4_neuralnet.m
# Course Instructor: Milos Manic
# Provided by: Course Instructor
#
# Derivative of: xor_neural.m
#%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


clear all

#load Truth Table from .txt file#
xorTT=load("neuralnet_24.txt");
dim=size(xorTT);
num_entries=dim(1);

#Seperate input matrix and output vector from Truth Table#
in=xorTT(:,1:end-1);
out=xorTT(:,end);

#Transpose them for Neural Toolbox function usage#
in=in';
out=out';

#minmax is required for creating a Feed-Forward Network in Octave
minmax_in=minmax(in);

#Create Feed-Forward Network using newff function#
#<For additional help, type "help newff"(without quotes) on the Octave prompt#
MLPnet=newff(minmax_in,[1 1],{"tansig","logsig"},"trainlm","learngdm","mse");

#Save Neural Network Structure in a text file
saveMLPStruct(MLPnet,"neuralnet_struct_24.txt");

#Show training performance every 1 step#
MLPnet.trainParam.show = 1;

#Train the neural network#
[net]=train(MLPnet,in,out);


for a = [0,1]
    for b = [0,1]
        for c = [0,1]
                sprintf("sim(net,[%d;%d;%d]) = %f", a,b,c, sim(net,[a;b;c]))
        end
    end
end
