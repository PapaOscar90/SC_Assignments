%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Introduction to Scientific Computing - WBCS14003              %
%                                                               %
%  Simulate spatial pattern formation in Matlab                 %
%  via cellular automata                                        %
%                                                               %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

clc;                                 % clear the command window 
close all                            % close open figure windows      
clear all;                           % remove items from the workspace

n=64;                                % number of cells horizontally/vertically
p=0.33;                              % probability that a cell is alive 
q=0.33;                              % probability that a cell is asleep
max_gen=100;                         % maximal number of generations

% Initialize matrix A 
imname='random3';                     % name of the pattern
R = rand(n,n);
A=(R>1-p-q)+(R>1-p);                       % n x n matrix A with random zeroes/ones
                                     % expected number of living cells is p (for n large)


fprintf('initial fraction of living cells=%f\n',sum(sum(abs(A==2)))/n^2);
fprintf('initial fraction of sleeping cells=%f\n',sum(sum(abs(A==1)))/n^2);

% Display the initial pattern of living, sleeping and dead cells in an image 
% The living cells are white, sleeping cells gray and dead cells black. 
figure;                              % open a figure window
         


% Write the image to a PNG file
gen=1;                               % current generation number 
imfile = [imname,'_n=',int2str(n),'_p=',num2str(p),'_q=',num2str(q),'_gen=',int2str(gen),'.png'];
imwrite(A/2, imfile);                  % write A 

% Expand matrix A to matrix A1 because of the extra borders needed
A1=zeros(n+2,n+2);                   % initialise (n+2)x(n+2) matrix with zeroes 
A1(2:n+1,2:n+1)=A;                   % Insert matrix A in matrix A1 
A2=zeros(n+2,n+2);
% Now compute the successive generations via the majority rule. 
% The algorithm should terminate as soon as no more differences 
% occur between successive generations.

imHandle = imagesc(A1,[0 2]);        % display the matrix A1 as an image. 
                                     % The value range of A is [0 1].
colormap(gray);                      % set a gray scale color table

while gen<=max_gen
  A2 = A1;
  for j=2:n+1
    for k=2:n+1
      neighborSum=0;
      M=A2(j-1:j+1,k-1:k+1);
      alivecount = sum(M(:) == 2);
      asleepcount = sum(M(:) == 1);
      if alivecount > 4
        A1(j,k) = 2;
      elseif asleepcount > 4
        A1(j,k) = 1;
      elseif (9 - alivecount - asleepcount) > 4
        A1(j,k) = 0;
      end
    end
  end
  if A1 == A2
    break;
  end
  gen++;
  set(imHandle, 'CData', A1);
  drawnow;
end

A = A1(2:n+1,2:n+1);

imfile = [imname,'_n=',int2str(n),'_p=',num2str(p),'_q=',num2str(q),'_gen=',int2str(gen),'.png'];
imwrite(A/2, imfile); 
fprintf('final fraction of living cells=%f\n',sum(sum(abs(A==2)))/n^2);
fprintf('final fraction of sleeping cells=%f\n',sum(sum(abs(A==1)))/n^2);
