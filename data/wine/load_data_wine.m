function [total_data,total_data_n,total_class,features]=load_data_wine()
load wine_class
load wine_data
total_data=wine_data;
total_class=wine_class;
total_data_n=normalize_data(total_data);
features=size(total_data,2);