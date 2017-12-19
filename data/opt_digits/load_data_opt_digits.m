function [total_data,total_data_n,total_class,features]=load_data_opt_digits()
load optdigits_class
load optdigits_data
total_data=optdigits_data;
total_class=optdigits_class;
total_data_n=normalize_data(total_data);
features=size(total_data,2);