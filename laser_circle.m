axis equal;
hold on;

xlabel('x');
ylabel('y');
zlabel('z');

rotate_x = @(theta)[
                    1 , 0           , 0          , 0;
                    0 , cos(theta)  , sin(theta) , 0;
                    0 , -sin(theta) , cos(theta) , 0;
                    0 , 0           , 0          , 1;
                    ];

rotate_y = @(theta)[
                    cos(theta)  , 0 , sin(theta) , 0;
                    0           , 1 , 0          , 0;
                    -sin(theta) , 0 , cos(theta) , 0;
                    0           , 0 , 0          , 1;
                   ];

rotate_z = @(theta)[
                    cos(theta)  , sin(theta) , 0 , 0;
                    -sin(theta) , cos(theta) , 0 , 0;
                    0           , 0          , 1 , 0;
                    0           , 0          , 0 , 1;
                   ];

theta = 0 : pi / 180 : 2 * pi;
[col,row] = size(theta);

pipe_length = 20;
pipe_raidus = 5;

% pipe_rotate_x_angle = 0;
% pipe_rotate_y_angle = 0;
% pipe_rotate_z_angle = 0;

[cylinder_x, cylinder_y, cylinder_z] = cylinder(pipe_raidus, 100);
cylinder_z = cylinder_z * pipe_length;
pipe_x = cylinder_z;
pipe_y = cylinder_x;
pipe_z = cylinder_y;

%draw pipe
mesh(pipe_x, pipe_y, pipe_z);

%laser working point is half pipe x length
laser_working_point_x = pipe_length / 2;
laser_offset_center_distance = 0;
laser_up_lift_distance = 5;
laser_circle_raduis = pipe_raidus;

laser_pos_x = laser_working_point_x;
laser_pos_y = laser_offset_center_distance;
laser_pos_z = pipe_raidus + laser_up_lift_distance;

%draw laser trail
laser_trail_x = laser_pos_x + laser_circle_raduis * cos(theta);
laser_trail_y = laser_pos_y + laser_circle_raduis * sin(theta);
laser_trail_z = laser_pos_z * ones(1, row);

plot3(laser_trail_x, laser_trail_y, laser_trail_z, 'b*');

%draw cilcle trail
cut_trail_x = laser_trail_x;
cut_trail_y = laser_trail_y;
cut_trail_z = sqrt(pipe_raidus^2 - cut_trail_y.^2);
need_penetrate = false;
for i = 1 : row
    if (abs( cut_trail_y(1, i)) > pipe_raidus)
        need_penetrate = true;
        continue;
    end
    if (cut_trail_x(1,i) < 0 || cut_trail_x(1,i) > pipe_length)
        continue;
    end
    plot3(cut_trail_x(1,i), cut_trail_y(1,i), cut_trail_z(1,i), 'r*');
end

if (need_penetrate)
    for i = 1 : row
        if (abs( cut_trail_y(1, i)) > pipe_raidus)
            continue;
        end
        if (cut_trail_x(1,i) < 0 || cut_trail_x(1,i) > pipe_length)
            continue;
        end
        plot3(cut_trail_x(1,i), cut_trail_y(1,i), - cut_trail_z(1,i), 'y*');
    end
end

%arc guide line parament
arc_guide_line_radius = 3;
arc_guide_line_radians_factor = 1 / 8;
arc_guide_line_radians_length = 2 * pi * arc_guide_line_radius * arc_guide_line_radians_factor;
arc_guide_line_circle_center_x = laser_pos_x + laser_circle_raduis - arc_guide_line_radius;
arc_guide_line_circle_center_y = laser_pos_y;
arc_guide_line_circle_center_z = laser_pos_z;
%judge guide line in/out circle
is_arc_guide_line_out_circle = false;
%add arc in guide line 
arc_guide_line_in_theta = arc_guide_line_radians_length : -pi / 180 : 0;
[arc_guide_line_in_col, arc_guide_line_in_row] = size(arc_guide_line_in_theta);
arc_trail_in_x = arc_guide_line_circle_center_x + arc_guide_line_radius * cos(arc_guide_line_in_theta);
arc_trail_in_y = arc_guide_line_circle_center_y + arc_guide_line_radius * sin(arc_guide_line_in_theta);
arc_trail_in_z = arc_guide_line_circle_center_z * ones(1, arc_guide_line_in_row);
if (is_arc_guide_line_out_circle)
    parallel_trail_in_x = arc_trail_in_x - arc_guide_line_circle_center_x;
    parallel_trail_in_y = arc_trail_in_y - arc_guide_line_circle_center_y;
    parallel_trail_in_z = arc_trail_in_z - arc_guide_line_circle_center_z;

    rotate_y_trail_in_x = parallel_trail_in_x * cos(pi) - parallel_trail_in_z * sin(pi);
    rotate_y_trail_in_y = parallel_trail_in_y;
    rotate_y_trail_in_z = parallel_trail_in_x * sin(pi) + parallel_trail_in_z * cos(pi);

    arc_trail_in_x = rotate_y_trail_in_x + arc_guide_line_circle_center_x + 2 * arc_guide_line_radius;
    arc_trail_in_y = rotate_y_trail_in_y + arc_guide_line_circle_center_y;
    arc_trail_in_z = rotate_y_trail_in_z + arc_guide_line_circle_center_z;
