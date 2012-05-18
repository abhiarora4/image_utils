function Xr = XYZ2RGB(X, whitepoint)

if ((nargin < 2) || isempty(whitepoint)),
	whitepoint = 'D65';
end;

if (strcmpi(whitepoint, 'd50')),
	Y = [3.1336   -1.6168   -0.4907;
		-0.9787    1.9161    0.0335;
		0.0721   -0.2291    1.4054];
elseif (strcmpi(whitepoint, 'd65')),
	Y = [3.2406 -1.5372 -0.4986;
		-0.9689 1.8758 0.0415;
		0.0557 -0.2040 1.0570];
else
	error('Unrecognized white point.');
end;

Xr = reshape((Y * [reshape(X(:, :, 1), 1, size(X, 1) * size(X, 2));...
				reshape(X(:, :, 2), 1, size(X, 1) * size(X, 2));...
				reshape(X(:, :, 3), 1, size(X, 1) * size(X, 2))])',...
			size(X));

val = min(Xr(:));
if (val < 0);
	Xr = Xr - val;
end;

% Rec. ITU-R BT.709 D65, mitsuba
% [3.240479 -1.537150 -0.498535;
% -0.969256 1.875991 0.041556;
% 0.055648 -0.204043 1.057311];

% Rec. ITU-R BT.709-3 D65, lindbloom
% [3.2404542 -1.5371385 -0.4985314;
% -0.9692660 1.8760108 0.0415560;
% 0.0556434 -0.2040259 1.0572252];

% Rec. ITU-R BT.709-3 D65, my derivation
% [3.241564564938965 -1.537665242342843 -0.498702240759841;
% -0.969201189545655 1.875885346007446 0.041553237558736;
% 0.055624158684600 -0.203955248510200 1.056859015007398];

% IEC 61966-2-1:1999, D65, wikipedia & colorspace
% [3.2406 -1.5372 -0.4986;
% -0.9689 1.8758 0.0415;
% 0.0557 -0.2040 1.0570];

% Bradford-adapted, D50 matrices
% [3.1338561 -1.6168667 -0.4906146;
% -0.9787684 1.9161415 0.0334540;
% 0.0719453 -0.2289914 1.4052427];
