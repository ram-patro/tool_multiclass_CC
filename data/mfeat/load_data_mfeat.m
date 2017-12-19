function [total_data,total_data_n,total_class,features]=load_data_mfeat()
load mfeat_class
load mfeat_data
total_data=mfeat_data;
total_class=mfeat_class;
total_data_n=normalize_data(total_data);
features=size(total_data,2);