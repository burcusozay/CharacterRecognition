function [A]=imageProcess(A)
A=im2bw(A);
A=imresize(A,[50 50]);
A=double(A);
A=reshape(A,2500,1);
end