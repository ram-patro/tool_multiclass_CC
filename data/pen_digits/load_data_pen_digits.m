function [total_data,total_data_n,total_class,features]=load_data_pen_digits()
load pendigits_class
load pendigits_data
total_data=pendigits_data;
total_class=pendigits_class;
total_data_n=normalize_data(total_data);
features=size(total_data,2);