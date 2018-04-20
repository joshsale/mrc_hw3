bag = rosbag('catkin_ws/src/mrc_hw3/data/myturtle.bag')
msg_pose=rosmessage('turtlesim/Pose');
showdetails(msg_pose)
bagselect = select(bag,'Topic','turtle1/pose')
ts=timeseries(bagselect,'X','Y','Theta', 'LinearVelocity', 'AngularVelocity');

%Plot (X,Y) position of turtle 
X=ts.data(:,1)
Y=ts.data(:,2)
figure
plot(X,Y)
xlabel('X')
ylabel('Y')
saveas(gcf,'pose_xy.png')

%Creat plot of theta as a function of time
theta = ts.data(:,3)/(2*pi)
figure
plot(theta)
saveas(gcf,'pose_theta.png')

%Create quiver plot to show location & heading of turtle
vel = ts.data(:,4);
u=vel.*cos(theta);
v=vel.*sin(theta);
ii= 1:10:length(X);
figure
quiver(X(ii),Y(ii),u(ii),v(ii))
saveas(gcf,'pose_quiver.png')