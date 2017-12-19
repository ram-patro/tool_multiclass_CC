function [total_data,total_data_n,total_class,features]=load_data_libras()
load movementlibras_class
load movementlibras_data
total_data=movementlibras_data;
total_class=movementlibras_class;
total_data_n=normalize_data(total_data);
features=size(total_data,2);