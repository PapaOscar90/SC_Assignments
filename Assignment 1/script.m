% Assignment 1
% Thijs
% Phil
in=fopen('input.txt');
s=fgetl(in);
t=fgetl(in);
fclose(in);
len_s = length(s);
len_t = length(t);
p = 0;
q = 4;
g = 5;
D(1:len_s,1:len_t) = 0;
for i = 1:len_s+1
  D(i,1) = g*(i-1);
end
for j = 1:len_t+1
  D(1,j) = g*(j-1);
end
for i = 2:len_s+1
  for j = 2:len_t+1
    m = D(i-1,j-1);
    if s(i-1) == t(j-1)
      m += p;
    else
      m += q;
    end
    d = D(i-1,j) + g;
    d2 = D(i,j-1) + g;
    D(i,j) = min([m,d,d2]);
  end
end