end
plot3(arc_trail_in_x, arc_trail_in_y, arc_trail_in_z, 'co');
%add arc out guide line
arc_guide_line_out_theta = 2 * pi - arc_guide_line_radians_length : pi / 180 : 2 * pi;
[arc_guide_line_out_col, arc_guide_line_out_row] = size(arc_guide_line_out_theta);
arc_trail_out_x = arc_guide_line_circle_center_x + arc_guide_line_radius * cos(arc_guide_line_out_theta);
arc_trail_out_y = arc_guide_line_circle_center_y + arc_guide_line_radius * sin(arc_guide_line_out_theta);
arc_trail_out_z = arc_guide_line_circle_center_z * ones(1, arc_guide_line_out_row);
if (is_arc_guide_line_out_circle)
    parallel_trail_out_x = arc_trail_out_x - arc_guide_line_circle_center_x;
    parallel_trail_out_y = arc_trail_out_y - arc_guide_line_circle_center_y;
    parallel_trail_out_z = arc_trail_out_z - arc_guide_line_circle_center_z;

    rotate_y_trail_out_x = parallel_trail_out_x * cos(pi) - parallel_trail_out_z * sin(pi);
    rotate_y_trail_out_y = parallel_trail_out_y;
    rotate_y_trail_out_z = parallel_trail_out_x * sin(pi) + parallel_trail_out_z * cos(pi);

    arc_trail_out_x = rotate_y_trail_out_x + arc_guide_line_circle_center_x + 2 * arc_guide_line_radius;
    arc_trail_out_y = rotate_y_trail_out_y + arc_guide_line_circle_center_y;
    arc_trail_out_z = rotate_y_trail_out_z + arc_guide_line_circle_center_z;
end
plot3(arc_trail_out_x, arc_trail_out_y, arc_trail_out_z, 'mo');
% draw arc in guide line trail
cut_arc_guide_line_in_x = arc_trail_in_x;
cut_arc_guide_line_in_y = arc_trail_in_y;
cut_arc_guide_line_in_z = sqrt(pipe_raidus^2 - cut_arc_guide_line_in_y.^2);
plot3(cut_arc_guide_line_in_x, cut_arc_guide_line_in_y, cut_arc_guide_line_in_z, 'r*');
% draw arc out guide line trail
cut_arc_guide_line_out_x = arc_trail_out_x;
cut_arc_guide_line_out_y = arc_trail_out_y;
cut_arc_guide_line_out_z = sqrt(pipe_raidus^2 - cut_arc_guide_line_out_y.^2);
plot3(cut_arc_guide_line_out_x, cut_arc_guide_line_out_y, cut_arc_guide_line_out_z, 'r*');

[~, frame_row_count] = size(arc_guide_line_in_theta);
move_laser_x = 0;
move_laser_y = 0;
move_laser_z = laser_pos_z;
hlaser = plot3(move_laser_x, move_laser_y, move_laser_z, 'ro');
for i = 1 : frame_row_count
    move_laser_x = arc_trail_in_x(1,i);
    set(hlaser, 'xdata', move_laser_x, 'ydata', move_laser_y, 'zdata', move_laser_z);
    drawnow;
    pause(0.01);
end

[~, frame_row_count] = size(theta);
for i = 1 : frame_row_count
    move_laser_x = cut_trail_x(1,i);
    set(hlaser, 'xdata', move_laser_x, 'ydata', move_laser_y, 'zdata', move_laser_z);
    drawnow;
    pause(0.01);
end

[~, frame_row_count] = size(arc_guide_line_out_theta);
for i = frame_row_count : -1 : 1
    move_laser_x = arc_trail_out_x(1,i);
    set(hlaser, 'xdata', move_laser_x, 'ydata', move_laser_y, 'zdata', move_laser_z);
    drawnow;
    pause(0.01);
end

