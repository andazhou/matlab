function success = show_band(GP, LP, type, kern)
    % Shows all elements in a Gaussian or Laplacian pyramid
    % LP is Laplacian
    % GP is Gaussian
    % Types = {'Gaussian', 'Laplacian', 'Gaussian_Expand',
    % 'Laplacian_Expand'}
    
    n = size(GP, 2);

    if strcmp(type, 'Gaussian') == 1
        success = true;
        for j = 1:n
            subplot(2, ceil(n/2),j);
            imshow(GP{j}, []);
            title(sprintf('n = %d', j-1));
        end
    elseif strcmp(type, 'Laplacian') == 1 
        success = true;
        for j = 1:n
            subplot(2, ceil(n/2),j);
            imshow(LP{j}, []);
            title(sprintf('n = %d', j-1));
        end
    elseif strcmp(type, 'Gaussian_Expand') == 1 
        success = true;
        for j = 1:n
            exp = expandktimes(GP{j}, j, kern);
            subplot(2, ceil(n/2),j);
            imshow(exp, []);
            title(sprintf('n = %d', j-1));
        end
    elseif strcmp(type, 'Laplacian_Expand') == 1 
        success = true;
        for j = 1:n
            exp = expandktimes(LP{j}, j, kern);
            subplot(2, ceil(n/2),j);
            imshow(exp, []);
            title(sprintf('n = %d', j-1));
        end
    else success = false;
    end

end
