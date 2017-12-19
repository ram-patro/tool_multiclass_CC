function [total_data,total_data_n,total_class,features]=load_data_steel_plate_fault()
load faults_class
load faults_data
total_data=faults_data;
total_class=faults_class;
total_data_n=normalize_data(total_data);
features=size(total_data,2);