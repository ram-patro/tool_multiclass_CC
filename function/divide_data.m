function [train_data,train_data_n,train_class,test_data,test_data_n,test_class,dim]=divide_data(total_data,total_data_n,total_class,per)
if(per~=100)
    for i=1:numel(unique(total_class))
        total(i).mat=[];
    end
    for i=1:size(total_data,1)
        total(total_class(i)).mat=[total(total_class(i)).mat;total_data(i,:)];
        h=waitbar(i/size(total_data,1));
    end
    close(h);
    train_class=[];
    test_data=[];
    test_class=[];
    for i=1:numel(total)
        sz=size(total(i).mat,1);
        locs=randperm(sz,sz);
        locs_tr{i}=locs(1:floor((sz/100)*per));
        locs_tst{i}=locs(floor((sz/100)*per)+1:end);
        train_data(i).mat=total(i).mat(locs_tr{i},:);
        train_class=[train_class ones(1,size(train_data(i).mat,1))*i];
        test_data=[test_data;total(i).mat(locs_tst{i},:)];
        test_class=[test_class ones(1,numel(locs_tst{i}))*i];
        dim(i,1)=numel(locs_tr{i});
        dim(i,2)=numel(locs_tst{i});
        h=waitbar(i/numel(total));
    end
    close(h);
    for i=1:numel(unique(total_class))
        totaln(i).mat=[];
    end
    for i=1:size(total_data,1)
        totaln(total_class(i)).mat=[totaln(total_class(i)).mat;total_data_n(i,:)];
        h=waitbar(i/size(total_data,1));
    end
    close(h);
    test_data_n=[];
    for i=1:numel(total)
        train_data_n(i).mat=totaln(i).mat(locs_tr{i},:);
        test_data_n=[test_data_n;totaln(i).mat(locs_tst{i},:)];
        h=waitbar(i/numel(total));
    end
    close(h);
    test_class=test_class';
else
    train_class=[];
    for i=1:numel(unique(total_class))
        train_data(i).mat=total_data(total_class==i,:);
        train_data_n(i).mat=total_data_n(total_class==i,:);
        train_class=[train_class ones(1,size(train_data(i).mat,1))*i];
        dim(i,1)=numel(find(train_class==i));
        dim(i,2)=dim(i,1);
    end
test_data=total_data;
test_data_n=total_data_n;
test_class=total_class;
end
