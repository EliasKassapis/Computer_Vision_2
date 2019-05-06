close all
clear all
% vl_setup()

% load images
disp("Loading images");
directory = "House";
start_at = 1;
how_many = 49; %49 = all images
imgs = load_data(directory, how_many, start_at);

% for now pic the first two pictures: TODO: something else?
pic1 = imgs(1, :, :);
pic2 = imgs(2, :, :);


% do eight point algorithm
methods = ["standard", "normalized", "ransac"];
result = eight_point(pic1, pic2, methods(3));

% CHAINING
%set sift threshold and matching threshold
s_threshold = 5;
m_threshold = 5;

%get point view matrix
PV = get_point_view_matrix(imgs, s_threshold, m_threshold);
visualize_PV(PV)

%import given PV (its as dense as possible..)
M=dlmread('PointViewMatrix.txt');
visualize_PV(M)