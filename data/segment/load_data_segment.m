function [total_data,total_data_n,total_class,features]=load_data_segment()
load segment_class
load segment_data
total_data=segment_data;
total_class=segment_class;
total_data_n=normalize_data(total_data);
features=size(total_data,2);