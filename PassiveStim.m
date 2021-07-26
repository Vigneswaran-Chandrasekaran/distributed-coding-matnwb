% Function to read passive stimulus data and convert to corresponding
% TimeSeries objects
function [beep_ts, click_ts, pass_l, pass_r, pass_white] = PassiveStim(...
                  pass_beeps, pass_clicks, pass_vis, pass_vis_left, ...
                  pass_vis_right, pass_noise, ...
                  pb_data_unit, pb_description, ...
                  pc_data_unit, pc_description, ...
                  pvl_data_unit, pvl_description, ...
                  pvr_data_unit, pvr_description, ...
                  pvc_data_unit, pvc_description)

    arguments
        pass_beeps (1, :) string
        pass_clicks (1, :) string
        pass_vis (1, :) string
        pass_vis_left (1, :) string
        pass_vis_right (1, :) string
        pass_noise (1, :) string
        pb_data_unit char = 'Unknown'
        pb_description char = 'No description'
        pc_data_unit char = 'Unknown'
        pc_description char ='No description'
        pvl_data_unit char = 'Unknown'
        pvl_description char = 'No description'
        pvr_data_unit char = 'Unknown'
        pvr_description char ='No description'
        pvc_data_unit char = 'Unknown'
        pvc_description char = 'No description'
    end
    %% add passive beeps
    pass_beeps = readNPY(pass_beeps);
    pb_data = ones(length(pass_beeps), 1);
    beep_ts = types.core.TimeSeries(...
                'timestamps', pass_beeps', ...
                'data', pb_data, ...
                'data_unit', pb_data_unit, ...
                'description', pb_description);

    %% passive valve clicks
    pass_clicks = readNPY(pass_clicks);
    pc_data = ones(length(pass_clicks), 1);
    click_ts = types.core.TimeSeries(...
                'timestamps', pass_clicks', ...
                'data', pc_data, ...
                'data_unit', pc_data_unit, ...
                'description', pc_description);

    %% passive visual times
    pass_vis = readNPY(pass_vis);
    pass_vis_left = readNPY(pass_vis_left);
    pass_vis_right = readNPY(pass_vis_right);

    pass_l = types.core.TimeSeries(...
                'timestamps', pass_vis', ...
                'data', pass_vis_left', ...
                'data_unit', pvl_data_unit, ...
                'description', pvl_description);

     pass_r = types.core.TimeSeries(...
                'timestamps', pass_vis', ...
                'data', pass_vis_right', ...
                'data_unit', pvr_data_unit, ...
                'description', pvr_description);

    %% passive valve clicks
    pass_noise = readNPY(pass_noise);
    pc_data = ones(length(pass_noise), 1);
    pass_white = types.core.TimeSeries(...
                'timestamps', pass_noise', ...
                'data', pc_data, ...
                'data_unit', pvc_data_unit, ...
                'description', pvc_description);

end
