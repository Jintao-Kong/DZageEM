function varargout = DZageEM(varargin)
% DZAGEEM MATLAB code for DZageEM.fig
%      DZAGEEM, by itself, creates a new DZAGEEM or raises the existing
%      singleton*.
%
%      H = DZAGEEM returns the handle to a new DZAGEEM or the handle to
%      the existing singleton*.
%
%      DZAGEEM('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in DZAGEEM.M with the given input arguments.
%
%      DZAGEEM('Property','Value',...) creates a new DZAGEEM or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before DZageEM_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to DZageEM_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help DZageEM

% Last Modified by GUIDE v2.5 23-Jan-2022 19:55:31

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @DZageEM_OpeningFcn, ...
                   'gui_OutputFcn',  @DZageEM_OutputFcn, ...
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


% --- Executes just before DZageEM is made visible.
function DZageEM_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to DZageEM (see VARARGIN)

% Choose default command line output for DZageEM
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);
set(handles.axes1,'visible','off');
axes(handles.axes1);
image = imread('introduction.jpg');
imshow(image);
% Update handles structure
guidata(hObject, handles);
% UIWAIT makes DZageEM wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = DZageEM_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;

function [kderesult,pdpresult] = calculateage(Agedata,h)
age = 1:4000;
if nargin == 1
    h = 30;
else
    n = length(Agedata);
    data = Agedata(:,1);
    %%KDE
    c_age = zeros(length(age),n);
    for i = 1:length(age)
        for j = 1:n
            c_age(i,j) = age(i) - data(j);
        end
    end 
    c_age1 = (sqrt(2.*pi).*n.*h).^(-1) .* exp(-((c_age).^2)./(2.*h.^2));
    %(a/b)^2 not equal (a^2/b^2)
    kderesult =  sum(c_age1,2);
    %PDP
    P_age = exp(-((c_age).^2)./((2.*Agedata(:,2).^2)'));
    pdpresult1 = (sqrt(2.*pi).*n.*Agedata(:,2)').^(-1).*P_age;
    
    pdpresult = sum(pdpresult1,2);
    pdpresult = pdpresult./sum(pdpresult);   
end

% --- Executes on button press in KDEandPDP_plot.
function KDEandPDP_plot_Callback(hObject, eventdata, handles)
% hObject    handle to KDEandPDP_plot (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
try
    [kderesult,pdpresult] = calculateage(handles.mydata,handles.bandwidth);
    handles.kderesult = kderesult;
    guidata(hObject, handles);
    handles.pdpresult = pdpresult;
    guidata(hObject, handles);
    figure('Name','KDE and PDP','NumberTitle','off');
    
    age = 1:4000;
    hold on
    plot(age,kderesult,'r');
    plot(age,pdpresult,'b--');
    legend('KDE','PDP');
    hold off 
catch
    msgbox(' Please input data or bandwidth!!! ','Warnning');
end


% --- Executes on button press in runEM.
function runEM_Callback(hObject, eventdata, handles)
% hObject    handle to runEM (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
try
    [EMage,EMsigma,EMweight,EMBIC] = runEMalgorithm(handles.mydata,handles.cluster,handles.bandwidth);
    if isempty(EMage) == 1
        msgbox(' Please reduce components number or bandwidth!!! ','Warnning');
    else
        assignin('base','Data',handles.mydata);
        assignin('base','EMage',EMage);
        assignin('base','EMsigma',EMsigma);
        assignin('base','EMweight',EMweight);
        assignin('base','EMBIC',EMBIC);
        if sum(EMage) == 0
            msgbox('               Have canceled !!! ','Message');
        else
        run('EMalgorithm.m');
        end
    end
catch
    msgbox(' Please input data, Bandwidth or expected components!!! ','Warnning');
end


% --- Executes on button press in KLdivergence.
function KLdivergence_Callback(hObject, eventdata, handles)
% hObject    handle to KLdivergence (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
run('KLdivergence_Compare.m');

% --- Executes on button press in inputAgeData.
function inputAgeData_Callback(hObject, eventdata, handles)
% hObject    handle to inputAgeData (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[a,b,c] = uigetfile('.xlsx');
if c == 1
    data = xlsread(fullfile(b,a));
    handles.mydata = data;
    guidata(hObject, handles);
    msgbox('            Operation Completed !!! ','Message');
end


function inputBandwidth_Callback(hObject, eventdata, handles)
% hObject    handle to inputBandwidth (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of inputBandwidth as text
%        str2double(get(hObject,'String')) returns contents of inputBandwidth as a double
h = str2double(get(hObject,'String'));
handles.bandwidth = h;
guidata(hObject, handles);


% --- Executes during object creation, after setting all properties.
function inputBandwidth_CreateFcn(hObject, eventdata, handles)
% hObject    handle to inputBandwidth (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



% --- Executes on button press in inputKLdata.
function inputKLdata_Callback(hObject, eventdata, handles)
% hObject    handle to inputKLdata (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)




function expectedComponents_Callback(hObject, eventdata, handles)
% hObject    handle to expectedComponents (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of expectedComponents as text
%        str2double(get(hObject,'String')) returns contents of expectedComponents as a double
cluster = str2double(get(hObject,'String'));
handles.cluster = cluster;
guidata(hObject, handles);


% --- Executes during object creation, after setting all properties.
function expectedComponents_CreateFcn(hObject, eventdata, handles)
% hObject    handle to expectedComponents (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
