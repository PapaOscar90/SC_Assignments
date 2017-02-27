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
      strcat(l_al, ' ');
    else
      match += p;
      strcat(l_al, '|');
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

fprintf("D:\n");
disp(D);
fprintf("P:\n");
disp(P);
fprintf("\n", s, "\n");
fprintf(l_al, "\n");
fprintf(t, "\n");