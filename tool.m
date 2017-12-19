function varargout = tool(varargin)
% TOOL MATLAB code for tool.fig
%      TOOL, by itself, creates a new TOOL or raises the existing
%      singleton*.
%
%      H = TOOL returns the handle to a new TOOL or the handle to
%      the existing singleton*.
%
%      TOOL('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in TOOL.M with the given input arguments.
%
%      TOOL('Property','Value',...) creates a new TOOL or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before tool_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to tool_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help tool

% Last Modified by GUIDE v2.5 02-Nov-2017 08:39:56

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @tool_OpeningFcn, ...
                   'gui_OutputFcn',  @tool_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT


% --- Executes just before tool is made visible.
function tool_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to tool (see VARARGIN)

% Choose default command line output for tool
handles.output = hObject;

% Update handles structure
handles.st=0;
handles.clf=0;
guidata(hObject, handles);

% UIWAIT makes tool wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = tool_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on slider movement.
function slider1_Callback(hObject, eventdata, handles)
% hObject    handle to slider1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
handles.fr_no=ceil(get(hObject,'Value')*handles.features);
set(handles.text10, 'String',num2str(handles.fr_no));
guidata(hObject,handles);

% --- Executes during object creation, after setting all properties.
function slider1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end
guidata(hObject,handles);

% --- Executes on selection change in popupmenu1.
function popupmenu1_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu1 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu1
contents = cellstr(get(hObject,'String'));
handles.data=contents{get(hObject,'Value')};
if(strcmp(handles.data,'breast_tissue'))
    [handles.total_data,handles.total_data__,handles.total_class,handles.features]=load_data_breast_tissue();
elseif(strcmp(handles.data,'CTG'))
    [handles.total_data,handles.total_data__,handles.total_class,handles.features]=load_data_CTG();
elseif(strcmp(handles.data,'fisheriris'))
    [handles.total_data,handles.total_data__,handles.total_class,handles.features]=load_data_fisheriris();
elseif(strcmp(handles.data,'image_segmentation'))
    [handles.total_data,handles.total_data__,handles.total_class,handles.features]=load_data_image_segmentation();
elseif(strcmp(handles.data,'letter_recognition'))
    [handles.total_data,handles.total_data__,handles.total_class,handles.features]=load_data_letter_recognition();
elseif(strcmp(handles.data,'data_libras'))
    [handles.total_data,handles.total_data__,handles.total_class,handles.features]=load_data_libras();
elseif(strcmp(handles.data,'lung_cancer'))
    [handles.total_data,handles.total_data__,handles.total_class,handles.features]=load_data_lung_cancer();
elseif(strcmp(handles.data,'data_mfeat'))
    [handles.total_data,handles.total_data__,handles.total_class,handles.features]=load_data_mfeat();
elseif(strcmp(handles.data,'opt_digits'))
    [handles.total_data,handles.total_data__,handles.total_class,handles.features]=load_data_opt_digits();
elseif(strcmp(handles.data,'page_blocks'))
    [handles.total_data,handles.total_data__,handles.total_class,handles.features]=load_data_page_blocks();
elseif(strcmp(handles.data,'pen_digits'))
    [handles.total_data,handles.total_data__,handles.total_class,handles.features]=load_data_pen_digits();
elseif(strcmp(handles.data,'data_sat'))
    [handles.total_data,handles.total_data__,handles.total_class,handles.features]=load_data_sat();
elseif(strcmp(handles.data,'segment'))
    [handles.total_data,handles.total_data__,handles.total_class,handles.features]=load_data_segment();
elseif(strcmp(handles.data,'shuttle'))
    [handles.total_data,handles.total_data__,handles.total_class,handles.features]=load_data_shuttle();
elseif(strcmp(handles.data,'steel_plate_fault'))
    [handles.total_data,handles.total_data__,handles.total_class,handles.features]=load_data_steel_plate_fault();
elseif(strcmp(handles.data,'synthetic_control'))
    [handles.total_data,handles.total_data__,handles.total_class,handles.features]=load_data_synthetic_control();
elseif(strcmp(handles.data,'vehicle'))
    [handles.total_data,handles.total_data__,handles.total_class,handles.features]=load_data_vehicle();
elseif(strcmp(handles.data,'vowel_context'))
    [handles.total_data,handles.total_data__,handles.total_class,handles.features]=load_data_vowel_context();
elseif(strcmp(handles.data,'waveform'))
    [handles.total_data,handles.total_data__,handles.total_class,handles.features]=load_data_waveform();
elseif(strcmp(handles.data,'wine'))
    [handles.total_data,handles.total_data__,handles.total_class,handles.features]=load_data_wine();
elseif(strcmp(handles.data,'yeast'))
    [handles.total_data,handles.total_data__,handles.total_class,handles.features]=load_data_yeast();
end
set(handles.text27, 'String',num2str(handles.features));
handles.uq_class=unique(handles.total_class);
rownames{1}='Total';
rownames{2}='Train';
rownames{3}='Test';
rownames{4}='Acc';
handles.matrix_data=zeros(4,numel(handles.uq_class)+3);
for i=1:numel(handles.uq_class)
    colnames{i}=strcat('class-',num2str(i));
    handles.matrix_data(1,i)=numel(find(handles.total_class==i));
end
colnames{i+1}='OA';colnames{i+2}='AA';colnames{i+3}='Kappa';
set(handles.uitable1,'ColumnName',colnames);
set(handles.uitable1,'RowName',rownames);
set(handles.uitable1,'Data',handles.matrix_data);
guidata(hObject,handles);

% --- Executes during object creation, after setting all properties.
function popupmenu1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
guidata(hObject,handles);


% --- Executes on selection change in popupmenu2.
function popupmenu2_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu2 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu2
contents = cellstr(get(hObject,'String'));
handles.per=str2double(contents{get(hObject,'Value')});
[handles.train_data,handles.train_data_n,handles.train_class,handles.test_data,handles.test_data_n,handles.test_class,dim]=divide_data(handles.total_data_,handles.total_data_n,handles.total_class,handles.per);
handles.matrix_data(2:end-1,1:end-3)=dim';
set(handles.uitable1,'Data',handles.matrix_data);
guidata(hObject,handles);

% --- Executes during object creation, after setting all properties.
function popupmenu2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
guidata(hObject,handles);

% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
figure,plotconfusion(convert_labels_binary_vec(handles.test_class,numel(unique(handles.total_class))),convert_labels_binary_vec(handles.predict_class,numel(unique(handles.total_class))));
guidata(hObject,handles);

% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
figure,plotroc(convert_labels_binary_vec(handles.test_class,numel(unique(handles.total_class))),convert_labels_binary_vec(handles.predict_class,numel(unique(handles.total_class))));
guidata(hObject,handles);

% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
if(strcmp(handles.classifier,'CC'))
    image_feature_disp(handles.Mdl);
else
    disp('This can be viewed only for FUZZY Classifier');
end
guidata(hObject,handles);


% --- Executes on selection change in popupmenu3.
function popupmenu3_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu3 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu3
contents = cellstr(get(hObject,'String'));
handles.classifier=contents{get(hObject,'Value')};
set(handles.text40, 'String','--');
guidata(hObject,handles);

% --- Executes during object creation, after setting all properties.
function popupmenu3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
guidata(hObject,handles);

% --- Executes on selection change in popupmenu4.
function popupmenu4_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu4 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu4
contents = cellstr(get(hObject,'String'));
handles.fr_name=contents{get(hObject,'Value')};
guidata(hObject,handles);

% --- Executes during object creation, after setting all properties.
function popupmenu4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
guidata(hObject,handles);

% --- Executes on button press in checkbox1.
function checkbox1_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox1
handles.st=get(hObject,'Value');
guidata(hObject,handles);


% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end
guidata(hObject,handles);

% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[handles.filename,pathname] = uigetfile({'*.eps';'*.pdf'},'File Selector');
eps2pdf(strcat(pathname, handles.filename),'C:\Program Files (x86)\gs\gs9.18\bin\gswin32c.exe',0);
guidata(hObject,handles);

% --- Executes during object creation, after setting all properties.
function checkbox1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to checkbox1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
guidata(hObject,handles);

% --- Executes on button press in pushbutton5.
function pushbutton5_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
if(handles.st==1)
    disp('reduction start');
    [handles.total_data_,~]=compute_mapping(handles.total_data,handles.fr_name,handles.fr_no);
    [handles.total_data_n,~]=compute_mapping(handles.total_data__,handles.fr_name,handles.fr_no);
    handles.total_data_n=normalize_data(handles.total_data_n);
    disp('reduction complete');
    set(handles.text38, 'String',num2str(size(handles.total_data_,2)));
else
    disp('no reduction');
    handles.total_data_=handles.total_data;
    handles.total_data_n=handles.total_data__;
    set(handles.text38, 'String','no');
end
guidata(hObject,handles);

% --- Executes during object creation, after setting all properties.
function pushbutton5_CreateFcn(hObject, eventdata, handles)
% hObject    handle to pushbutton5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
guidata(hObject,handles);


% --- Executes on button press in pushbutton6.
function pushbutton6_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
disp('training starts...');
tr_data=[];
for i=1:numel(handles.train_data)
    tr_data=[tr_data;handles.train_data(i).mat];
end
if(strcmp(handles.classifier,'KNN'))%no normalization
    handles.Mdl=fitcknn(tr_data,handles.train_class,'NumNeighbors',5);
elseif(strcmp(handles.classifier,'NN'))
    handles.Mdl=train(patternnet(10),tr_data',convert_labels_binary_vec(handles.train_class',numel(unique(handles.train_class'))));
elseif(strcmp(handles.classifier,'SVM-linear'))%no normalization
    handles.Mdl=fitcecoc(tr_data,handles.train_class);
elseif(strcmp(handles.classifier,'SVM-rbf'))%no normalization
    t = templateSVM('Standardize',1,'KernelFunction','gaussian');
    handles.Mdl=fitcecoc(tr_data,handles.train_class,'Learners',t);
elseif(strcmp(handles.classifier,'DTree'))%no normalization
    handles.Mdl=fitctree(tr_data,handles.train_class);
elseif(strcmp(handles.classifier,'RForest'))%no normalization
    opts= struct;
    opts.depth= 9;
    opts.numTrees= 100;
    opts.numSplits= 5;
    opts.verbose= true;
    opts.classifierID= 2; % weak learners to use. Can be an array for mix of weak learners too
    handles.Mdl=forestTrain(tr_data,handles.train_class,opts);
elseif(strcmp(handles.classifier,'CC'))%normalization
    [~,handles.Mdl]=binary_cond(handles.train_data_n);   
end
disp('training ends...');
guidata(hObject,handles);

% --- Executes on button press in pushbutton7.
function pushbutton7_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
disp('testing starts...');
if(strcmp(handles.classifier,'KNN'))
    [handles.predict_class,~]=predict(handles.Mdl,handles.test_data);
elseif(strcmp(handles.classifier,'NN'))
    bin=double(handles.Mdl(handles.test_data')==max(handles.Mdl(handles.test_data')));
    handles.predict_class=convert_binary_id(bin);
    handles.predict_class=handles.predict_class';
elseif(strcmp(handles.classifier,'SVM-linear'))
    [handles.predict_class,~]=predict(handles.Mdl,handles.test_data);
elseif(strcmp(handles.classifier,'SVM-rbf'))
    [handles.predict_class,~]=predict(handles.Mdl,handles.test_data);
elseif(strcmp(handles.classifier,'Naivebayes'))
    [handles.predict_class,~]=predict(handles.Mdl,handles.test_data);
elseif(strcmp(handles.classifier,'DTree'))
    [handles.predict_class,~]=predict(handles.Mdl,handles.test_data);
elseif(strcmp(handles.classifier,'LogReg'))
    pihat = mnrval(handles.Mdl,handles.test_data);
    [~,handles.predict_class]=max(pihat,[],2);
elseif(strcmp(handles.classifier,'RForest'))
    [handles.predict_class]=forestTest(handles.Mdl,handles.test_data);handles.predict_class=handles.predict_class';
elseif(strcmp(handles.classifier,'CC'))
    [rank_dev,rank_modp,rank_mod]=prepare_matrix_classification(handles.Mdl,handles.test_data_n);
    [handles.predict_class,cnt]=update_fuzzy_output(rank_dev,rank_modp,rank_mod,handles.Mdl);
    set(handles.text40, 'String',num2str(cnt));
end
[oa, aa, K, ua]=confusionn(handles.test_class,handles.predict_class);
handles.matrix_data(end,1:end-3)=ua';
handles.matrix_data(end,end-2)=oa;
handles.matrix_data(end,end-1)=aa;
handles.matrix_data(end,end)=K;
set(handles.uitable1,'Data',handles.matrix_data);
disp('testing ends...');
guidata(hObject,handles);


% --- Executes during object creation, after setting all properties.
function pushbutton6_CreateFcn(hObject, eventdata, handles)
% hObject    handle to pushbutton6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
guidata(hObject,handles);


% --- Executes during object creation, after setting all properties.
function text26_CreateFcn(hObject, eventdata, handles)
% hObject    handle to text37 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
guidata(hObject,handles);
% --- Executes during object creation, after setting all properties.
function text37_CreateFcn(hObject, eventdata, handles)
% hObject    handle to text37 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
guidata(hObject,handles);

% --- Executes on slider movement.
function slider4_Callback(hObject, eventdata, handles)
% hObject    handle to slider4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider

handles.ft1=floor(get(hObject,'Value')*size(handles.total_data_n,2))+1;
set(handles.text41, 'String',num2str(handles.ft1));
guidata(hObject,handles);


% --- Executes during object creation, after setting all properties.
function slider4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end
guidata(hObject,handles);


% --- Executes on slider movement.
function slider5_Callback(hObject, eventdata, handles)
% hObject    handle to slider5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
handles.ft2=floor(get(hObject,'Value')*size(handles.total_data_n,2))+1;
set(handles.text42, 'String',num2str(handles.ft2));
guidata(hObject,handles);


% --- Executes during object creation, after setting all properties.
function slider5_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
guidata(hObject,handles);

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end
guidata(hObject,handles);

% --- Executes on button press in pushbutton9.
function pushbutton9_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

guidata(hObject,handles);


% --- Executes on button press in pushbutton10.
function pushbutton10_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton10 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
figure,
if(strcmp(handles.classifier,'CC')) 
    subplot(1,2,1);hist(handles.total_data_n(:,handles.ft1));
    xlim([min(handles.total_data_n(:,handles.ft1)) max(handles.total_data_n(:,handles.ft1))]);
    title(strcat('Normalised feature :: ',num2str(handles.ft1)));
    subplot(1,2,2);hist(handles.total_data_n(:,handles.ft2));
    xlim([min(handles.total_data_n(:,handles.ft2)) max(handles.total_data_n(:,handles.ft2))]);
    title(strcat('Normalised feature :: ',num2str(handles.ft2)));
else
    subplot(1,2,1);hist(handles.total_data(:,handles.ft1));
    xlim([min(handles.total_data(:,handles.ft1)) max(handles.total_data(:,handles.ft1))]);
    title(strcat('Original feature :: ',num2str(handles.ft1)));
    subplot(1,2,2);hist(handles.total_data(:,handles.ft2));
    xlim([min(handles.total_data(:,handles.ft2)) max(handles.total_data(:,handles.ft2))]);
    title(strcat('Original feature :: ',num2str(handles.ft2)));
end
guidata(hObject,handles);


% --- Executes on button press in checkbox2.
function checkbox2_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox2
handles.clf=get(hObject,'Value');
guidata(hObject,handles);


% --- Executes on slider movement.
function slider8_Callback(hObject, eventdata, handles)
% hObject    handle to slider8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
%handles.ft1=floor(get(hObject,'Value')*size(handles.total_data_n,2))+1;
%set(handles.text45, 'String',num2str(handles.ft1));
guidata(hObject,handles);


% --- Executes during object creation, after setting all properties.
function slider8_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end
guidata(hObject,handles);

% --- Executes on slider movement.
function slider9_Callback(hObject, eventdata, handles)
% hObject    handle to slider9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
%handles.ft2=floor(get(hObject,'Value')*size(handles.total_data_n,2))+1;
%set(handles.text46, 'String',num2str(handles.ft2));
guidata(hObject,handles);


% --- Executes during object creation, after setting all properties.
function slider9_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end
guidata(hObject,handles);

% --- Executes on button press in pushbutton13.
function pushbutton13_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton13 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
figure,
hold on

for i=1:numel(unique(handles.train_class))
    locs{i}=find(handles.train_class==i);
end
if(strcmp(handles.classifier,'CC'))
    handles.tr_data_n=[];
    for i=1:numel(handles.train_data_n)
        handles.tr_data_n=[handles.tr_data_n;handles.train_data_n(i).mat];
    end
    for i=1:numel(unique(handles.train_class))
        color(i,:)=rand(1,3);
        plot(handles.tr_data_n(locs{i},handles.ft1),handles.tr_data_n(locs{i},handles.ft2),'o','Color',color(i,:),'Marker','o','MarkerFaceColor',color(i,:),'MarkerSize',8);
    end
else
    handles.tr_data=[];
    for i=1:numel(handles.train_data)
        handles.tr_data=[handles.tr_data;handles.train_data(i).mat];
    end
    for i=1:numel(unique(handles.train_class))
        color(i,:)=rand(1,3);
        plot(handles.tr_data(locs{i},handles.ft1),handles.tr_data(locs{i},handles.ft2),'o','Color',color(i,:),'Marker','o','MarkerFaceColor',color(i,:),'MarkerSize',8);
    end
end
for i=1:numel(unique(handles.test_class))
    locs{i}=find(handles.test_class==i);
end
if(strcmp(handles.classifier,'CC'))
    for i=1:numel(unique(handles.test_class))
        plot(handles.test_data_n(locs{i},handles.ft1),handles.test_data_n(locs{i},handles.ft2),'o','Color',color(i,:),'Marker','o','MarkerFaceColor',color(i,:),'MarkerSize',8,'MarkerEdgeColor','k','LineWidth',1.5);
    end
    if(handles.clf==1)
        locs=find(handles.predict_class~=handles.test_class);
        plot(handles.test_data_n(locs,handles.ft1),handles.test_data_n(locs,handles.ft2),'xg','Marker','x','MarkerSize',8,'LineWidth',1.5);
    else
        ;;
    end
    xlabel(strcat('Normalised feature :: ',num2str(handles.ft1)));
    ylabel(strcat('Normalised feature :: ',num2str(handles.ft2)));
else
    for i=1:numel(unique(handles.test_class))
        plot(handles.test_data(locs{i},handles.ft1),handles.test_data(locs{i},handles.ft2),'o','Color',color(i,:),'Marker','o','MarkerFaceColor',color(i,:),'MarkerSize',8,'MarkerEdgeColor','k','LineWidth',1.5);
    end
    if(handles.clf==1)
        locs=find(handles.predict_class~=handles.test_class);
        plot(handles.test_data(locs,handles.ft1),handles.test_data(locs,handles.ft2),'xg','Marker','x','MarkerSize',8,'LineWidth',1.5);
    else
        ;;
    end
    xlabel(strcat('Original feature :: ',num2str(handles.ft1)));
    ylabel(strcat('Original feature :: ',num2str(handles.ft2)));
end
if(handles.clf==1)
    cnt=0;
    for i=1:numel(unique(handles.train_class))
        cnt=cnt+1;
        lgd{cnt}=strcat('Train class-',num2str(i));
    end
    for i=1:numel(unique(handles.test_class))
        cnt=cnt+1;
        lgd{cnt}=strcat('Test class-',num2str(i));
    end
    lgd{cnt+1}='Miss classified';
    legend(lgd);
else
    cnt=0;
    for i=1:numel(unique(handles.train_class))
        cnt=cnt+1;
        lgd{cnt}=strcat('Train class-',num2str(i));
    end
    for i=1:numel(unique(handles.test_class))
        cnt=cnt+1;
        lgd{cnt}=strcat('Test class-',num2str(i));
    end
    legend(lgd);
end
guidata(hObject,handles);

% --- Executes on button press in pushbutton14.
function pushbutton14_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton14 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% figure,
% if(strcmp(handles.classifier,'CC')) 
%     subplot(1,2,1);hist(handles.total_data_n(:,handles.ft1));
%     xlim([min(handles.total_data_n(:,handles.ft1)) max(handles.total_data_n(:,handles.ft1))]);
%     title(strcat('Normalised feature :: ',num2str(handles.ft1)));
%     subplot(1,2,2);hist(handles.total_data_n(:,handles.ft2));
%     xlim([min(handles.total_data_n(:,handles.ft2)) max(handles.total_data_n(:,handles.ft2))]);
%     title(strcat('Normalised feature :: ',num2str(handles.ft2)));
% else
%     subplot(1,2,1);hist(handles.total_data(:,handles.ft1));
%     xlim([min(handles.total_data(:,handles.ft1)) max(handles.total_data(:,handles.ft1))]);
%     title(strcat('Original feature :: ',num2str(handles.ft1)));
%     subplot(1,2,2);hist(handles.total_data(:,handles.ft2));
%     xlim([min(handles.total_data(:,handles.ft2)) max(handles.total_data(:,handles.ft2))]);
%     title(strcat('Original feature :: ',num2str(handles.ft2)));
% end
guidata(hObject,handles);

% --- Executes on slider movement.
function slider6_Callback(hObject, eventdata, handles)
% hObject    handle to slider6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
%handles.ft1=floor(get(hObject,'Value')*size(handles.total_data_n,2))+1;
%set(handles.text43, 'String',num2str(handles.ft1));
guidata(hObject,handles);

% --- Executes during object creation, after setting all properties.
function slider6_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end
guidata(hObject,handles);

% --- Executes on slider movement.
function slider7_Callback(hObject, eventdata, handles)
% hObject    handle to slider7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
%handles.ft2=floor(get(hObject,'Value')*size(handles.total_data_n,2))+1;
%set(handles.text44, 'String',num2str(handles.ft2));
guidata(hObject,handles);


% --- Executes during object creation, after setting all properties.
function slider7_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end
guidata(hObject,handles);

% --- Executes on button press in pushbutton11.
function pushbutton11_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton11 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
%figure(1),
%hold on

title(strcat('classifier :: ',handles.classifier));
legend('class 1','class 2','miss classified');
guidata(hObject,handles);

% --- Executes on button press in pushbutton12.
function pushbutton12_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton12 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% figure,
% if(strcmp(handles.classifier,'CC')) 
%     handles.tr_data_n=[handles.train_data_n(1).mat;handles.train_data_n(2).mat];
%     subplot(1,2,1);hist(handles.tr_data_n(:,handles.ft1));
%     xlim([min(handles.tr_data_n(:,handles.ft1)) max(handles.tr_data_n(:,handles.ft1))]);
%     title(strcat('Normalised feature :: ',num2str(handles.ft1)));
%     subplot(1,2,2);hist(handles.tr_data_n(:,handles.ft2));
%     xlim([min(handles.total_data_n(:,handles.ft2)) max(handles.total_data_n(:,handles.ft2))]);
%     title(strcat('Normalised feature :: ',num2str(handles.ft2)));
% else
%     handles.tr_data=[handles.train_data(1).mat;handles.train_data(2).mat];
%     subplot(1,2,1);hist(handles.tr_data(:,handles.ft1));
%     xlim([min(handles.total_data(:,handles.ft1)) max(handles.total_data(:,handles.ft1))]);
%     title(strcat('Original feature :: ',num2str(handles.ft1)));
%     subplot(1,2,2);hist(handles.test_data(:,handles.ft2));
%     xlim([min(handles.total_data(:,handles.ft2)) max(handles.total_data(:,handles.ft2))]);
%     title(strcat('Original feature :: ',num2str(handles.ft2)));
% end
guidata(hObject,handles);

% --- Executes during object creation, after setting all properties.
function pushbutton10_CreateFcn(hObject, eventdata, handles)
% hObject    handle to pushbutton10 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
guidata(hObject,handles);
