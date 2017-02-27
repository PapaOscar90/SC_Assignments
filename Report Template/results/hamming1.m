%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Introduction to Scientific Computing - WBCS14003             %
%                                                              %
%  Compute the Hamming distance for 2 sequences in Matlab      %
%                                                              %
%                                                              %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

clear all;                           % remove items from the workspace

in=fopen('input.txt');               % open file
s=fgetl(in);                         % read line 1 of the input
t=fgetl(in);                         % read line 2 of the input
fclose(in);                          % close file
len_s=length(s);                     % length string s
len_t=length(t);                     % length string t

% Here comes your code
% First test whether the input strings are of the same length. If not, stop.
if (len_s ~= len_t)
  disp('lengths of input strings are not equal');
  return;
end

HD=0;  % initialize the Hamming distance to zero 

% Increase HD for each mismatch
                      
for i=1:len_s
    if (s(i)~=t(i)) HD=HD+1;
    end
end

% Print the Hamming distance on the screen:

fprintf('Hamming distance=%d\n',HD);

