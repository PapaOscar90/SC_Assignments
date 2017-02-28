% Assignment 1 - CS7
% Thijs Baksteen s3145034
% Phil Oetinger  s2966018
in=fopen('nw_test1.txt');
s=fgetl(in);
t=fgetl(in);
fclose(in);
len_s = length(s);
len_t = length(t);
p = 0;
q = 4;
g = 5;
%D(1:len_s,1:len_t) = 0;
for i = 1:len_s+1
  D(i,1) = g*(i-1);
  P(i,1) = '|';
end
for j = 1:len_t+1
  D(1,j) = g*(j-1);
  P(1,j) = '-';
end
P(1,1)= '*';
l_al = '';
for i = 2:len_s+1
  for j = 2:len_t+1
    match = D(i-1,j-1);
    if s(i-1) != t(j-1)
      match += q;
    else
      match += p;
    end
    delete = D(i-1,j) + g;
    delete2 = D(i,j-1) + g;
    D(i,j) = min([match,delete,delete2]);
    if min([match,delete,delete2]) == match
      P(i,j) = '\';
    elseif min([match,delete,delete2]) == delete
      P(i,j) = '|';
    else
      P(i,j) = '-';
    end
  end
end
i = len_s+1;
j = len_t+1;
s_al = "";
t_al = "";
l_al = "";
while i != 1 || j != 1
  c = P(i,j);
  if (c == '\')
    i -= 1;
    j -= 1;
    t_al = [t(j), t_al];
    s_al = [s(i), s_al];
    if (s(i) == t(j))
      l_al = ['|', l_al];
    else
      l_al = [' ', l_al];
    end
  elseif (c == '|')
    i -= 1;
    l_al = [' ', l_al];
    s_al = [s(i), s_al];
    t_al = ['-', t_al];
  elseif (c == '-')
    j -= 1;
    l_al = [' ', l_al];
    t_al = [t(j), t_al];
    s_al = ['-', s_al];
  end
end
output=fopen('nw3-output.txt', 'w');      % open file
fprintf(output,'Name: Philip Oetinger, Thijs Baksteen\n'); % enter your name(s)
fprintf(output,'IBC, Practical 3\n\n');
fprintf(output,'\n\nString s:\n');
for i=1:length(s)
  fprintf(output,'%s',s(i));
end
fprintf(output,'\n\nString t:\n');
for i=1:length(t)
  fprintf(output,'%s',t(i));
end

fprintf(output,'\n\nMatrix D:\n\n');
for i=1:len_s+1
  for j=1:len_t+1
    fprintf(output, "%4d", D(i,j));
  end
  fprintf(output, "\n");
end
fprintf(output,'\n\nMatrix P:\n\n');
dlmwrite(output,P,'');
fprintf(output,'\n\nAlignment:\n\n');
fprintf(output, "\n%s\n", s_al);
fprintf(output, "%s\n", l_al);
fprintf(output, "%s\n", t_al);
fclose(output);
