function varargout = KLdivergence_Compare(varargin)
% KLDIVERGENCE_COMPARE MATLAB code for KLdivergence_Compare.fig
%      KLDIVERGENCE_COMPARE, by itself, creates a new KLDIVERGENCE_COMPARE or raises the existing
%      singleton*.
%
%      H = KLDIVERGENCE_COMPARE returns the handle to a new KLDIVERGENCE_COMPARE or the handle to
%      the existing singleton*.
%
%      KLDIVERGENCE_COMPARE('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in KLDIVERGENCE_COMPARE.M with the given input arguments.
%
%      KLDIVERGENCE_COMPARE('Property','Value',...) creates a new KLDIVERGENCE_COMPARE or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before KLdivergence_Compare_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to KLdivergence_Compare_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help KLdivergence_Compare

% Last Modified by GUIDE v2.5 24-Jan-2022 18:56:51

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @KLdivergence_Compare_OpeningFcn, ...
                   'gui_OutputFcn',  @KLdivergence_Compare_OutputFcn, ...
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


% --- Executes just before KLdivergence_Compare is made visible.
function KLdivergence_Compare_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to KLdivergence_Compare (see VARARGIN)

% Choose default command line output for KLdivergence_Compare
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes KLdivergence_Compare wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = KLdivergence_Compare_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



% --- Executes on button press in mixture.
function mixture_Callback(hObject, eventdata, handles)
% hObject    handle to mixture (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of mixture


% --- Executes when selected object is changed in ButtonGroup.
function ButtonGroup_SelectionChangedFcn(hObject, eventdata, handles)
% hObject    handle to the selected object in ButtonGroup 
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
try
rad_on=get(hObject,'tag');
switch rad_on
    case 'pdp'
        nodisplay = [handles.componentsSampleA,handles.componentSampleB,handles.inputAcomponent,...
            handles.inputBcomponent,handles.bandA,handles.inputBandA,handles.bandB,...
            handles.inputBandB,handles.TitleBICA,handles.TitleBICB,handles.BICA,handles.BICB];
        set(nodisplay,'Visible','off');
        handles.options = 1;
        guidata(hObject, handles);
    case 'kde'
        nodisplay1 = [handles.componentsSampleA,handles.componentSampleB,handles.inputAcomponent,...
            handles.inputBcomponent,handles.TitleBICA,handles.TitleBICB,handles.BICA,handles.BICB];
        Display = [handles.bandA, handles.inputBandA,handles.bandB,handles.inputBandB];
        set(nodisplay1,'Visible','off');
        set(Display,'Visible','on');
        handles.options = 2;
        guidata(hObject, handles);
    case 'mixture'
        Display2 = [handles.componentsSampleA,handles.componentSampleB,handles.inputAcomponent,...
            handles.inputBcomponent,handles.bandA, handles.inputBandA,handles.bandB,...
            handles.inputBandB,handles.TitleBICA,handles.TitleBICB,handles.BICA,handles.BICB];
        set(Display2,'Visible','on');
        handles.options = 3;
        guidata(hObject, handles);
end
end


% --- Executes on button press in runButton.
function runButton_Callback(hObject, eventdata, handles)
% hObject    handle to runButton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
try
    data1 = handles.agedata1;
    data2 = handles.agedata2;
    BandwidthA = handles.BandwidthA;
    BandwidthB = handles.BandwidthB;
    componentA = handles.componentA;
    componentB = handles.componentB;
end
try
    if handles.options == 1
        if exist('data1','var') == 0
            msgbox('     Please input data!!! ','Warnning');
        else
            [~,PDPresult1] = AgeDistribution(data1(:,1),data1(:,2),30);
            [~,PDPresult2] = AgeDistribution(data2(:,1),data2(:,2),30);
            PDP_KL = Cal_KLDIVERGENCE(PDPresult1,PDPresult2);
            PDP_KL = round(PDP_KL,2);
            figure('Name','PDP','NumberTitle','off');
            age = 1:4000;
            plot(age,PDPresult1,age,PDPresult2,'--');box off;
            xlabel('Age (Ma)');ylabel('Density');
            str = ['KL divergence based on PDP', ' = ', num2str(PDP_KL)];
            text(0.3,0.95,str,'Units','normalized','FontSize',10);
            le = legend('Sample A','Sample B');p = get(le,'Position');
            set(le,'Position',[p(1),p(2)-0.1,p(3),p(4)]);
        end
    elseif handles.options == 2
        if exist('data1','var') == 0
            msgbox('     Please input data!!! ','Warnning');
        elseif exist('BandwidthA','var') == 0
            msgbox('   Please input bandwidth of sample A','Warnning');
        elseif exist('BandwidthB','var') == 0
            msgbox('   Please input bandwidth of sample B','Warnning');
        else
            [KDEresult1,~] = AgeDistribution(data1(:,1),data1(:,2),BandwidthA);
            [KDEresult2,~] = AgeDistribution(data2(:,1),data2(:,2),BandwidthB);
            KDE_KL = Cal_KLDIVERGENCE(KDEresult1,KDEresult2);
            KDE_KL = round(KDE_KL,2);
            figure('Name','KDE','NumberTitle','off');
            age = 1:4000;
            plot(age,KDEresult1,age,KDEresult2,'--');box off;
            xlabel('Age (Ma)');ylabel('Density');
            str = ['KL divergence based on KDE', ' = ', num2str(KDE_KL)];
            text(0.3,0.95,str,'Units','normalized','FontSize',10);
            le = legend('Sample A','Sample B');p = get(le,'Position');
            set(le,'Position',[p(1),p(2)-0.1,p(3),p(4)]);
        end
    elseif handles.options == 3
        if exist('data1','var') == 0
            msgbox('     Please input data!!! ','Warnning');
        elseif exist('BandwidthA','var') == 0
            msgbox('   Please input bandwidth of sample A','Warnning');
        elseif exist('BandwidthB','var') == 0
            msgbox('   Please input bandwidth of sample B','Warnning');
        elseif exist('componentA','var') == 0
            msgbox('Please input expected component number of sample A','Warnning');
        elseif exist('componentB','var') == 0
            msgbox('Please input expected component number of sample B','Warnning');
        else
            [EMage1,EMsigma1,EMweight1,EMBIC1] = runEMalgorithm(data1,componentA,BandwidthA);
            [EMage2,EMsigma2,EMweight2,EMBIC2] = runEMalgorithm(data2,componentB,BandwidthB);
            
            if isempty(EMage1) == 1
                msgbox('Please reduce components number or bandwidth of Sample A!!! ','Warnning');
            elseif isempty(EMage2) == 1
                msgbox('Please reduce components number or bandwidth of Sample B!!! ','Warnning');
            else
                if sum(EMage1) == 0
                    msgbox('    Have canceled running of Sample A !!! ','Message');
                elseif sum(EMage2) == 0
                    msgbox('    Have canceled running of Sample B !!! ','Message');
                else
                    [EMresult1,y1label,str1] = EMMIXTURE(EMage1,EMweight1,EMsigma1);
                    [EMresult2,y2label,str2] = EMMIXTURE(EMage2,EMweight2,EMsigma2);
                    EM_KL = Cal_KLDIVERGENCE(EMresult1,EMresult2);
                    EM_KL = round(EM_KL,2);
                    bica = num2str(round(EMBIC1,2),'%.2f');
                    bicb = num2str(round(EMBIC2,2),'%.2f');
                    set(handles.BICA,'String',bica);
                    set(handles.BICB,'String',bicb);
                    figure('Name','Normal Mixture Model','NumberTitle','off');
                    age = 1:4000;
                    hold on
                    plot(age,EMresult1,'r');box off;
                    x1label = EMage1';
                    text(x1label,y1label,str1,'Color','red','FontSize',8);
                    plot(age,EMresult2,'b--');box off;
                    x2label = EMage2';
                    text(x2label,y2label,str2,'Color','blue','FontSize',8);
                    hold off
                    xlabel('Age (Ma)');ylabel('Density');
                    str = ['KL divergence based on NMM', ' = ', num2str(EM_KL)];
                    text(0.3,0.95,str,'Units','normalized','FontSize',10);
                    le = legend('Sample A','Sample B');p = get(le,'Position');
                    set(le,'Position',[p(1),p(2)-0.1,p(3),p(4)]);
                end
            end
        end       
    end
end

        

% --- Executes on button press in inputData.
function inputData_Callback(hObject, eventdata, handles)
% hObject    handle to inputData (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
try
[a,b,c] = uigetfile('.xlsx');
if c == 1
    data = xlsread(fullfile(b,a));
    handles.kldata = data;
    guidata(hObject, handles);
    msgbox('            Operation Completed !!! ','Message');
end
data1 = handles.kldata(:,1:2); aaa = ~isnan(data1(:,1)); data1 = data1(aaa,:);
data2 = handles.kldata(:,3:4); bbb = ~isnan(data2(:,1)); data2 = data2(bbb,:);
handles.agedata1 = data1;
guidata(hObject, handles);
handles.agedata2 = data2;
guidata(hObject, handles);
end


function inputBandA_Callback(hObject, eventdata, handles)
% hObject    handle to inputBandA (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of inputBandA as text
%        str2double(get(hObject,'String')) returns contents of inputBandA as a double
BandwidthA = str2double(get(hObject,'String'));
handles.BandwidthA = BandwidthA;
guidata(hObject, handles);


% --- Executes during object creation, after setting all properties.
function inputBandA_CreateFcn(hObject, eventdata, handles)
% hObject    handle to inputBandA (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function inputBandB_Callback(hObject, eventdata, handles)
% hObject    handle to inputBandB (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of inputBandB as text
%        str2double(get(hObject,'String')) returns contents of inputBandB as a double
BandwidthB = str2double(get(hObject,'String'));
handles.BandwidthB = BandwidthB;
guidata(hObject, handles);

% --- Executes during object creation, after setting all properties.
function inputBandB_CreateFcn(hObject, eventdata, handles)
% hObject    handle to inputBandB (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function inputAcomponent_Callback(hObject, eventdata, handles)
% hObject    handle to inputAcomponent (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of inputAcomponent as text
%        str2double(get(hObject,'String')) returns contents of inputAcomponent as a double
componentA = str2double(get(hObject,'String'));
handles.componentA = componentA;
guidata(hObject, handles);

% --- Executes during object creation, after setting all properties.
function inputAcomponent_CreateFcn(hObject, eventdata, handles)
% hObject    handle to inputAcomponent (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function inputBcomponent_Callback(hObject, eventdata, handles)
% hObject    handle to inputBcomponent (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of inputBcomponent as text
%        str2double(get(hObject,'String')) returns contents of inputBcomponent as a double
componentB = str2double(get(hObject,'String'));
handles.componentB = componentB;
guidata(hObject, handles);

% --- Executes during object creation, after setting all properties.
function inputBcomponent_CreateFcn(hObject, eventdata, handles)
% hObject    handle to inputBcomponent (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes during object creation, after setting all properties.
function runButton_CreateFcn(hObject, eventdata, handles)
% hObject    handle to runButton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
