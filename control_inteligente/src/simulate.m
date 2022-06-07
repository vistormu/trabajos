function [result] = simulate(PID)
    Kp = PID(1);
    Ki = PID(2);
    Kd = PID(3);

    assignin('base', 'Kp', Kp );
    assignin('base', 'Ki', Ki );
    assignin('base', 'Kd', Kd );
    
    warning('off');
    load_system('ventilator');
    set_param('ventilator', 'StopTime', '15');
    simulation = sim('ventilator');
    data = simulation.get('simout');
    
    result.time = data.Data(:,1);
    result.pressure = data.Data(:,2);
    result.error = data.Data(:,3);
end