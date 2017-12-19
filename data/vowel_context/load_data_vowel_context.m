function [total_data,total_data_n,total_class,features]=load_data_vowel_context()
load vowelcontext_class
load vowelcontext_data
total_data=vowelcontext_data;
total_class=vowelcontext_class;
total_data_n=normalize_data(total_data);
features=size(total_data,2);