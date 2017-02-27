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
if (len_s ~= len_t)
  disp('lengths of input strings are not equal');
  return;
end

% The result should be a real number HD equal to the Hamming distance of s and t

HD=0;  % initialize the Hamming distance to zero 

% Put string s into first row and t into third row of matrix A
A(1,:)=s;  
A(3,:)=t;                        
% Put '|' symbol at all positions of the second row of matrix A 
% where there is a match between the letters in string s and string t
% Also, increase HD for each mismatch
                      
for i=1:len_s
    if (s(i)~=t(i)) HD=HD+1; A(2,i)=' '; 
    else  A(2,i)='|'; 
    end
end

% Print the Hamming distance on the screen:

fprintf('Hamming distance=%d\n',HD);

% Print the alignment on the screen:

fprintf('\nAlignment:\n\n');
disp(A);

% Print the alignment to a file:
output=fopen('hamming3-output.txt', 'w');      % open file
fprintf(output,'Name: Anonymous\n');           % enter your name(s)
fprintf(output,'IBC, Practical Example\n');

fprintf(output,'Hamming distance=%d\n',HD);
fprintf(output,'\nAlignment:\n\n');
% Here comes the code for printing the alignment 
% That is, the rows of matrix A below one another
for i=1:3
  for j=1:len_s
  fprintf(output,'%s',A(i,j));
  end
  fprintf(output,'\n');
end
fclose(output);                            % close file
