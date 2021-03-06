function imOut = setL(imIn, L, colorSpace, whitepoint)

if ((nargin < 3) || isempty(colorSpace)),
	colorSpace = 'sRGB';
end;

if ((nargin < 4) || isempty(whitepoint)),
	whitepoint = 'D65';
end;

if (strcmpi(colorSpace, 'sRGB')),
	imIn = sRGB2RGB(imIn);
elseif (~strcmpi(colorSpace, 'RGB')),
	error('Invalid color space');
end;

imLab = RGB2Lab(imIn, whitepoint);
imLab(:, :, 1) = L;
imOut = Lab2RGB(imLab, whitepoint);

if (strcmpi(colorSpace, 'sRGB')),
	imOut = RGB2sRGB(imOut);
end;
