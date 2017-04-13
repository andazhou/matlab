tau = 0.0005;
for i = 1:3
    decoded_replay = bayesDecode(spike_matrix,tuning_matrix,replay_time(i,:),tau);
    figure
    plotTrajectory(pos,replay_time(i,:),decoded_replay);
   
end
