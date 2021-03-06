function [ img_out, v ] = solve_ambiguities( img1, img2 )
% SOLVE_AMBIGUITIES resolves ambiguities arising from a single-point
% connectivity betweeen two pixels in a contour (diagonal connexion between
% equal pixels)
%
%   Input:
%       img1     :   Image from which to solve ambiguities
%       img2     :   Reference image for comparison (use here an image
%                    generated by the nearest neighbor algorithm)
%
%   Output:
%       img_out  :   Image with ambuguities resolved
%       v        :   Vector of the positions of the ambiguities
%
% Details:
%       When ambiguity happens, we keep the pixel with smaller
%       intensities in all 3 RGB channels. The assumption made is that
%       colors closer to black tend to be part of the foreground (and of
%       the characters' edges) in pixel-art. We compare our image with
%       the one genererated by the nearest neighbor super-resolution
%       algorithm because this algorithm tends to keep single-point
%       diagonal connectivities.
%
% Authors: Gabriel Trevisan
%          Rodrigo Pena
% Date: 21 Nov 2011
% Testing:

% Initialization
difference = img2 - img1;
count = 0;
[rd, cd, dd] = size(difference);
v = zeros(2, rd * cd); % Position vector of the ambiguities
img_out = img1;

% Sweep difference image and look for ambiguous points
for i = 1:rd-1
    for j = 1:cd-1
        
        % Test equality on the first diagonal
        if sum(difference(i,j,:) == difference(i+1,j+1,:)) == dd
            
            % Test equality on the second diagonal
            if sum(difference(i+1,j,:) == difference(i,j+1,:)) == dd
                
                % Test inequality on the sides
                if sum(difference(i+1,j,:) ~= difference(i,j,:)) >= 1
                    
                    count = count + 1;
                    v(2,count) = i;
                    v(1,count) = j;

                    img_out(i, j, :) = ...
                        min([img2(i, j, :), ...
                        img1(i, j, :)]);
                    
                    img_out(i+1, j+1, :) = ...
                        min([img2(i+1, j+1, :), ...
                        img1(i+1, j+1, :)]);
                    
                    img_out(i, j+1, :) = ...
                        min([img2(i, j+1, :), ...
                        img1(i, j+1, :)]);
                    
                    img_out(i+1, j, :) = ...
                        min([img2(i+1, j, :), ...
                        img1(i+1, j, :)]);
                    
                end
            end
        end
    end
end

% Trim down v
v = v(:,1:count);

end

