

clear all

load('hippocampus_data.mat')

tuning_matrix = createTuningMatrix(spike_matrix, pos);

B = 30;
[N, T] = size(spike_matrix);


firing_rate = reshape(tuning_matrix(8,:),B,B);
figure
imagesc(firing_rate), axis xy
title('2D Tuning Curve for Neuron #8')
figure
plot(pos(:,1), pos(:,2), 'Color', [.5 .5 .5])
title('Spike Locations for Neuron #8')
hold on
for i = 1:B
    for j = 1:B
        if firing_rate(i,j) >= 5
            for t = 1:T
                if ceil(pos(t,:))+5 == [j i]
                    plot(pos(t,1), pos(t,2), 'r', 'MarkerSize', 4)
                end
            end
        end
    end
end
