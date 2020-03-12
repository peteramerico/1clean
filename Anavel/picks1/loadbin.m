function out = loadbin(fname,n1,n2);
% LOADBIN  Load floats from a binary file.
% OUT = LOADBIN(FNAME,N1,N2) reads data from binary file FNAME into the
% N1 times N2 matrix OUT. Default if N1 and N2 are not given: single
% vector; if only N1 is given, N2 is calculated from the total number of
% floats in FNAME.


[fid,err] = fopen(fname,'rb');
if fid > 0;
  out = fread(fid,[1 inf],'float32');
  fclose(fid);
  no = length(out);
  if nargin > 1;
    if nargin < 3;
       n2=floor(length(out)/n1);
    end
    if n1*n2 ~= no;
      out = out(1:n1*n2);
      warning(strcat(['Read only ',num2str(n1*n2),' of ',...
                     num2str(no),' floats in file ',fname]));
    end  
    out = reshape(out,n1,n2);
  end
else
  error(err);
end
