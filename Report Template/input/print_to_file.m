% Print the alignment to a file:
output=fopen('hamming3-output.txt', 'w');      % open file
fprintf(output,'Name: <Your name(s)>\n');      % enter your name(s)
fprintf(output,'IBC, Practical Example\n');

fprintf(output,'Hamming distance=%d\n',HD);
fprintf(output,'\nAlignment:\n\n');
% Here comes the code for printing the alignment 
....

fclose(output);                                % close file
