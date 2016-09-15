function [f,g] = UF2(x)
  % UF2
  % x and y are columnwise, the input x must be inside the search space and
  % it could be a matrix
  global nfuneval 
  global nviolate
  x = x';
  [dim, num]  = size(x);
  X1          = repmat(x(1,:),[dim-1,1]);
  A           = 6*pi*X1 + pi/dim*repmat((2:dim)',[1,num]);
  tmp         = zeros(dim,num);
  tmp(2:dim,:)= (x(2:dim,:) - 0.3*X1.*(X1.*cos(4.0*A)+2.0).*cos(A)).^2;
  tmp1        = sum(tmp(3:2:dim,:));  % odd index
  tmp(2:dim,:)= (x(2:dim,:) - 0.3*X1.*(X1.*cos(4.0*A)+2.0).*sin(A)).^2;
  tmp2        = sum(tmp(2:2:dim,:));  % even index
  f(1,:)      = x(1,:)             + 2.0*tmp1/size(3:2:dim,2);
  f(2,:)      = 1.0 - sqrt(x(1,:)) + 2.0*tmp2/size(2:2:dim,2);
  f = f';
  nfuneval = nfuneval + 1;
  g = 0;
  clear X1 A tmp;
end