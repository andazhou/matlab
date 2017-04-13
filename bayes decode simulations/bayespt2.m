
% Part 2

clear all

load('hippocampus_data.mat')
tuning_matrix = createTuningMatrix(spike_matrix, pos);

%tau = [0.11, 0.21, 0.31, 0.41, 0.51, 0.81, 1.81, 2.81, 5.81, 10.81];
tau = 0.31;
% for both behavior_time sets
for bt_index = 1:2
    erroravg = 0;
    % and for multiple values of tau
    %for tau_index = 1:10
        for j=1:10
            %ten percent 
            ten = randi([1 69],1,7);
            %75 percent
            sfive = randi([1 69],1,52);
            %25 percent
            tfive = randi([1 69],1,17);
            
            spike_matrix_subset = spike_matrix(tfive,:);
            tuning_matrix_subset = createTuningMatrix(spike_matrix_subset, pos);
            decoded_locations = bayesDecode(spike_matrix_subset, tuning_matrix_subset, behavior_time(bt_index,:), tau);

            % subtract 5 from decoded_locations to reset them to original pos range
            decoded_locations = decoded_locations - 5;

            range = behavior_time(bt_index,1):behavior_time(bt_index,2);
            diff = pos(range,:) - decoded_locations;
            sqrerr = sum(diff.^2, 2);
            error = mean(sqrt(sqrerr));
            erroravg = erroravg + error;
            fprintf('For behavior_time set #%d and tau = %.2f, the mean error is %.2f\n', bt_index, tau, error)
            fprintf('Testing 10 of neurons: average error over 10 random subsets is %.2f\n', erroravg/10);

           % if tau_index == 1 || tau_index == 4 || tau_index == 7
                figure
                plot(pos(:,1), pos(:,2), 'Color', [.5 .5 .5])
                hold on
                plot(pos(range,1), pos(range,2), 'b', 'LineWidth', 3)
                plot(decoded_locations(:,1), decoded_locations(:,2), 'rx', 'MarkerSize', 7, 'LineWidth', 3)
                xlabel(sprintf('Behavior time set %d; Mean error = %.2f; tau = %.2f', bt_index, error, tau))
           % end

        end
    end

    fprintf('\n')
    
%end

