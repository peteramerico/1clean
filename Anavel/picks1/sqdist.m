%function D = sqdist(X,Y)
%D = bsxfun(@plus,dot(X,X,1)',dot(Y,Y,1))-2*(X'*Y);

%function sqdist(X,Y)
%sqdist(X,Y) = bsxfun(@plus,dot(X,X,1)',dot(Y,Y,1))-2*(X'*Y);

function D = sqdist(X,Y)
D = sqrt( bsxfun(@plus,sum(X.^2,2),sum(Y.^2,2)') - 2*(X*Y') );

%function D = sqdist(X,Y)
%n1 = size(X,2);
%n2 = size(Y,2);
%D = zeros(n1,n2);
%for i = 1:n1
%    for j = 1:n2
%        D(i,j) = sum((X(:,i)-Y(:,j)).^2);
%    end
%end