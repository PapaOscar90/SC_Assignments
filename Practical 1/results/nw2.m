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
D = [];
P = char([]);
for i = 1:len_s+1
  D(i,1) = g*(i-1);
  P(i,1) = '|';
end
for j = 1:len_t+1
  D(1,j) = g*(j-1);
  P(1,j) = '-';
end
P(1,1)= '*';
for i = 2:len_s+1
  for j = 2:len_t+1
    % m=match, d=delete, d2=delete2
    m = D(i-1,j-1);
    if s(i-1) != t(j-1)
      m += q;
    else
      m += p;
    end
    d = D(i-1,j) + g;
    d2 = D(i,j-1) + g;
    D(i,j) = min([m,d,d2]);
    if min([m,d,d2]) == m
      P(i,j) = '\';
    elseif min([m,d,d2]) == d
      P(i,j) = '|';
    else
      P(i,j) = '-';
    end
  end
end
D
P
