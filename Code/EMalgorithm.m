function varargout = EMalgorithm(varargin)
% EMALGORITHM MATLAB code for EMalgorithm.fig
%      EMALGORITHM, by itself, creates a new EMALGORITHM or raises the existing
%      singleton*.
%
%      H = EMALGORITHM returns the handle to a new EMALGORITHM or the handle to
%      the existing singleton*.
%
%      EMALGORITHM('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in EMALGORITHM.M with the given input arguments.
%
%      EMALGORITHM('Property','Value',...) creates a new EMALGORITHM or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before EMalgorithm_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to EMalgorithm_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help EMalgorithm

% Last Modified by GUIDE v2.5 24-Jan-2022 15:30:06

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
    'gui_Singleton',  gui_Singleton, ...
    'gui_OpeningFcn', @EMalgorithm_OpeningFcn, ...
    'gui_OutputFcn',  @EMalgorithm_OutputFcn, ...
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


% --- Executes just before EMalgorithm is made visible.
function EMalgorithm_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to EMalgorithm (see VARARGIN)

% Choose default command line output for EMalgorithm
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);



% UIWAIT makes EMalgorithm wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = EMalgorithm_OutputFcn(hObject, eventdata, handles)
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;
try
    group = evalin('base','EMage');
    weight= evalin('base','EMweight');
    sigma = evalin('base','EMsigma');
    BIC = evalin('base','EMBIC');
    display20 = [handles.age1,handles.age2,handles.age3,handles.age4,handles.age5,...
        handles.age6,handles.age7,handles.age8,handles.age9,handles.age10,...
        handles.age11,handles.age12,handles.age13,handles.age14, handles.age15,...
        handles.age16,handles.age17,handles.age18,handles.age19,handles.age20...
        handles.sigma1,handles.sigma2,handles.sigma3,handles.sigma4,handles.sigma5,...
        handles.sigma6,handles.sigma7,handles.sigma8,handles.sigma9,handles.sigma10,...
        handles.sigma11,handles.sigma12,handles.sigma13,handles.sigma14,handles.sigma15,...
        handles.sigma16,handles.sigma17,handles.sigma18,handles.sigma19,handles.sigma20,...
        handles.weight1,handles.weight2,handles.weight3,handles.weight4,handles.weight5,...
        handles.weight6,handles.weight7,handles.weight8,handles.weight9,handles.weight10,...
        handles.weight11,handles.weight12,handles.weight13,handles.weight14,handles.weight15,...
        handles.weight16,handles.weight17,handles.weight18,handles.weight19,handles.weight20];
    set(display20,'Visible','off');
    TempAge = length(group);
    if TempAge == 2
        display2 = [handles.age1,handles.age2,handles.sigma1,...
            handles.sigma2,handles.weight1,handles.weight2];
        
        set(display2,'Visible','on');
        
        age1 = num2str(round(group(1)));age2 = num2str(round(group(2)));
        set(handles.age1,'String',age1);set(handles.age2,'String',age2);
        w1 = num2str(round(weight(1),2),'%.2f');w2 = num2str(round(weight(2),2),'%.2f');
        set(handles.weight1,'String',w1);set(handles.weight2,'String',w2);
        s1 = num2str(round(sigma(1),2),'%.2f');s2 = num2str(round(sigma(2),2),'%.2f');
        set(handles.sigma1,'String',s1);set(handles.sigma2,'String',s2);
        bic = num2str(round(BIC,2),'%.2f');
        set(handles.BICtext,'String',bic);
    elseif TempAge == 3
        display3 = [handles.age1,handles.age2,handles.age3,...
            handles.sigma1,handles.sigma2,handles.sigma3,handles.weight1,...
            handles.weight2,handles.weight3];
        set(display3,'Visible','on');
        age1 = num2str(round(group(1)));age2 = num2str(round(group(2)));
        age3 = num2str(round(group(3)));
        set(handles.age1,'String',age1);set(handles.age2,'String',age2);
        set(handles.age3,'String',age3);
        w1 = num2str(round(weight(1),2),'%.2f');w2 = num2str(round(weight(2),2),'%.2f');
        w3 = num2str(round(weight(3),2),'%.2f');
        set(handles.weight1,'String',w1);set(handles.weight2,'String',w2);
        set(handles.weight3,'String',w3);
        s1 = num2str(round(sigma(1),2),'%.2f');s2 = num2str(round(sigma(2),2),'%.2f');
        s3 = num2str(round(sigma(3),2),'%.2f');
        set(handles.sigma1,'String',s1);set(handles.sigma2,'String',s2);
        set(handles.sigma3,'String',s3);
        bic = num2str(round(BIC,2),'%.2f');
        set(handles.BICtext,'String',bic);
    elseif TempAge == 4
        display4 = [handles.age1,handles.age2,handles.age3,...
            handles.age4,handles.sigma1,handles.sigma2,handles.sigma3,handles.sigma4,...
            handles.weight1,handles.weight2,handles.weight3,handles.weight4];
        set(display4,'Visible','on');
        age1 = num2str(round(group(1)));age2 = num2str(round(group(2)));
        age3 = num2str(round(group(3)));age4 = num2str(round(group(4)));
        set(handles.age1,'String',age1);set(handles.age2,'String',age2);
        set(handles.age3,'String',age3);set(handles.age4,'String',age4);
        w1 = num2str(round(weight(1),2),'%.2f');w2 = num2str(round(weight(2),2),'%.2f');
        w3 = num2str(round(weight(3),2),'%.2f');w4 = num2str(round(weight(4),2),'%.2f');
        set(handles.weight1,'String',w1);set(handles.weight2,'String',w2);
        set(handles.weight3,'String',w3);set(handles.weight4,'String',w4);
        s1 = num2str(round(sigma(1),2),'%.2f');s2 = num2str(round(sigma(2),2),'%.2f');
        s3 = num2str(round(sigma(3),2),'%.2f');s4 = num2str(round(sigma(4),2),'%.2f');
        set(handles.sigma1,'String',s1);set(handles.sigma2,'String',s2);
        set(handles.sigma3,'String',s3);set(handles.sigma4,'String',s4);
        bic = num2str(round(BIC,2),'%.2f');
        set(handles.BICtext,'String',bic);
    elseif TempAge == 5
        display5 = [handles.age1,handles.age2,handles.age3,handles.age4,handles.age5,...
            handles.sigma1,handles.sigma2,handles.sigma3,handles.sigma4,handles.sigma5,...
            handles.weight1,handles.weight2,handles.weight3,handles.weight4,...
            handles.weight5];
        
        set(display5,'Visible','on');
        age1 = num2str(round(group(1)));age2 = num2str(round(group(2)));
        age3 = num2str(round(group(3)));age4 = num2str(round(group(4)));
        age5 = num2str(round(group(5)));
        set(handles.age1,'String',age1);set(handles.age2,'String',age2);
        set(handles.age3,'String',age3);set(handles.age4,'String',age4);
        set(handles.age5,'String',age5);
        w1 = num2str(round(weight(1),2),'%.2f');w2 = num2str(round(weight(2),2),'%.2f');
        w3 = num2str(round(weight(3),2),'%.2f');w4 = num2str(round(weight(4),2),'%.2f');
        w5 = num2str(round(weight(5),2),'%.2f');
        set(handles.weight1,'String',w1);set(handles.weight2,'String',w2);
        set(handles.weight3,'String',w3);set(handles.weight4,'String',w4);
        set(handles.weight5,'String',w5);
        s1 = num2str(round(sigma(1),2),'%.2f');s2 = num2str(round(sigma(2),2),'%.2f');
        s3 = num2str(round(sigma(3),2),'%.2f');s4 = num2str(round(sigma(4),2),'%.2f');
        s5 = num2str(round(sigma(5),2),'%.2f');
        set(handles.sigma1,'String',s1);set(handles.sigma2,'String',s2);
        set(handles.sigma3,'String',s3);set(handles.sigma4,'String',s4);
        set(handles.sigma5,'String',s5);
        bic = num2str(round(BIC,2),'%.2f');
        set(handles.BICtext,'String',bic);
    elseif TempAge == 6
        display6 = [handles.age1,handles.age2,handles.age3,...
            handles.age4,handles.age5,handles.age6,handles.sigma1,handles.sigma2,...
            handles.sigma3,handles.sigma4,handles.sigma5,handles.sigma6,handles.weight1,...
            handles.weight2,handles.weight3,handles.weight4,handles.weight5,handles.weight6];
        set(display6,'Visible','on');
        age1 = num2str(round(group(1)));age2 = num2str(round(group(2)));
        age3 = num2str(round(group(3)));age4 = num2str(round(group(4)));
        age5 = num2str(round(group(5)));age6 = num2str(round(group(6)));
        set(handles.age1,'String',age1);set(handles.age2,'String',age2);
        set(handles.age3,'String',age3);set(handles.age4,'String',age4);
        set(handles.age5,'String',age5);set(handles.age6,'String',age6);
        w1 = num2str(round(weight(1),2),'%.2f');w2 = num2str(round(weight(2),2),'%.2f');
        w3 = num2str(round(weight(3),2),'%.2f');w4 = num2str(round(weight(4),2),'%.2f');
        w5 = num2str(round(weight(5),2),'%.2f');w6 = num2str(round(weight(6),2),'%.2f');
        set(handles.weight1,'String',w1);set(handles.weight2,'String',w2);
        set(handles.weight3,'String',w3);set(handles.weight4,'String',w4);
        set(handles.weight5,'String',w5);set(handles.weight6,'String',w6);
        s1 = num2str(round(sigma(1),2),'%.2f');s2 = num2str(round(sigma(2),2),'%.2f');
        s3 = num2str(round(sigma(3),2),'%.2f');s4 = num2str(round(sigma(4),2),'%.2f');
        s5 = num2str(round(sigma(5),2),'%.2f');s6 = num2str(round(sigma(6),2),'%.2f');
        set(handles.sigma1,'String',s1);set(handles.sigma2,'String',s2);
        set(handles.sigma3,'String',s3);set(handles.sigma4,'String',s4);
        set(handles.sigma5,'String',s5);set(handles.sigma6,'String',s6);
        bic = num2str(round(BIC,2),'%.2f');
        set(handles.BICtext,'String',bic);
        
    elseif TempAge == 7
        display7 = [handles.age1,handles.age2,handles.age3,handles.age4,handles.age5,handles.age6,...
            handles.age7,handles.sigma1,handles.sigma2,handles.sigma3,handles.sigma4,...
            handles.sigma5,handles.sigma6,handles.sigma7,handles.weight1,handles.weight2,...
            handles.weight3,handles.weight4,handles.weight5,handles.weight6,handles.weight7];
        
        set(display7,'Visible','on');
        
        age1 = num2str(round(group(1)));age2 = num2str(round(group(2)));
        age3 = num2str(round(group(3)));age4 = num2str(round(group(4)));
        age5 = num2str(round(group(5)));age6 = num2str(round(group(6)));
        age7 = num2str(round(group(7)));
        set(handles.age1,'String',age1);set(handles.age2,'String',age2);
        set(handles.age3,'String',age3);set(handles.age4,'String',age4);
        set(handles.age5,'String',age5);set(handles.age6,'String',age6);
        set(handles.age7,'String',age7);
        w1 = num2str(round(weight(1),2),'%.2f');w2 = num2str(round(weight(2),2),'%.2f');
        w3 = num2str(round(weight(3),2),'%.2f');w4 = num2str(round(weight(4),2),'%.2f');
        w5 = num2str(round(weight(5),2),'%.2f');w6 = num2str(round(weight(6),2),'%.2f');
        w7 = num2str(round(weight(7),2),'%.2f');
        set(handles.weight1,'String',w1);set(handles.weight2,'String',w2);
        set(handles.weight3,'String',w3);set(handles.weight4,'String',w4);
        set(handles.weight5,'String',w5);set(handles.weight6,'String',w6);
        set(handles.weight7,'String',w7);
        s1 = num2str(round(sigma(1),2),'%.2f');s2 = num2str(round(sigma(2),2),'%.2f');
        s3 = num2str(round(sigma(3),2),'%.2f');s4 = num2str(round(sigma(4),2),'%.2f');
        s5 = num2str(round(sigma(5),2),'%.2f');s6 = num2str(round(sigma(6),2),'%.2f');
        s7 = num2str(round(sigma(7),2),'%.2f');
        set(handles.sigma1,'String',s1);set(handles.sigma2,'String',s2);
        set(handles.sigma3,'String',s3);set(handles.sigma4,'String',s4);
        set(handles.sigma5,'String',s5);set(handles.sigma6,'String',s6);
        set(handles.sigma7,'String',s7);
        bic = num2str(round(BIC,2),'%.2f');
        set(handles.BICtext,'String',bic);
        
    elseif TempAge == 8
        display8 = [handles.age1,handles.age2,handles.age3,...
            handles.age4,handles.age5,handles.age6,handles.age7,handles.age8,...
            handles.sigma1,handles.sigma2,handles.sigma3,handles.sigma4,handles.sigma5,...
            handles.sigma6,handles.sigma7,handles.sigma8,handles.weight1,handles.weight2,...
            handles.weight3,handles.weight4,handles.weight5,handles.weight6,handles.weight7,...
            handles.weight8];
        set(display8,'Visible','on');
        age1 = num2str(round(group(1)));age2 = num2str(round(group(2)));
        age3 = num2str(round(group(3)));age4 = num2str(round(group(4)));
        age5 = num2str(round(group(5)));age6 = num2str(round(group(6)));
        age7 = num2str(round(group(7)));age8 = num2str(round(group(8)));
        set(handles.age1,'String',age1);set(handles.age2,'String',age2);
        set(handles.age3,'String',age3);set(handles.age4,'String',age4);
        set(handles.age5,'String',age5);set(handles.age6,'String',age6);
        set(handles.age7,'String',age7);set(handles.age8,'String',age8);
        w1 = num2str(round(weight(1),2),'%.2f');w2 = num2str(round(weight(2),2),'%.2f');
        w3 = num2str(round(weight(3),2),'%.2f');w4 = num2str(round(weight(4),2),'%.2f');
        w5 = num2str(round(weight(5),2),'%.2f');w6 = num2str(round(weight(6),2),'%.2f');
        w7 = num2str(round(weight(7),2),'%.2f');w8 = num2str(round(weight(8),2),'%.2f');
        set(handles.weight1,'String',w1);set(handles.weight2,'String',w2);
        set(handles.weight3,'String',w3);set(handles.weight4,'String',w4);
        set(handles.weight5,'String',w5);set(handles.weight6,'String',w6);
        set(handles.weight7,'String',w7);set(handles.weight8,'String',w8);
        s1 = num2str(round(sigma(1),2),'%.2f');s2 = num2str(round(sigma(2),2),'%.2f');
        s3 = num2str(round(sigma(3),2),'%.2f');s4 = num2str(round(sigma(4),2),'%.2f');
        s5 = num2str(round(sigma(5),2),'%.2f');s6 = num2str(round(sigma(6),2),'%.2f');
        s7 = num2str(round(sigma(7),2),'%.2f');s8 = num2str(round(sigma(8),2),'%.2f');
        set(handles.sigma1,'String',s1);set(handles.sigma2,'String',s2);
        set(handles.sigma3,'String',s3);set(handles.sigma4,'String',s4);
        set(handles.sigma5,'String',s5);set(handles.sigma6,'String',s6);
        set(handles.sigma7,'String',s7);set(handles.sigma8,'String',s8);
        bic = num2str(round(BIC,2),'%.2f');
        set(handles.BICtext,'String',bic);
        
    elseif TempAge == 9
        display9 = [handles.age1,handles.age2,handles.age3,...
            handles.age4,handles.age5,handles.age6,handles.age7,handles.age8,...
            handles.age9,handles.sigma1,handles.sigma2,handles.sigma3,handles.sigma4,...
            handles.sigma5,handles.sigma6,handles.sigma7,handles.sigma8,handles.sigma9,...
            handles.weight1,handles.weight2,handles.weight3,handles.weight4,...
            handles.weight5,handles.weight6,handles.weight7,handles.weight8,handles.weight9];
        set(display9,'Visible','on');
        age1 = num2str(round(group(1)));age2 = num2str(round(group(2)));
        age3 = num2str(round(group(3)));age4 = num2str(round(group(4)));
        age5 = num2str(round(group(5)));age6 = num2str(round(group(6)));
        age7 = num2str(round(group(7)));age8 = num2str(round(group(8)));
        age9 = num2str(round(group(9)));
        set(handles.age1,'String',age1);set(handles.age2,'String',age2);
        set(handles.age3,'String',age3);set(handles.age4,'String',age4);
        set(handles.age5,'String',age5);set(handles.age6,'String',age6);
        set(handles.age7,'String',age7);set(handles.age8,'String',age8);
        set(handles.age9,'String',age9);
        w1 = num2str(round(weight(1),2),'%.2f');w2 = num2str(round(weight(2),2),'%.2f');
        w3 = num2str(round(weight(3),2),'%.2f');w4 = num2str(round(weight(4),2),'%.2f');
        w5 = num2str(round(weight(5),2),'%.2f');w6 = num2str(round(weight(6),2),'%.2f');
        w7 = num2str(round(weight(7),2),'%.2f');w8 = num2str(round(weight(8),2),'%.2f');
        w9 = num2str(round(weight(9),2),'%.2f');
        set(handles.weight1,'String',w1);set(handles.weight2,'String',w2);
        set(handles.weight3,'String',w3);set(handles.weight4,'String',w4);
        set(handles.weight5,'String',w5);set(handles.weight6,'String',w6);
        set(handles.weight7,'String',w7);set(handles.weight8,'String',w8);
        set(handles.weight9,'String',w9);
        s1 = num2str(round(sigma(1),2),'%.2f');s2 = num2str(round(sigma(2),2),'%.2f');
        s3 = num2str(round(sigma(3),2),'%.2f');s4 = num2str(round(sigma(4),2),'%.2f');
        s5 = num2str(round(sigma(5),2),'%.2f');s6 = num2str(round(sigma(6),2),'%.2f');
        s7 = num2str(round(sigma(7),2),'%.2f');s8 = num2str(round(sigma(8),2),'%.2f');
        s9 = num2str(round(sigma(9),2),'%.2f');
        set(handles.sigma1,'String',s1);set(handles.sigma2,'String',s2);
        set(handles.sigma3,'String',s3);set(handles.sigma4,'String',s4);
        set(handles.sigma5,'String',s5);set(handles.sigma6,'String',s6);
        set(handles.sigma7,'String',s7);set(handles.sigma8,'String',s8);
        set(handles.sigma9,'String',s9);
        bic = num2str(round(BIC,2),'%.2f');
        set(handles.BICtext,'String',bic);
    elseif TempAge == 10
        display10 = [handles.age1,handles.age2,handles.age3,...
            handles.age4,handles.age5,handles.age6,handles.age7,handles.age8,...
            handles.age9,handles.age10,handles.sigma1,handles.sigma2,handles.sigma3,handles.sigma4,...
            handles.sigma5,handles.sigma6,handles.sigma7,handles.sigma8,handles.sigma9,...
            handles.sigma10,handles.weight1,handles.weight2,handles.weight3,handles.weight4,...
            handles.weight5,handles.weight6,handles.weight7,handles.weight8,handles.weight9,...
            handles.weight10];
        set(display10,'Visible','on');
        age1 = num2str(round(group(1)));age2 = num2str(round(group(2)));
        age3 = num2str(round(group(3)));age4 = num2str(round(group(4)));
        age5 = num2str(round(group(5)));age6 = num2str(round(group(6)));
        age7 = num2str(round(group(7)));age8 = num2str(round(group(8)));
        age9 = num2str(round(group(9)));age10 = num2str(round(group(10)));
        set(handles.age1,'String',age1);set(handles.age2,'String',age2);
        set(handles.age3,'String',age3);set(handles.age4,'String',age4);
        set(handles.age5,'String',age5);set(handles.age6,'String',age6);
        set(handles.age7,'String',age7);set(handles.age8,'String',age8);
        set(handles.age9,'String',age9);set(handles.age10,'String',age10);
        w1 = num2str(round(weight(1),2),'%.2f');w2 = num2str(round(weight(2),2),'%.2f');
        w3 = num2str(round(weight(3),2),'%.2f');w4 = num2str(round(weight(4),2),'%.2f');
        w5 = num2str(round(weight(5),2),'%.2f');w6 = num2str(round(weight(6),2),'%.2f');
        w7 = num2str(round(weight(7),2),'%.2f');w8 = num2str(round(weight(8),2),'%.2f');
        w9 = num2str(round(weight(9),2),'%.2f');w10 = num2str(round(weight(10),2),'%.2f');
        set(handles.weight1,'String',w1);set(handles.weight2,'String',w2);
        set(handles.weight3,'String',w3);set(handles.weight4,'String',w4);
        set(handles.weight5,'String',w5);set(handles.weight6,'String',w6);
        set(handles.weight7,'String',w7);set(handles.weight8,'String',w8);
        set(handles.weight9,'String',w9);set(handles.weight10,'String',w10);
        s1 = num2str(round(sigma(1),2),'%.2f');s2 = num2str(round(sigma(2),2),'%.2f');
        s3 = num2str(round(sigma(3),2),'%.2f');s4 = num2str(round(sigma(4),2),'%.2f');
        s5 = num2str(round(sigma(5),2),'%.2f');s6 = num2str(round(sigma(6),2),'%.2f');
        s7 = num2str(round(sigma(7),2),'%.2f');s8 = num2str(round(sigma(8),2),'%.2f');
        s9 = num2str(round(sigma(9),2),'%.2f');s10 = num2str(round(sigma(10),2),'%.2f');
        set(handles.sigma1,'String',s1);set(handles.sigma2,'String',s2);
        set(handles.sigma3,'String',s3);set(handles.sigma4,'String',s4);
        set(handles.sigma5,'String',s5);set(handles.sigma6,'String',s6);
        set(handles.sigma7,'String',s7);set(handles.sigma8,'String',s8);
        set(handles.sigma9,'String',s9);set(handles.sigma10,'String',s10);
        bic = num2str(round(BIC,2),'%.2f');
        set(handles.BICtext,'String',bic);
    elseif TempAge == 11
        display11 = [handles.age1,handles.age2,handles.age3,...
            handles.age4,handles.age5,handles.age6,handles.age7,handles.age8,...
            handles.age9,handles.age10,handles.age11,handles.sigma1,handles.sigma2,...
            handles.sigma3,handles.sigma4,handles.sigma5,handles.sigma6,handles.sigma7,...
            handles.sigma8,handles.sigma9,handles.sigma10,handles.sigma11,handles.weight1,...
            handles.weight2,handles.weight3,handles.weight4,handles.weight5,handles.weight6,...
            handles.weight7,handles.weight8,handles.weight9,handles.weight10,handles.weight11];
        
        set(display11,'Visible','on');
        
        age1 = num2str(round(group(1)));age2 = num2str(round(group(2)));
        age3 = num2str(round(group(3)));age4 = num2str(round(group(4)));
        age5 = num2str(round(group(5)));age6 = num2str(round(group(6)));
        age7 = num2str(round(group(7)));age8 = num2str(round(group(8)));
        age9 = num2str(round(group(9)));age10 = num2str(round(group(10)));
        age11 = num2str(round(group(11)));
        set(handles.age1,'String',age1);set(handles.age2,'String',age2);
        set(handles.age3,'String',age3);set(handles.age4,'String',age4);
        set(handles.age5,'String',age5);set(handles.age6,'String',age6);
        set(handles.age7,'String',age7);set(handles.age8,'String',age8);
        set(handles.age9,'String',age9);set(handles.age10,'String',age10);
        set(handles.age11,'String',age11);
        w1 = num2str(round(weight(1),2),'%.2f');w2 = num2str(round(weight(2),2),'%.2f');
        w3 = num2str(round(weight(3),2),'%.2f');w4 = num2str(round(weight(4),2),'%.2f');
        w5 = num2str(round(weight(5),2),'%.2f');w6 = num2str(round(weight(6),2),'%.2f');
        w7 = num2str(round(weight(7),2),'%.2f');w8 = num2str(round(weight(8),2),'%.2f');
        w9 = num2str(round(weight(9),2),'%.2f');w10 = num2str(round(weight(10),2),'%.2f');
        w11 = num2str(round(weight(11),2),'%.2f');
        set(handles.weight1,'String',w1);set(handles.weight2,'String',w2);
        set(handles.weight3,'String',w3);set(handles.weight4,'String',w4);
        set(handles.weight5,'String',w5);set(handles.weight6,'String',w6);
        set(handles.weight7,'String',w7);set(handles.weight8,'String',w8);
        set(handles.weight9,'String',w9);set(handles.weight10,'String',w10);
        set(handles.weight11,'String',w11);
        s1 = num2str(round(sigma(1),2),'%.2f');s2 = num2str(round(sigma(2),2),'%.2f');
        s3 = num2str(round(sigma(3),2),'%.2f');s4 = num2str(round(sigma(4),2),'%.2f');
        s5 = num2str(round(sigma(5),2),'%.2f');s6 = num2str(round(sigma(6),2),'%.2f');
        s7 = num2str(round(sigma(7),2),'%.2f');s8 = num2str(round(sigma(8),2),'%.2f');
        s9 = num2str(round(sigma(9),2),'%.2f');s10 = num2str(round(sigma(10),2),'%.2f');
        s11 = num2str(round(sigma(11),2),'%.2f');
        set(handles.sigma1,'String',s1);set(handles.sigma2,'String',s2);
        set(handles.sigma3,'String',s3);set(handles.sigma4,'String',s4);
        set(handles.sigma5,'String',s5);set(handles.sigma6,'String',s6);
        set(handles.sigma7,'String',s7);set(handles.sigma8,'String',s8);
        set(handles.sigma9,'String',s9);set(handles.sigma10,'String',s10);
        set(handles.sigma11,'String',s11);
        bic = num2str(round(BIC,2),'%.2f');
        set(handles.BICtext,'String',bic);
    elseif TempAge == 12
        display12 = [handles.age1,handles.age2,handles.age3,...
            handles.age4,handles.age5,handles.age6,handles.age7,handles.age8,...
            handles.age9,handles.age10,handles.age11,handles.age12,handles.sigma1,handles.sigma2,...
            handles.sigma3,handles.sigma4,handles.sigma5,handles.sigma6,handles.sigma7,...
            handles.sigma8,handles.sigma9,handles.sigma10,handles.sigma11,handles.sigma12,...
            handles.weight1,handles.weight2,handles.weight3,handles.weight4,handles.weight5,...
            handles.weight6,handles.weight7,handles.weight8,handles.weight9,...
            handles.weight10,handles.weight11,handles.weight12];
        
        set(display12,'Visible','on');
        
        age1 = num2str(round(group(1)));age2 = num2str(round(group(2)));
        age3 = num2str(round(group(3)));age4 = num2str(round(group(4)));
        age5 = num2str(round(group(5)));age6 = num2str(round(group(6)));
        age7 = num2str(round(group(7)));age8 = num2str(round(group(8)));
        age9 = num2str(round(group(9)));age10 = num2str(round(group(10)));
        age11 = num2str(round(group(11)));age12 = num2str(round(group(12)));
        set(handles.age1,'String',age1);set(handles.age2,'String',age2);
        set(handles.age3,'String',age3);set(handles.age4,'String',age4);
        set(handles.age5,'String',age5);set(handles.age6,'String',age6);
        set(handles.age7,'String',age7);set(handles.age8,'String',age8);
        set(handles.age9,'String',age9);set(handles.age10,'String',age10);
        set(handles.age11,'String',age11);set(handles.age12,'String',age12);
        w1 = num2str(round(weight(1),2),'%.2f');w2 = num2str(round(weight(2),2),'%.2f');
        w3 = num2str(round(weight(3),2),'%.2f');w4 = num2str(round(weight(4),2),'%.2f');
        w5 = num2str(round(weight(5),2),'%.2f');w6 = num2str(round(weight(6),2),'%.2f');
        w7 = num2str(round(weight(7),2),'%.2f');w8 = num2str(round(weight(8),2),'%.2f');
        w9 = num2str(round(weight(9),2),'%.2f');w10 = num2str(round(weight(10),2),'%.2f');
        w11 = num2str(round(weight(11),2),'%.2f');w12 = num2str(round(weight(12),2),'%.2f');
        set(handles.weight1,'String',w1);set(handles.weight2,'String',w2);
        set(handles.weight3,'String',w3);set(handles.weight4,'String',w4);
        set(handles.weight5,'String',w5);set(handles.weight6,'String',w6);
        set(handles.weight7,'String',w7);set(handles.weight8,'String',w8);
        set(handles.weight9,'String',w9);set(handles.weight10,'String',w10);
        set(handles.weight11,'String',w11);set(handles.weight12,'String',w12);
        s1 = num2str(round(sigma(1),2),'%.2f');s2 = num2str(round(sigma(2),2),'%.2f');
        s3 = num2str(round(sigma(3),2),'%.2f');s4 = num2str(round(sigma(4),2),'%.2f');
        s5 = num2str(round(sigma(5),2),'%.2f');s6 = num2str(round(sigma(6),2),'%.2f');
        s7 = num2str(round(sigma(7),2),'%.2f');s8 = num2str(round(sigma(8),2),'%.2f');
        s9 = num2str(round(sigma(9),2),'%.2f');s10 = num2str(round(sigma(10),2),'%.2f');
        s11 = num2str(round(sigma(11),2),'%.2f');s12 = num2str(round(sigma(12),2),'%.2f');
        set(handles.sigma1,'String',s1);set(handles.sigma2,'String',s2);
        set(handles.sigma3,'String',s3);set(handles.sigma4,'String',s4);
        set(handles.sigma5,'String',s5);set(handles.sigma6,'String',s6);
        set(handles.sigma7,'String',s7);set(handles.sigma8,'String',s8);
        set(handles.sigma9,'String',s9);set(handles.sigma10,'String',s10);
        set(handles.sigma11,'String',s11);set(handles.sigma12,'String',s12);
        bic = num2str(round(BIC,2),'%.2f');
        set(handles.BICtext,'String',bic);
        
    elseif TempAge == 13
        display13 = [handles.age1,handles.age2,handles.age3,...
            handles.age4,handles.age5,handles.age6,handles.age7,handles.age8,...
            handles.age9,handles.age10,handles.age11,handles.age12,handles.age13,...
            handles.sigma1,handles.sigma2,handles.sigma3,handles.sigma4,handles.sigma5,...
            handles.sigma6,handles.sigma7,handles.sigma8,handles.sigma9,handles.sigma10,...
            handles.sigma11,handles.sigma12,handles.sigma13,handles.weight1,handles.weight2,...
            handles.weight3,handles.weight4,handles.weight5,handles.weight6,handles.weight7,...
            handles.weight8,handles.weight9,handles.weight10,handles.weight11,handles.weight12,...
            handles.weight13];
        
        set(display13,'Visible','on');
        age1 = num2str(round(group(1)));age2 = num2str(round(group(2)));
        age3 = num2str(round(group(3)));age4 = num2str(round(group(4)));
        age5 = num2str(round(group(5)));age6 = num2str(round(group(6)));
        age7 = num2str(round(group(7)));age8 = num2str(round(group(8)));
        age9 = num2str(round(group(9)));age10 = num2str(round(group(10)));
        age11 = num2str(round(group(11)));age12 = num2str(round(group(12)));
        age13 = num2str(round(group(13)));
        set(handles.age1,'String',age1);set(handles.age2,'String',age2);
        set(handles.age3,'String',age3);set(handles.age4,'String',age4);
        set(handles.age5,'String',age5);set(handles.age6,'String',age6);
        set(handles.age7,'String',age7);set(handles.age8,'String',age8);
        set(handles.age9,'String',age9);set(handles.age10,'String',age10);
        set(handles.age11,'String',age11);set(handles.age12,'String',age12);
        set(handles.age13,'String',age13);
        w1 = num2str(round(weight(1),2),'%.2f');w2 = num2str(round(weight(2),2),'%.2f');
        w3 = num2str(round(weight(3),2),'%.2f');w4 = num2str(round(weight(4),2),'%.2f');
        w5 = num2str(round(weight(5),2),'%.2f');w6 = num2str(round(weight(6),2),'%.2f');
        w7 = num2str(round(weight(7),2),'%.2f');w8 = num2str(round(weight(8),2),'%.2f');
        w9 = num2str(round(weight(9),2),'%.2f');w10 = num2str(round(weight(10),2),'%.2f');
        w11 = num2str(round(weight(11),2),'%.2f');w12 = num2str(round(weight(12),2),'%.2f');
        w13 = num2str(round(weight(13),2),'%.2f');
        set(handles.weight1,'String',w1);set(handles.weight2,'String',w2);
        set(handles.weight3,'String',w3);set(handles.weight4,'String',w4);
        set(handles.weight5,'String',w5);set(handles.weight6,'String',w6);
        set(handles.weight7,'String',w7);set(handles.weight8,'String',w8);
        set(handles.weight9,'String',w9);set(handles.weight10,'String',w10);
        set(handles.weight11,'String',w11);set(handles.weight12,'String',w12);
        set(handles.weight13,'String',w13);
        s1 = num2str(round(sigma(1),2),'%.2f');s2 = num2str(round(sigma(2),2),'%.2f');
        s3 = num2str(round(sigma(3),2),'%.2f');s4 = num2str(round(sigma(4),2),'%.2f');
        s5 = num2str(round(sigma(5),2),'%.2f');s6 = num2str(round(sigma(6),2),'%.2f');
        s7 = num2str(round(sigma(7),2),'%.2f');s8 = num2str(round(sigma(8),2),'%.2f');
        s9 = num2str(round(sigma(9),2),'%.2f');s10 = num2str(round(sigma(10),2),'%.2f');
        s11 = num2str(round(sigma(11),2),'%.2f');s12 = num2str(round(sigma(12),2),'%.2f');
        s13 = num2str(round(sigma(13),2),'%.2f');
        set(handles.sigma1,'String',s1);set(handles.sigma2,'String',s2);
        set(handles.sigma3,'String',s3);set(handles.sigma4,'String',s4);
        set(handles.sigma5,'String',s5);set(handles.sigma6,'String',s6);
        set(handles.sigma7,'String',s7);set(handles.sigma8,'String',s8);
        set(handles.sigma9,'String',s9);set(handles.sigma10,'String',s10);
        set(handles.sigma11,'String',s11);set(handles.sigma12,'String',s12);
        set(handles.sigma13,'String',s13);
        bic = num2str(round(BIC,2),'%.2f');
        set(handles.BICtext,'String',bic);
        
    elseif TempAge == 14
        display14 = [handles.age1,handles.age2,handles.age3,...
            handles.age4,handles.age5,handles.age6,handles.age7,handles.age8,...
            handles.age9,handles.age10,handles.age11,handles.age12,handles.age13,handles.age14,...
            handles.sigma1,handles.sigma2,handles.sigma3,handles.sigma4,handles.sigma5,...
            handles.sigma6,handles.sigma7,handles.sigma8,handles.sigma9,handles.sigma10,...
            handles.sigma11,handles.sigma12,handles.sigma13,handles.sigma14,handles.weight1,...
            handles.weight2,handles.weight3,handles.weight4,handles.weight5,handles.weight6,...
            handles.weight7,handles.weight8,handles.weight9,handles.weight10,handles.weight11,...
            handles.weight12,handles.weight13,handles.weight14];
        
        set(display14,'Visible','on');
        age1 = num2str(round(group(1)));age2 = num2str(round(group(2)));
        age3 = num2str(round(group(3)));age4 = num2str(round(group(4)));
        age5 = num2str(round(group(5)));age6 = num2str(round(group(6)));
        age7 = num2str(round(group(7)));age8 = num2str(round(group(8)));
        age9 = num2str(round(group(9)));age10 = num2str(round(group(10)));
        age11 = num2str(round(group(11)));age12 = num2str(round(group(12)));
        age13 = num2str(round(group(13)));age14 = num2str(round(group(14)));
        set(handles.age1,'String',age1);set(handles.age2,'String',age2);
        set(handles.age3,'String',age3);set(handles.age4,'String',age4);
        set(handles.age5,'String',age5);set(handles.age6,'String',age6);
        set(handles.age7,'String',age7);set(handles.age8,'String',age8);
        set(handles.age9,'String',age9);set(handles.age10,'String',age10);
        set(handles.age11,'String',age11);set(handles.age12,'String',age12);
        set(handles.age13,'String',age13);set(handles.age14,'String',age14);
        w1 = num2str(round(weight(1),2),'%.2f');w2 = num2str(round(weight(2),2),'%.2f');
        w3 = num2str(round(weight(3),2),'%.2f');w4 = num2str(round(weight(4),2),'%.2f');
        w5 = num2str(round(weight(5),2),'%.2f');w6 = num2str(round(weight(6),2),'%.2f');
        w7 = num2str(round(weight(7),2),'%.2f');w8 = num2str(round(weight(8),2),'%.2f');
        w9 = num2str(round(weight(9),2),'%.2f');w10 = num2str(round(weight(10),2),'%.2f');
        w11 = num2str(round(weight(11),2),'%.2f');w12 = num2str(round(weight(12),2),'%.2f');
        w13 = num2str(round(weight(13),2),'%.2f');w14 = num2str(round(weight(14),2),'%.2f');
        set(handles.weight1,'String',w1);set(handles.weight2,'String',w2);
        set(handles.weight3,'String',w3);set(handles.weight4,'String',w4);
        set(handles.weight5,'String',w5);set(handles.weight6,'String',w6);
        set(handles.weight7,'String',w7);set(handles.weight8,'String',w8);
        set(handles.weight9,'String',w9);set(handles.weight10,'String',w10);
        set(handles.weight11,'String',w11);set(handles.weight12,'String',w12);
        set(handles.weight13,'String',w13);set(handles.weight14,'String',w14);
        s1 = num2str(round(sigma(1),2),'%.2f');s2 = num2str(round(sigma(2),2),'%.2f');
        s3 = num2str(round(sigma(3),2),'%.2f');s4 = num2str(round(sigma(4),2),'%.2f');
        s5 = num2str(round(sigma(5),2),'%.2f');s6 = num2str(round(sigma(6),2),'%.2f');
        s7 = num2str(round(sigma(7),2),'%.2f');s8 = num2str(round(sigma(8),2),'%.2f');
        s9 = num2str(round(sigma(9),2),'%.2f');s10 = num2str(round(sigma(10),2),'%.2f');
        s11 = num2str(round(sigma(11),2),'%.2f');s12 = num2str(round(sigma(12),2),'%.2f');
        s13 = num2str(round(sigma(13),2),'%.2f');s14 = num2str(round(sigma(14),2),'%.2f');
        set(handles.sigma1,'String',s1);set(handles.sigma2,'String',s2);
        set(handles.sigma3,'String',s3);set(handles.sigma4,'String',s4);
        set(handles.sigma5,'String',s5);set(handles.sigma6,'String',s6);
        set(handles.sigma7,'String',s7);set(handles.sigma8,'String',s8);
        set(handles.sigma9,'String',s9);set(handles.sigma10,'String',s10);
        set(handles.sigma11,'String',s11);set(handles.sigma12,'String',s12);
        set(handles.sigma13,'String',s13);set(handles.sigma14,'String',s14);
        bic = num2str(round(BIC,2),'%.2f');
        set(handles.BICtext,'String',bic);
    elseif TempAge == 15
        display15 = [handles.age1,handles.age2,handles.age3,...
            handles.age4,handles.age5,handles.age6,handles.age7,handles.age8,...
            handles.age9,handles.age10,handles.age11,handles.age12,handles.age13,handles.age14,...
            handles.age15,handles.sigma1,handles.sigma2,handles.sigma3,handles.sigma4,handles.sigma5,...
            handles.sigma6,handles.sigma7,handles.sigma8,handles.sigma9,handles.sigma10,...
            handles.sigma11,handles.sigma12,handles.sigma13,handles.sigma14,handles.sigma15,...
            handles.weight1,handles.weight2,handles.weight3,handles.weight4,handles.weight5,...
            handles.weight6,handles.weight7,handles.weight8,handles.weight9,handles.weight10,...
            handles.weight11,handles.weight12,handles.weight13,handles.weight14,handles.weight15];
        
        set(display15,'Visible','on');
        age1 = num2str(round(group(1)));age2 = num2str(round(group(2)));
        age3 = num2str(round(group(3)));age4 = num2str(round(group(4)));
        age5 = num2str(round(group(5)));age6 = num2str(round(group(6)));
        age7 = num2str(round(group(7)));age8 = num2str(round(group(8)));
        age9 = num2str(round(group(9)));age10 = num2str(round(group(10)));
        age11 = num2str(round(group(11)));age12 = num2str(round(group(12)));
        age13 = num2str(round(group(13)));age14 = num2str(round(group(14)));
        age15 = num2str(round(group(15)));
        set(handles.age1,'String',age1);set(handles.age2,'String',age2);
        set(handles.age3,'String',age3);set(handles.age4,'String',age4);
        set(handles.age5,'String',age5);set(handles.age6,'String',age6);
        set(handles.age7,'String',age7);set(handles.age8,'String',age8);
        set(handles.age9,'String',age9);set(handles.age10,'String',age10);
        set(handles.age11,'String',age11);set(handles.age12,'String',age12);
        set(handles.age13,'String',age13);set(handles.age14,'String',age14);
        set(handles.age15,'String',age15);
        w1 = num2str(round(weight(1),2),'%.2f');w2 = num2str(round(weight(2),2),'%.2f');
        w3 = num2str(round(weight(3),2),'%.2f');w4 = num2str(round(weight(4),2),'%.2f');
        w5 = num2str(round(weight(5),2),'%.2f');w6 = num2str(round(weight(6),2),'%.2f');
        w7 = num2str(round(weight(7),2),'%.2f');w8 = num2str(round(weight(8),2),'%.2f');
        w9 = num2str(round(weight(9),2),'%.2f');w10 = num2str(round(weight(10),2),'%.2f');
        w11 = num2str(round(weight(11),2),'%.2f');w12 = num2str(round(weight(12),2),'%.2f');
        w13 = num2str(round(weight(13),2),'%.2f');w14 = num2str(round(weight(14),2),'%.2f');
        w15 = num2str(round(weight(15),2),'%.2f');
        set(handles.weight1,'String',w1);set(handles.weight2,'String',w2);
        set(handles.weight3,'String',w3);set(handles.weight4,'String',w4);
        set(handles.weight5,'String',w5);set(handles.weight6,'String',w6);
        set(handles.weight7,'String',w7);set(handles.weight8,'String',w8);
        set(handles.weight9,'String',w9);set(handles.weight10,'String',w10);
        set(handles.weight11,'String',w11);set(handles.weight12,'String',w12);
        set(handles.weight13,'String',w13);set(handles.weight14,'String',w14);
        set(handles.weight15,'String',w15);
        s1 = num2str(round(sigma(1),2),'%.2f');s2 = num2str(round(sigma(2),2),'%.2f');
        s3 = num2str(round(sigma(3),2),'%.2f');s4 = num2str(round(sigma(4),2),'%.2f');
        s5 = num2str(round(sigma(5),2),'%.2f');s6 = num2str(round(sigma(6),2),'%.2f');
        s7 = num2str(round(sigma(7),2),'%.2f');s8 = num2str(round(sigma(8),2),'%.2f');
        s9 = num2str(round(sigma(9),2),'%.2f');s10 = num2str(round(sigma(10),2),'%.2f');
        s11 = num2str(round(sigma(11),2),'%.2f');s12 = num2str(round(sigma(12),2),'%.2f');
        s13 = num2str(round(sigma(13),2),'%.2f');s14 = num2str(round(sigma(14),2),'%.2f');
        s15 = num2str(round(sigma(15),2),'%.2f');
        set(handles.sigma1,'String',s1);set(handles.sigma2,'String',s2);
        set(handles.sigma3,'String',s3);set(handles.sigma4,'String',s4);
        set(handles.sigma5,'String',s5);set(handles.sigma6,'String',s6);
        set(handles.sigma7,'String',s7);set(handles.sigma8,'String',s8);
        set(handles.sigma9,'String',s9);set(handles.sigma10,'String',s10);
        set(handles.sigma11,'String',s11);set(handles.sigma12,'String',s12);
        set(handles.sigma13,'String',s13);set(handles.sigma14,'String',s14);
        set(handles.sigma15,'String',s15);
        bic = num2str(round(BIC,2),'%.2f');
        set(handles.BICtext,'String',bic);
        
    elseif TempAge == 16
        display16 = [handles.age1,handles.age2,handles.age3,handles.age4,handles.age5,...
            handles.age6,handles.age7,handles.age8,handles.age9,handles.age10,...
            handles.age11,handles.age12,handles.age13,handles.age14,handles.age15,...
            handles.age16,handles.sigma1,handles.sigma2,handles.sigma3,handles.sigma4,...
            handles.sigma5,handles.sigma6,handles.sigma7,handles.sigma8,handles.sigma9,...
            handles.sigma10,handles.sigma11,handles.sigma12,handles.sigma13,handles.sigma14,...
            handles.sigma15,handles.sigma16,handles.weight1,handles.weight2,handles.weight3,...
            handles.weight4,handles.weight5,handles.weight6,handles.weight7,handles.weight8,...
            handles.weight9,handles.weight10,handles.weight11,handles.weight12,...
            handles.weight13,handles.weight14,handles.weight15,handles.weight16];
        
        set(display16,'Visible','on');
        age1 = num2str(round(group(1)));age2 = num2str(round(group(2)));
        age3 = num2str(round(group(3)));age4 = num2str(round(group(4)));
        age5 = num2str(round(group(5)));age6 = num2str(round(group(6)));
        age7 = num2str(round(group(7)));age8 = num2str(round(group(8)));
        age9 = num2str(round(group(9)));age10 = num2str(round(group(10)));
        age11 = num2str(round(group(11)));age12 = num2str(round(group(12)));
        age13 = num2str(round(group(13)));age14 = num2str(round(group(14)));
        age15 = num2str(round(group(15)));age16 = num2str(round(group(16)));
        set(handles.age1,'String',age1);set(handles.age2,'String',age2);
        set(handles.age3,'String',age3);set(handles.age4,'String',age4);
        set(handles.age5,'String',age5);set(handles.age6,'String',age6);
        set(handles.age7,'String',age7);set(handles.age8,'String',age8);
        set(handles.age9,'String',age9);set(handles.age10,'String',age10);
        set(handles.age11,'String',age11);set(handles.age12,'String',age12);
        set(handles.age13,'String',age13);set(handles.age14,'String',age14);
        set(handles.age15,'String',age15);set(handles.age16,'String',age16);
        w1 = num2str(round(weight(1),2),'%.2f');w2 = num2str(round(weight(2),2),'%.2f');
        w3 = num2str(round(weight(3),2),'%.2f');w4 = num2str(round(weight(4),2),'%.2f');
        w5 = num2str(round(weight(5),2),'%.2f');w6 = num2str(round(weight(6),2),'%.2f');
        w7 = num2str(round(weight(7),2),'%.2f');w8 = num2str(round(weight(8),2),'%.2f');
        w9 = num2str(round(weight(9),2),'%.2f');w10 = num2str(round(weight(10),2),'%.2f');
        w11 = num2str(round(weight(11),2),'%.2f');w12 = num2str(round(weight(12),2),'%.2f');
        w13 = num2str(round(weight(13),2),'%.2f');w14 = num2str(round(weight(14),2),'%.2f');
        w15 = num2str(round(weight(15),2),'%.2f');w16 = num2str(round(weight(16),2),'%.2f');
        set(handles.weight1,'String',w1);set(handles.weight2,'String',w2);
        set(handles.weight3,'String',w3);set(handles.weight4,'String',w4);
        set(handles.weight5,'String',w5);set(handles.weight6,'String',w6);
        set(handles.weight7,'String',w7);set(handles.weight8,'String',w8);
        set(handles.weight9,'String',w9);set(handles.weight10,'String',w10);
        set(handles.weight11,'String',w11);set(handles.weight12,'String',w12);
        set(handles.weight13,'String',w13);set(handles.weight14,'String',w14);
        set(handles.weight15,'String',w15);set(handles.weight16,'String',w16);
        s1 = num2str(round(sigma(1),2),'%.2f');s2 = num2str(round(sigma(2),2),'%.2f');
        s3 = num2str(round(sigma(3),2),'%.2f');s4 = num2str(round(sigma(4),2),'%.2f');
        s5 = num2str(round(sigma(5),2),'%.2f');s6 = num2str(round(sigma(6),2),'%.2f');
        s7 = num2str(round(sigma(7),2),'%.2f');s8 = num2str(round(sigma(8),2),'%.2f');
        s9 = num2str(round(sigma(9),2),'%.2f');s10 = num2str(round(sigma(10),2),'%.2f');
        s11 = num2str(round(sigma(11),2),'%.2f');s12 = num2str(round(sigma(12),2),'%.2f');
        s13 = num2str(round(sigma(13),2),'%.2f');s14 = num2str(round(sigma(14),2),'%.2f');
        s15 = num2str(round(sigma(15),2),'%.2f');s16 = num2str(round(sigma(16),2),'%.2f');
        set(handles.sigma1,'String',s1);set(handles.sigma2,'String',s2);
        set(handles.sigma3,'String',s3);set(handles.sigma4,'String',s4);
        set(handles.sigma5,'String',s5);set(handles.sigma6,'String',s6);
        set(handles.sigma7,'String',s7);set(handles.sigma8,'String',s8);
        set(handles.sigma9,'String',s9);set(handles.sigma10,'String',s10);
        set(handles.sigma11,'String',s11);set(handles.sigma12,'String',s12);
        set(handles.sigma13,'String',s13);set(handles.sigma14,'String',s14);
        set(handles.sigma15,'String',s15);set(handles.sigma16,'String',s16);
        bic = num2str(round(BIC,2),'%.2f');
        set(handles.BICtext,'String',bic);
        
    elseif TempAge == 17
        display17 = [handles.age1,handles.age2,handles.age3,handles.age4,handles.age5,...
            handles.age6,handles.age7,handles.age8,handles.age9,handles.age10,...
            handles.age11,handles.age12,handles.age13,handles.age14,handles.age15,...
            handles.age16,handles.age17,handles.sigma1,handles.sigma2,handles.sigma3,...
            handles.sigma4,handles.sigma5,handles.sigma6,handles.sigma7,handles.sigma8,...
            handles.sigma9,handles.sigma10,handles.sigma11,handles.sigma12,handles.sigma13,...
            handles.sigma14,handles.sigma15,handles.sigma16,handles.sigma17,handles.weight1,...
            handles.weight2,handles.weight3,handles.weight4,handles.weight5,handles.weight6,...
            handles.weight7,handles.weight8,handles.weight9,handles.weight10,handles.weight11,...
            handles.weight12,handles.weight13,handles.weight14,handles.weight15,handles.weight16,...
            handles.weight17];
        set(display17,'Visible','on');
        
        age1 = num2str(round(group(1)));age2 = num2str(round(group(2)));
        age3 = num2str(round(group(3)));age4 = num2str(round(group(4)));
        age5 = num2str(round(group(5)));age6 = num2str(round(group(6)));
        age7 = num2str(round(group(7)));age8 = num2str(round(group(8)));
        age9 = num2str(round(group(9)));age10 = num2str(round(group(10)));
        age11 = num2str(round(group(11)));age12 = num2str(round(group(12)));
        age13 = num2str(round(group(13)));age14 = num2str(round(group(14)));
        age15 = num2str(round(group(15)));age16 = num2str(round(group(16)));
        age17 = num2str(round(group(17)));
        set(handles.age1,'String',age1);set(handles.age2,'String',age2);
        set(handles.age3,'String',age3);set(handles.age4,'String',age4);
        set(handles.age5,'String',age5);set(handles.age6,'String',age6);
        set(handles.age7,'String',age7);set(handles.age8,'String',age8);
        set(handles.age9,'String',age9);set(handles.age10,'String',age10);
        set(handles.age11,'String',age11);set(handles.age12,'String',age12);
        set(handles.age13,'String',age13);set(handles.age14,'String',age14);
        set(handles.age15,'String',age15);set(handles.age16,'String',age16);
        set(handles.age17,'String',age17);
        w1 = num2str(round(weight(1),2),'%.2f');w2 = num2str(round(weight(2),2),'%.2f');
        w3 = num2str(round(weight(3),2),'%.2f');w4 = num2str(round(weight(4),2),'%.2f');
        w5 = num2str(round(weight(5),2),'%.2f');w6 = num2str(round(weight(6),2),'%.2f');
        w7 = num2str(round(weight(7),2),'%.2f');w8 = num2str(round(weight(8),2),'%.2f');
        w9 = num2str(round(weight(9),2),'%.2f');w10 = num2str(round(weight(10),2),'%.2f');
        w11 = num2str(round(weight(11),2),'%.2f');w12 = num2str(round(weight(12),2),'%.2f');
        w13 = num2str(round(weight(13),2),'%.2f');w14 = num2str(round(weight(14),2),'%.2f');
        w15 = num2str(round(weight(15),2),'%.2f');w16 = num2str(round(weight(16),2),'%.2f');
        w17 = num2str(round(weight(17),2),'%.2f');
        set(handles.weight1,'String',w1);set(handles.weight2,'String',w2);
        set(handles.weight3,'String',w3);set(handles.weight4,'String',w4);
        set(handles.weight5,'String',w5);set(handles.weight6,'String',w6);
        set(handles.weight7,'String',w7);set(handles.weight8,'String',w8);
        set(handles.weight9,'String',w9);set(handles.weight10,'String',w10);
        set(handles.weight11,'String',w11);set(handles.weight12,'String',w12);
        set(handles.weight13,'String',w13);set(handles.weight14,'String',w14);
        set(handles.weight15,'String',w15);set(handles.weight16,'String',w16);
        set(handles.weight17,'String',w17);
        s1 = num2str(round(sigma(1),2),'%.2f');s2 = num2str(round(sigma(2),2),'%.2f');
        s3 = num2str(round(sigma(3),2),'%.2f');s4 = num2str(round(sigma(4),2),'%.2f');
        s5 = num2str(round(sigma(5),2),'%.2f');s6 = num2str(round(sigma(6),2),'%.2f');
        s7 = num2str(round(sigma(7),2),'%.2f');s8 = num2str(round(sigma(8),2),'%.2f');
        s9 = num2str(round(sigma(9),2),'%.2f');s10 = num2str(round(sigma(10),2),'%.2f');
        s11 = num2str(round(sigma(11),2),'%.2f');s12 = num2str(round(sigma(12),2),'%.2f');
        s13 = num2str(round(sigma(13),2),'%.2f');s14 = num2str(round(sigma(14),2),'%.2f');
        s15 = num2str(round(sigma(15),2),'%.2f');s16 = num2str(round(sigma(16),2),'%.2f');
        s17 = num2str(round(sigma(17),2),'%.2f');
        set(handles.sigma1,'String',s1);set(handles.sigma2,'String',s2);
        set(handles.sigma3,'String',s3);set(handles.sigma4,'String',s4);
        set(handles.sigma5,'String',s5);set(handles.sigma6,'String',s6);
        set(handles.sigma7,'String',s7);set(handles.sigma8,'String',s8);
        set(handles.sigma9,'String',s9);set(handles.sigma10,'String',s10);
        set(handles.sigma11,'String',s11);set(handles.sigma12,'String',s12);
        set(handles.sigma13,'String',s13);set(handles.sigma14,'String',s14);
        set(handles.sigma15,'String',s15);set(handles.sigma16,'String',s16);
        set(handles.sigma17,'String',s17);
        bic = num2str(round(BIC,2),'%.2f');
        set(handles.BICtext,'String',bic);
        
    elseif TempAge == 18
        display18 = [handles.age1,handles.age2,handles.age3,handles.age4,handles.age5,...
            handles.age6,handles.age7,handles.age8,handles.age9,handles.age10,handles.age11,...
            handles.age12,handles.age13,handles.age14,handles.age15,handles.age16,...
            handles.age17,handles.age18,handles.sigma1,handles.sigma2,handles.sigma3,...
            handles.sigma4,handles.sigma5,handles.sigma6,handles.sigma7,handles.sigma8,...
            handles.sigma9,handles.sigma10,handles.sigma11,handles.sigma12,handles.sigma13,...
            handles.sigma14,handles.sigma15,handles.sigma16,handles.sigma17,handles.sigma18,...
            handles.weight1,handles.weight2,handles.weight3,handles.weight4,handles.weight5,...
            handles.weight6,handles.weight7,handles.weight8,handles.weight9,handles.weight10,...
            handles.weight11,handles.weight12,handles.weight13,handles.weight14,handles.weight15,...
            handles.weight16,handles.weight17,handles.weight18];
        set(display18,'Visible','on');
        age1 = num2str(round(group(1)));age2 = num2str(round(group(2)));
        age3 = num2str(round(group(3)));age4 = num2str(round(group(4)));
        age5 = num2str(round(group(5)));age6 = num2str(round(group(6)));
        age7 = num2str(round(group(7)));age8 = num2str(round(group(8)));
        age9 = num2str(round(group(9)));age10 = num2str(round(group(10)));
        age11 = num2str(round(group(11)));age12 = num2str(round(group(12)));
        age13 = num2str(round(group(13)));age14 = num2str(round(group(14)));
        age15 = num2str(round(group(15)));age16 = num2str(round(group(16)));
        age17 = num2str(round(group(17)));age18 = num2str(round(group(18)));
        set(handles.age1,'String',age1);set(handles.age2,'String',age2);
        set(handles.age3,'String',age3);set(handles.age4,'String',age4);
        set(handles.age5,'String',age5);set(handles.age6,'String',age6);
        set(handles.age7,'String',age7);set(handles.age8,'String',age8);
        set(handles.age9,'String',age9);set(handles.age10,'String',age10);
        set(handles.age11,'String',age11);set(handles.age12,'String',age12);
        set(handles.age13,'String',age13);set(handles.age14,'String',age14);
        set(handles.age15,'String',age15);set(handles.age16,'String',age16);
        set(handles.age17,'String',age17);set(handles.age18,'String',age18);
        w1 = num2str(round(weight(1),2),'%.2f');w2 = num2str(round(weight(2),2),'%.2f');
        w3 = num2str(round(weight(3),2),'%.2f');w4 = num2str(round(weight(4),2),'%.2f');
        w5 = num2str(round(weight(5),2),'%.2f');w6 = num2str(round(weight(6),2),'%.2f');
        w7 = num2str(round(weight(7),2),'%.2f');w8 = num2str(round(weight(8),2),'%.2f');
        w9 = num2str(round(weight(9),2),'%.2f');w10 = num2str(round(weight(10),2),'%.2f');
        w11 = num2str(round(weight(11),2),'%.2f');w12 = num2str(round(weight(12),2),'%.2f');
        w13 = num2str(round(weight(13),2),'%.2f');w14 = num2str(round(weight(14),2),'%.2f');
        w15 = num2str(round(weight(15),2),'%.2f');w16 = num2str(round(weight(16),2),'%.2f');
        w17 = num2str(round(weight(17),2),'%.2f');w18 = num2str(round(weight(18),2),'%.2f');
        set(handles.weight1,'String',w1);set(handles.weight2,'String',w2);
        set(handles.weight3,'String',w3);set(handles.weight4,'String',w4);
        set(handles.weight5,'String',w5);set(handles.weight6,'String',w6);
        set(handles.weight7,'String',w7);set(handles.weight8,'String',w8);
        set(handles.weight9,'String',w9);set(handles.weight10,'String',w10);
        set(handles.weight11,'String',w11);set(handles.weight12,'String',w12);
        set(handles.weight13,'String',w13);set(handles.weight14,'String',w14);
        set(handles.weight15,'String',w15);set(handles.weight16,'String',w16);
        set(handles.weight17,'String',w17);set(handles.weight18,'String',w18);
        s1 = num2str(round(sigma(1),2),'%.2f');s2 = num2str(round(sigma(2),2),'%.2f');
        s3 = num2str(round(sigma(3),2),'%.2f');s4 = num2str(round(sigma(4),2),'%.2f');
        s5 = num2str(round(sigma(5),2),'%.2f');s6 = num2str(round(sigma(6),2),'%.2f');
        s7 = num2str(round(sigma(7),2),'%.2f');s8 = num2str(round(sigma(8),2),'%.2f');
        s9 = num2str(round(sigma(9),2),'%.2f');s10 = num2str(round(sigma(10),2),'%.2f');
        s11 = num2str(round(sigma(11),2),'%.2f');s12 = num2str(round(sigma(12),2),'%.2f');
        s13 = num2str(round(sigma(13),2),'%.2f');s14 = num2str(round(sigma(14),2),'%.2f');
        s15 = num2str(round(sigma(15),2),'%.2f');s16 = num2str(round(sigma(16),2),'%.2f');
        s17 = num2str(round(sigma(17),2),'%.2f');s18 = num2str(round(sigma(18),2),'%.2f');
        set(handles.sigma1,'String',s1);set(handles.sigma2,'String',s2);
        set(handles.sigma3,'String',s3);set(handles.sigma4,'String',s4);
        set(handles.sigma5,'String',s5);set(handles.sigma6,'String',s6);
        set(handles.sigma7,'String',s7);set(handles.sigma8,'String',s8);
        set(handles.sigma9,'String',s9);set(handles.sigma10,'String',s10);
        set(handles.sigma11,'String',s11);set(handles.sigma12,'String',s12);
        set(handles.sigma13,'String',s13);set(handles.sigma14,'String',s14);
        set(handles.sigma15,'String',s15);set(handles.sigma16,'String',s16);
        set(handles.sigma17,'String',s17);set(handles.sigma18,'String',s18);
        bic = num2str(round(BIC,2),'%.2f');
        set(handles.BICtext,'String',bic);
    elseif TempAge == 19
        display19 = [handles.age1,handles.age2,handles.age3,handles.age4,handles.age5,...
            handles.age6,handles.age7,handles.age8,handles.age9,handles.age10,...
            handles.age11,handles.age12,handles.age13,handles.age14,handles.age15,...
            handles.age16,handles.age17,handles.age18,handles.age19, handles.sigma1,...
            handles.sigma2,handles.sigma3,handles.sigma4,handles.sigma5,handles.sigma6,...
            handles.sigma7,handles.sigma8,handles.sigma9,handles.sigma10,handles.sigma11,...
            handles.sigma12,handles.sigma13,handles.sigma14,handles.sigma15,handles.sigma16,...
            handles.sigma17,handles.sigma18,handles.sigma19,handles.weight1,handles.weight2,...
            handles.weight3,handles.weight4,handles.weight5,handles.weight6,handles.weight7,...
            handles.weight8,handles.weight9,handles.weight10,handles.weight11,handles.weight12,...
            handles.weight13,handles.weight14,handles.weight15,handles.weight16,handles.weight17,...
            handles.weight18,handles.weight19];
        set(display19,'Visible','on');
        age1 = num2str(round(group(1)));age2 = num2str(round(group(2)));
        age3 = num2str(round(group(3)));age4 = num2str(round(group(4)));
        age5 = num2str(round(group(5)));age6 = num2str(round(group(6)));
        age7 = num2str(round(group(7)));age8 = num2str(round(group(8)));
        age9 = num2str(round(group(9)));age10 = num2str(round(group(10)));
        age11 = num2str(round(group(11)));age12 = num2str(round(group(12)));
        age13 = num2str(round(group(13)));age14 = num2str(round(group(14)));
        age15 = num2str(round(group(15)));age16 = num2str(round(group(16)));
        age17 = num2str(round(group(17)));age18 = num2str(round(group(18)));
        age19 = num2str(round(group(19)));
        set(handles.age1,'String',age1);set(handles.age2,'String',age2);
        set(handles.age3,'String',age3);set(handles.age4,'String',age4);
        set(handles.age5,'String',age5);set(handles.age6,'String',age6);
        set(handles.age7,'String',age7);set(handles.age8,'String',age8);
        set(handles.age9,'String',age9);set(handles.age10,'String',age10);
        set(handles.age11,'String',age11);set(handles.age12,'String',age12);
        set(handles.age13,'String',age13);set(handles.age14,'String',age14);
        set(handles.age15,'String',age15);set(handles.age16,'String',age16);
        set(handles.age17,'String',age17);set(handles.age18,'String',age18);
        set(handles.age19,'String',age19);
        w1 = num2str(round(weight(1),2),'%.2f');w2 = num2str(round(weight(2),2),'%.2f');
        w3 = num2str(round(weight(3),2),'%.2f');w4 = num2str(round(weight(4),2),'%.2f');
        w5 = num2str(round(weight(5),2),'%.2f');w6 = num2str(round(weight(6),2),'%.2f');
        w7 = num2str(round(weight(7),2),'%.2f');w8 = num2str(round(weight(8),2),'%.2f');
        w9 = num2str(round(weight(9),2),'%.2f');w10 = num2str(round(weight(10),2),'%.2f');
        w11 = num2str(round(weight(11),2),'%.2f');w12 = num2str(round(weight(12),2),'%.2f');
        w13 = num2str(round(weight(13),2),'%.2f');w14 = num2str(round(weight(14),2),'%.2f');
        w15 = num2str(round(weight(15),2),'%.2f');w16 = num2str(round(weight(16),2),'%.2f');
        w17 = num2str(round(weight(17),2),'%.2f');w18 = num2str(round(weight(18),2),'%.2f');
        w19 = num2str(round(weight(19),2),'%.2f');
        set(handles.weight1,'String',w1);set(handles.weight2,'String',w2);
        set(handles.weight3,'String',w3);set(handles.weight4,'String',w4);
        set(handles.weight5,'String',w5);set(handles.weight6,'String',w6);
        set(handles.weight7,'String',w7);set(handles.weight8,'String',w8);
        set(handles.weight9,'String',w9);set(handles.weight10,'String',w10);
        set(handles.weight11,'String',w11);set(handles.weight12,'String',w12);
        set(handles.weight13,'String',w13);set(handles.weight14,'String',w14);
        set(handles.weight15,'String',w15);set(handles.weight16,'String',w16);
        set(handles.weight17,'String',w17);set(handles.weight18,'String',w18);
        set(handles.weight19,'String',w19);
        s1 = num2str(round(sigma(1),2),'%.2f');s2 = num2str(round(sigma(2),2),'%.2f');
        s3 = num2str(round(sigma(3),2),'%.2f');s4 = num2str(round(sigma(4),2),'%.2f');
        s5 = num2str(round(sigma(5),2),'%.2f');s6 = num2str(round(sigma(6),2),'%.2f');
        s7 = num2str(round(sigma(7),2),'%.2f');s8 = num2str(round(sigma(8),2),'%.2f');
        s9 = num2str(round(sigma(9),2),'%.2f');s10 = num2str(round(sigma(10),2),'%.2f');
        s11 = num2str(round(sigma(11),2),'%.2f');s12 = num2str(round(sigma(12),2),'%.2f');
        s13 = num2str(round(sigma(13),2),'%.2f');s14 = num2str(round(sigma(14),2),'%.2f');
        s15 = num2str(round(sigma(15),2),'%.2f');s16 = num2str(round(sigma(16),2),'%.2f');
        s17 = num2str(round(sigma(17),2),'%.2f');s18 = num2str(round(sigma(18),2),'%.2f');
        s19 = num2str(round(sigma(19),2),'%.2f');
        set(handles.sigma1,'String',s1);set(handles.sigma2,'String',s2);
        set(handles.sigma3,'String',s3);set(handles.sigma4,'String',s4);
        set(handles.sigma5,'String',s5);set(handles.sigma6,'String',s6);
        set(handles.sigma7,'String',s7);set(handles.sigma8,'String',s8);
        set(handles.sigma9,'String',s9);set(handles.sigma10,'String',s10);
        set(handles.sigma11,'String',s11);set(handles.sigma12,'String',s12);
        set(handles.sigma13,'String',s13);set(handles.sigma14,'String',s14);
        set(handles.sigma15,'String',s15);set(handles.sigma16,'String',s16);
        set(handles.sigma17,'String',s17);set(handles.sigma18,'String',s18);
        set(handles.sigma19,'String',s19);
        bic = num2str(round(BIC,2),'%.2f');
        set(handles.BICtext,'String',bic);
    elseif TempAge == 20
        display20 = [handles.age1,handles.age2,handles.age3,handles.age4,handles.age5,...
            handles.age6,handles.age7,handles.age8,handles.age9,handles.age10,...
            handles.age11,handles.age12,handles.age13,handles.age14, handles.age15,...
            handles.age16,handles.age17,handles.age18,handles.age19,handles.age20...
            handles.sigma1,handles.sigma2,handles.sigma3,handles.sigma4,handles.sigma5,...
            handles.sigma6,handles.sigma7,handles.sigma8,handles.sigma9,handles.sigma10,...
            handles.sigma11,handles.sigma12,handles.sigma13,handles.sigma14,handles.sigma15,...
            handles.sigma16,handles.sigma17,handles.sigma18,handles.sigma19,handles.sigma20,...
            handles.weight1,handles.weight2,handles.weight3,handles.weight4,handles.weight5,...
            handles.weight6,handles.weight7,handles.weight8,handles.weight9,handles.weight10,...
            handles.weight11,handles.weight12,handles.weight13,handles.weight14,handles.weight15,...
            handles.weight16,handles.weight17,handles.weight18,handles.weight19,handles.weight20];
        set(display20,'Visible','on');
        age1 = num2str(round(group(1)));age2 = num2str(round(group(2)));
        age3 = num2str(round(group(3)));age4 = num2str(round(group(4)));
        age5 = num2str(round(group(5)));age6 = num2str(round(group(6)));
        age7 = num2str(round(group(7)));age8 = num2str(round(group(8)));
        age9 = num2str(round(group(9)));age10 = num2str(round(group(10)));
        age11 = num2str(round(group(11)));age12 = num2str(round(group(12)));
        age13 = num2str(round(group(13)));age14 = num2str(round(group(14)));
        age15 = num2str(round(group(15)));age16 = num2str(round(group(16)));
        age17 = num2str(round(group(17)));age18 = num2str(round(group(18)));
        age19 = num2str(round(group(19)));age20 = num2str(round(group(20)));
        set(handles.age1,'String',age1);set(handles.age2,'String',age2);
        set(handles.age3,'String',age3);set(handles.age4,'String',age4);
        set(handles.age5,'String',age5);set(handles.age6,'String',age6);
        set(handles.age7,'String',age7);set(handles.age8,'String',age8);
        set(handles.age9,'String',age9);set(handles.age10,'String',age10);
        set(handles.age11,'String',age11);set(handles.age12,'String',age12);
        set(handles.age13,'String',age13);set(handles.age14,'String',age14);
        set(handles.age15,'String',age15);set(handles.age16,'String',age16);
        set(handles.age17,'String',age17);set(handles.age18,'String',age18);
        set(handles.age19,'String',age19);set(handles.age20,'String',age20);
        w1 = num2str(round(weight(1),2),'%.2f');w2 = num2str(round(weight(2),2),'%.2f');
        w3 = num2str(round(weight(3),2),'%.2f');w4 = num2str(round(weight(4),2),'%.2f');
        w5 = num2str(round(weight(5),2),'%.2f');w6 = num2str(round(weight(6),2),'%.2f');
        w7 = num2str(round(weight(7),2),'%.2f');w8 = num2str(round(weight(8),2),'%.2f');
        w9 = num2str(round(weight(9),2),'%.2f');w10 = num2str(round(weight(10),2),'%.2f');
        w11 = num2str(round(weight(11),2),'%.2f');w12 = num2str(round(weight(12),2),'%.2f');
        w13 = num2str(round(weight(13),2),'%.2f');w14 = num2str(round(weight(14),2),'%.2f');
        w15 = num2str(round(weight(15),2),'%.2f');w16 = num2str(round(weight(16),2),'%.2f');
        w17 = num2str(round(weight(17),2),'%.2f');w18 = num2str(round(weight(18),2),'%.2f');
        w19 = num2str(round(weight(19),2),'%.2f');w20 = num2str(round(weight(20),2),'%.2f');
        set(handles.weight1,'String',w1);set(handles.weight2,'String',w2);
        set(handles.weight3,'String',w3);set(handles.weight4,'String',w4);
        set(handles.weight5,'String',w5);set(handles.weight6,'String',w6);
        set(handles.weight7,'String',w7);set(handles.weight8,'String',w8);
        set(handles.weight9,'String',w9);set(handles.weight10,'String',w10);
        set(handles.weight11,'String',w11);set(handles.weight12,'String',w12);
        set(handles.weight13,'String',w13);set(handles.weight14,'String',w14);
        set(handles.weight15,'String',w15);set(handles.weight16,'String',w16);
        set(handles.weight17,'String',w17);set(handles.weight18,'String',w18);
        set(handles.weight19,'String',w19);set(handles.weight20,'String',w20);
        s1 = num2str(round(sigma(1),2),'%.2f');s2 = num2str(round(sigma(2),2),'%.2f');
        s3 = num2str(round(sigma(3),2),'%.2f');s4 = num2str(round(sigma(4),2),'%.2f');
        s5 = num2str(round(sigma(5),2),'%.2f');s6 = num2str(round(sigma(6),2),'%.2f');
        s7 = num2str(round(sigma(7),2),'%.2f');s8 = num2str(round(sigma(8),2),'%.2f');
        s9 = num2str(round(sigma(9),2),'%.2f');s10 = num2str(round(sigma(10),2),'%.2f');
        s11 = num2str(round(sigma(11),2),'%.2f');s12 = num2str(round(sigma(12),2),'%.2f');
        s13 = num2str(round(sigma(13),2),'%.2f');s14 = num2str(round(sigma(14),2),'%.2f');
        s15 = num2str(round(sigma(15),2),'%.2f');s16 = num2str(round(sigma(16),2),'%.2f');
        s17 = num2str(round(sigma(17),2),'%.2f');s18 = num2str(round(sigma(18),2),'%.2f');
        s19 = num2str(round(sigma(19),2),'%.2f');s20 = num2str(round(sigma(20),2),'%.2f');
        set(handles.sigma1,'String',s1);set(handles.sigma2,'String',s2);
        set(handles.sigma3,'String',s3);set(handles.sigma4,'String',s4);
        set(handles.sigma5,'String',s5);set(handles.sigma6,'String',s6);
        set(handles.sigma7,'String',s7);set(handles.sigma8,'String',s8);
        set(handles.sigma9,'String',s9);set(handles.sigma10,'String',s10);
        set(handles.sigma11,'String',s11);set(handles.sigma12,'String',s12);
        set(handles.sigma13,'String',s13);set(handles.sigma14,'String',s14);
        set(handles.sigma15,'String',s15);set(handles.sigma16,'String',s16);
        set(handles.sigma17,'String',s17);set(handles.sigma18,'String',s18);
        set(handles.sigma19,'String',s19);set(handles.sigma20,'String',s20);
        bic = num2str(round(BIC,2),'%.2f');
        set(handles.BICtext,'String',bic);
    end
end


% --------------------------------------------------------------------
function plotmixture_Callback(hObject, eventdata, handles)
% hObject    handle to plotmixture (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
try
    group = evalin('base','EMage');
    weight= evalin('base','EMweight');
    sigma = evalin('base','EMsigma');
    x = 1:4000;
    if length(weight) == 2
        qx = @(x) weight(1) .* normpdf(x,group(1),sigma(1))...
            + weight(2) .* normpdf(x,group(2),sigma(2));
        pdf = qx(x);
        figure('name','EM PDF');
        plot(x,pdf);
    elseif length(weight) == 3
        qx = @(x) weight(1) .* normpdf(x,group(1),sigma(1))...
            + weight(2) .* normpdf(x,group(2),sigma(2))...
            + weight(3) .* normpdf(x,group(3),sigma(3));
        pdf = qx(x);
        figure('name','EM PDF');
        plot(x,pdf);
    elseif length(weight) == 4
        qx = @(x) weight(1) .* normpdf(x,group(1),sigma(1))...
            + weight(2) .* normpdf(x,group(2),sigma(2))...
            + weight(3) .* normpdf(x,group(3),sigma(3))...
            + weight(4) .* normpdf(x,group(4),sigma(4));
        pdf = qx(x);
        figure('name','EM PDF');
        plot(x,pdf);
    elseif length(weight) == 5
        qx = @(x) weight(1) .* normpdf(x,group(1),sigma(1))...
            + weight(2) .* normpdf(x,group(2),sigma(2))...
            + weight(3) .* normpdf(x,group(3),sigma(3))...
            + weight(4) .* normpdf(x,group(4),sigma(4))...
            + weight(5) .* normpdf(x,group(5),sigma(5));
        pdf = qx(x);
        figure('name','EM PDF');
        plot(x,pdf);
    elseif length(weight) == 6
        qx = @(x) weight(1) .* normpdf(x,group(1),sigma(1))...
            + weight(2) .* normpdf(x,group(2),sigma(2))...
            + weight(3) .* normpdf(x,group(3),sigma(3))...
            + weight(4) .* normpdf(x,group(4),sigma(4))...
            + weight(5) .* normpdf(x,group(5),sigma(5))...
            + weight(6) .* normpdf(x,group(6),sigma(6));
        pdf = qx(x);
        figure('name','EM PDF');
        plot(x,pdf);
    elseif length(weight) == 7
        qx = @(x) weight(1) .* normpdf(x,group(1),sigma(1))...
            + weight(2) .* normpdf(x,group(2),sigma(2))...
            + weight(3) .* normpdf(x,group(3),sigma(3))...
            + weight(4) .* normpdf(x,group(4),sigma(4))...
            + weight(5) .* normpdf(x,group(5),sigma(5))...
            + weight(6) .* normpdf(x,group(6),sigma(6))...
            + weight(7) .* normpdf(x,group(7),sigma(7));
        pdf = qx(x);
        figure('name','EM PDF');
        plot(x,pdf);
    elseif length(weight) == 8
        qx = @(x) weight(1) .* normpdf(x,group(1),sigma(1))...
            + weight(2) .* normpdf(x,group(2),sigma(2))...
            + weight(3) .* normpdf(x,group(3),sigma(3))...
            + weight(4) .* normpdf(x,group(4),sigma(4))...
            + weight(5) .* normpdf(x,group(5),sigma(5))...
            + weight(6) .* normpdf(x,group(6),sigma(6))...
            + weight(7) .* normpdf(x,group(7),sigma(7))...
            + weight(8) .* normpdf(x,group(8),sigma(8));
        pdf = qx(x);
        figure('name','EM PDF');
        plot(x,pdf);
    elseif length(weight) == 9
        qx = @(x) weight(1) .* normpdf(x,group(1),sigma(1))...
            + weight(2) .* normpdf(x,group(2),sigma(2))...
            + weight(3) .* normpdf(x,group(3),sigma(3))...
            + weight(4) .* normpdf(x,group(4),sigma(4))...
            + weight(5) .* normpdf(x,group(5),sigma(5))...
            + weight(6) .* normpdf(x,group(6),sigma(6))...
            + weight(7) .* normpdf(x,group(7),sigma(7))...
            + weight(8) .* normpdf(x,group(8),sigma(8))...
            + weight(9) .* normpdf(x,group(9),sigma(9));
        pdf = qx(x);
        figure('name','EM PDF');
        plot(x,pdf);
    elseif length(weight) == 10
        qx = @(x) weight(1) .* normpdf(x,group(1),sigma(1))...
            + weight(2) .* normpdf(x,group(2),sigma(2))...
            + weight(3) .* normpdf(x,group(3),sigma(3))...
            + weight(4) .* normpdf(x,group(4),sigma(4))...
            + weight(5) .* normpdf(x,group(5),sigma(5))...
            + weight(6) .* normpdf(x,group(6),sigma(6))...
            + weight(7) .* normpdf(x,group(7),sigma(7))...
            + weight(8) .* normpdf(x,group(8),sigma(8))...
            + weight(9) .* normpdf(x,group(9),sigma(9))...
            + weight(10) .* normpdf(x,group(10),sigma(10));
        pdf = qx(x);
        figure('name','EM PDF');
        plot(x,pdf);
    elseif length(weight) == 11
        qx = @(x) weight(1) .* normpdf(x,group(1),sigma(1))...
            + weight(2) .* normpdf(x,group(2),sigma(2))...
            + weight(3) .* normpdf(x,group(3),sigma(3))...
            + weight(4) .* normpdf(x,group(4),sigma(4))...
            + weight(5) .* normpdf(x,group(5),sigma(5))...
            + weight(6) .* normpdf(x,group(6),sigma(6))...
            + weight(7) .* normpdf(x,group(7),sigma(7))...
            + weight(8) .* normpdf(x,group(8),sigma(8))...
            + weight(9) .* normpdf(x,group(9),sigma(9))...
            + weight(10) .* normpdf(x,group(10),sigma(10))...
            + weight(11) .* normpdf(x,group(11),sigma(11));
        pdf = qx(x);
        figure('name','EM PDF');
        plot(x,pdf);
    elseif length(weight) == 12
        qx = @(x) weight(1) .* normpdf(x,group(1),sigma(1))...
            + weight(2) .* normpdf(x,group(2),sigma(2))...
            + weight(3) .* normpdf(x,group(3),sigma(3))...
            + weight(4) .* normpdf(x,group(4),sigma(4))...
            + weight(5) .* normpdf(x,group(5),sigma(5))...
            + weight(6) .* normpdf(x,group(6),sigma(6))...
            + weight(7) .* normpdf(x,group(7),sigma(7))...
            + weight(8) .* normpdf(x,group(8),sigma(8))...
            + weight(9) .* normpdf(x,group(9),sigma(9))...
            + weight(10) .* normpdf(x,group(10),sigma(10))...
            + weight(11) .* normpdf(x,group(11),sigma(11))...
            + weight(12) .* normpdf(x,group(12),sigma(12));
        pdf = qx(x);
        figure('name','EM PDF');
        plot(x,pdf);
    elseif length(weight) == 13
        qx = @(x) weight(1) .* normpdf(x,group(1),sigma(1))...
            + weight(2) .* normpdf(x,group(2),sigma(2))...
            + weight(3) .* normpdf(x,group(3),sigma(3))...
            + weight(4) .* normpdf(x,group(4),sigma(4))...
            + weight(5) .* normpdf(x,group(5),sigma(5))...
            + weight(6) .* normpdf(x,group(6),sigma(6))...
            + weight(7) .* normpdf(x,group(7),sigma(7))...
            + weight(8) .* normpdf(x,group(8),sigma(8))...
            + weight(9) .* normpdf(x,group(9),sigma(9))...
            + weight(10) .* normpdf(x,group(10),sigma(10))...
            + weight(11) .* normpdf(x,group(11),sigma(11))...
            + weight(12) .* normpdf(x,group(12),sigma(12))...
            + weight(13) .* normpdf(x,group(13),sigma(13));
        pdf = qx(x);
        figure('name','EM PDF');
        plot(x,pdf);
    elseif length(weight) == 14
        qx = @(x) weight(1) .* normpdf(x,group(1),sigma(1))...
            + weight(2) .* normpdf(x,group(2),sigma(2))...
            + weight(3) .* normpdf(x,group(3),sigma(3))...
            + weight(4) .* normpdf(x,group(4),sigma(4))...
            + weight(5) .* normpdf(x,group(5),sigma(5))...
            + weight(6) .* normpdf(x,group(6),sigma(6))...
            + weight(7) .* normpdf(x,group(7),sigma(7))...
            + weight(8) .* normpdf(x,group(8),sigma(8))...
            + weight(9) .* normpdf(x,group(9),sigma(9))...
            + weight(10) .* normpdf(x,group(10),sigma(10))...
            + weight(11) .* normpdf(x,group(11),sigma(11))...
            + weight(12) .* normpdf(x,group(12),sigma(12))...
            + weight(13) .* normpdf(x,group(13),sigma(13))...
            + weight(14) .* normpdf(x,group(14),sigma(14));
        pdf = qx(x);
        figure('name','EM PDF');
        plot(x,pdf);
    elseif length(weight) == 15
        qx = @(x) weight(1) .* normpdf(x,group(1),sigma(1))...
            + weight(2) .* normpdf(x,group(2),sigma(2))...
            + weight(3) .* normpdf(x,group(3),sigma(3))...
            + weight(4) .* normpdf(x,group(4),sigma(4))...
            + weight(5) .* normpdf(x,group(5),sigma(5))...
            + weight(6) .* normpdf(x,group(6),sigma(6))...
            + weight(7) .* normpdf(x,group(7),sigma(7))...
            + weight(8) .* normpdf(x,group(8),sigma(8))...
            + weight(9) .* normpdf(x,group(9),sigma(9))...
            + weight(10) .* normpdf(x,group(10),sigma(10))...
            + weight(11) .* normpdf(x,group(11),sigma(11))...
            + weight(12) .* normpdf(x,group(12),sigma(12))...
            + weight(13) .* normpdf(x,group(13),sigma(13))...
            + weight(14) .* normpdf(x,group(14),sigma(14))...
            + weight(15) .* normpdf(x,group(15),sigma(15));
        pdf = qx(x);
        figure('name','EM PDF');
        plot(x,pdf);
    elseif length(weight) == 16
        qx = @(x) weight(1) .* normpdf(x,group(1),sigma(1))...
            + weight(2) .* normpdf(x,group(2),sigma(2))...
            + weight(3) .* normpdf(x,group(3),sigma(3))...
            + weight(4) .* normpdf(x,group(4),sigma(4))...
            + weight(5) .* normpdf(x,group(5),sigma(5))...
            + weight(6) .* normpdf(x,group(6),sigma(6))...
            + weight(7) .* normpdf(x,group(7),sigma(7))...
            + weight(8) .* normpdf(x,group(8),sigma(8))...
            + weight(9) .* normpdf(x,group(9),sigma(9))...
            + weight(10) .* normpdf(x,group(10),sigma(10))...
            + weight(11) .* normpdf(x,group(11),sigma(11))...
            + weight(12) .* normpdf(x,group(12),sigma(12))...
            + weight(13) .* normpdf(x,group(13),sigma(13))...
            + weight(14) .* normpdf(x,group(14),sigma(14))...
            + weight(15) .* normpdf(x,group(15),sigma(15))...
            + weight(16) .* normpdf(x,group(16),sigma(16));
        pdf = qx(x);
        figure('name','EM PDF');
        plot(x,pdf);
    elseif length(weight) == 17
        qx = @(x) weight(1) .* normpdf(x,group(1),sigma(1))...
            + weight(2) .* normpdf(x,group(2),sigma(2))...
            + weight(3) .* normpdf(x,group(3),sigma(3))...
            + weight(4) .* normpdf(x,group(4),sigma(4))...
            + weight(5) .* normpdf(x,group(5),sigma(5))...
            + weight(6) .* normpdf(x,group(6),sigma(6))...
            + weight(7) .* normpdf(x,group(7),sigma(7))...
            + weight(8) .* normpdf(x,group(8),sigma(8))...
            + weight(9) .* normpdf(x,group(9),sigma(9))...
            + weight(10) .* normpdf(x,group(10),sigma(10))...
            + weight(11) .* normpdf(x,group(11),sigma(11))...
            + weight(12) .* normpdf(x,group(12),sigma(12))...
            + weight(13) .* normpdf(x,group(13),sigma(13))...
            + weight(14) .* normpdf(x,group(14),sigma(14))...
            + weight(15) .* normpdf(x,group(15),sigma(15))...
            + weight(16) .* normpdf(x,group(16),sigma(16))...
            + weight(17) .* normpdf(x,group(17),sigma(17));
        pdf = qx(x);
        figure('name','EM PDF');
        plot(x,pdf);
    elseif length(weight) == 18
        qx = @(x) weight(1) .* normpdf(x,group(1),sigma(1))...
            + weight(2) .* normpdf(x,group(2),sigma(2))...
            + weight(3) .* normpdf(x,group(3),sigma(3))...
            + weight(4) .* normpdf(x,group(4),sigma(4))...
            + weight(5) .* normpdf(x,group(5),sigma(5))...
            + weight(6) .* normpdf(x,group(6),sigma(6))...
            + weight(7) .* normpdf(x,group(7),sigma(7))...
            + weight(8) .* normpdf(x,group(8),sigma(8))...
            + weight(9) .* normpdf(x,group(9),sigma(9))...
            + weight(10) .* normpdf(x,group(10),sigma(10))...
            + weight(11) .* normpdf(x,group(11),sigma(11))...
            + weight(12) .* normpdf(x,group(12),sigma(12))...
            + weight(13) .* normpdf(x,group(13),sigma(13))...
            + weight(14) .* normpdf(x,group(14),sigma(14))...
            + weight(15) .* normpdf(x,group(15),sigma(15))...
            + weight(16) .* normpdf(x,group(16),sigma(16))...
            + weight(17) .* normpdf(x,group(17),sigma(17))...
            + weight(18) .* normpdf(x,group(18),sigma(18));
        pdf = qx(x);
        figure('name','EM PDF');
        plot(x,pdf);
    elseif length(weight) == 19
        qx = @(x) weight(1) .* normpdf(x,group(1),sigma(1))...
            + weight(2) .* normpdf(x,group(2),sigma(2))...
            + weight(3) .* normpdf(x,group(3),sigma(3))...
            + weight(4) .* normpdf(x,group(4),sigma(4))...
            + weight(5) .* normpdf(x,group(5),sigma(5))...
            + weight(6) .* normpdf(x,group(6),sigma(6))...
            + weight(7) .* normpdf(x,group(7),sigma(7))...
            + weight(8) .* normpdf(x,group(8),sigma(8))...
            + weight(9) .* normpdf(x,group(9),sigma(9))...
            + weight(10) .* normpdf(x,group(10),sigma(10))...
            + weight(11) .* normpdf(x,group(11),sigma(11))...
            + weight(12) .* normpdf(x,group(12),sigma(12))...
            + weight(13) .* normpdf(x,group(13),sigma(13))...
            + weight(14) .* normpdf(x,group(14),sigma(14))...
            + weight(15) .* normpdf(x,group(15),sigma(15))...
            + weight(16) .* normpdf(x,group(16),sigma(16))...
            + weight(17) .* normpdf(x,group(17),sigma(17))...
            + weight(18) .* normpdf(x,group(18),sigma(18))...
            + weight(19) .* normpdf(x,group(19),sigma(19));
        pdf = qx(x);
        figure('name','EM PDF');
        plot(x,pdf);
    elseif length(weight) == 20
        qx = @(x) weight(1) .* normpdf(x,group(1),sigma(1))...
            + weight(2) .* normpdf(x,group(2),sigma(2))...
            + weight(3) .* normpdf(x,group(3),sigma(3))...
            + weight(4) .* normpdf(x,group(4),sigma(4))...
            + weight(5) .* normpdf(x,group(5),sigma(5))...
            + weight(6) .* normpdf(x,group(6),sigma(6))...
            + weight(7) .* normpdf(x,group(7),sigma(7))...
            + weight(8) .* normpdf(x,group(8),sigma(8))...
            + weight(9) .* normpdf(x,group(9),sigma(9))...
            + weight(10) .* normpdf(x,group(10),sigma(10))...
            + weight(11) .* normpdf(x,group(11),sigma(11))...
            + weight(12) .* normpdf(x,group(12),sigma(12))...
            + weight(13) .* normpdf(x,group(13),sigma(13))...
            + weight(14) .* normpdf(x,group(14),sigma(14))...
            + weight(15) .* normpdf(x,group(15),sigma(15))...
            + weight(16) .* normpdf(x,group(16),sigma(16))...
            + weight(17) .* normpdf(x,group(17),sigma(17))...
            + weight(18) .* normpdf(x,group(18),sigma(18))...
            + weight(19) .* normpdf(x,group(19),sigma(19))...
            + weight(20) .* normpdf(x,group(20),sigma(20));
        pdf = qx(x);
        figure('name','EM PDF');
        plot(x,pdf);
    end
end


% --------------------------------------------------------------------
function confidenceEllipse_Callback(hObject, eventdata, handles)
% hObject    handle to confidenceEllipse (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

try
    mydata = evalin('base','Data');
    group = evalin('base','EMage');
    weight= evalin('base','EMweight');
    sigma = evalin('base','EMsigma');
    if length(group) == 2
        run('confidence_ellipse.m');
        %open('confidence_ellipse.fig');
        cehandles = guihandles;
        xs2 = [cehandles.g2axes1,cehandles.g2axes2];
        set(xs2,'Visible','on');
        
        [sigmaage,sigmaall] = confidence2KDE1(mydata,weight,group,sigma);
        
        axes(cehandles.g2axes1);
        set(gca,'linewidth',0.7,'TickLength',[0.035,0.025]);
        elipse1(group(1),weight(1),sigmaall(1:2,1:2),2,1);
        axes(cehandles.g2axes2);
        set(gca,'linewidth',0.7,'TickLength',[0.035,0.025]);
        elipse1(group(2),weight(2),sigmaall(3:4,3:4),2,1);
        
    elseif length(group) == 3
        %figure('Name','Confidence Ellipse','NumberTitle','off')
        %open('confidence_ellipse.fig');
        run('confidence_ellipse.m');
        cehandles = guihandles;
        xs3 = [cehandles.g3axes1,cehandles.g3axes2,cehandles.g3axes3];
        set(xs3,'Visible','on');
        [sigmaage,sigmaall] = confidence3KDE1(mydata,weight,group,sigma);
        
        axes(cehandles.g3axes1);
        set(gca,'linewidth',0.7,'TickLength',[0.035,0.025]);
        elipse1(group(1),weight(1),sigmaall(1:2,1:2),2,1);
        axes(cehandles.g3axes2);
        set(gca,'linewidth',0.7,'TickLength',[0.035,0.025]);
        elipse1(group(2),weight(2),sigmaall(3:4,3:4),2,1);
        axes(cehandles.g3axes3);
        set(gca,'linewidth',0.7,'TickLength',[0.035,0.025]);
        elipse1(group(3),weight(3),sigmaall(5:6,5:6),2,1);
        
    elseif length(group) == 4
        %open('confidence_ellipse.fig');
        run('confidence_ellipse.m');
        cehandles = guihandles;
        xs4 = [cehandles.g4axes1,cehandles.g4axes2,cehandles.g4axes3,cehandles.g4axes4];
        set(xs4,'Visible','on');
        [sigmaage,sigmaall] = confidence4KDE1(mydata,weight,group,sigma);
        
        axes(cehandles.g4axes1);
        set(gca,'linewidth',0.7,'TickLength',[0.035,0.025]);
        elipse1(group(1),weight(1),sigmaall(1:2,1:2),2,1);
        axes(cehandles.g4axes2);
        set(gca,'linewidth',0.7,'TickLength',[0.035,0.025]);
        elipse1(group(2),weight(2),sigmaall(3:4,3:4),2,1);
        axes(cehandles.g4axes3);
        set(gca,'linewidth',0.7,'TickLength',[0.035,0.025]);
        elipse1(group(3),weight(3),sigmaall(5:6,5:6),2,1);
        axes(cehandles.g4axes4);
        set(gca,'linewidth',0.7,'TickLength',[0.035,0.025]);
        elipse1(group(4),weight(4),sigmaall(7:8,7:8),2,1);
        
    elseif length(group) == 5
        run('confidence2.m');
        %open('confidence2.fig');
        cehandles = guihandles;
        xs5 = [cehandles.g5axes1,cehandles.g5axes2,cehandles.g5axes3,cehandles.g5axes4,cehandles.g5axes5];
        [sigmaage,sigmaall] = confidence5KDE1(mydata,weight,group,sigma);
        set(xs5,'Visible','on');
        
        axes(cehandles.g5axes1);
        set(gca,'linewidth',0.7,'TickLength',[0.035,0.025]);
        elipse1(group(1),weight(1),sigmaall(1:2,1:2),2,1);
        axes(cehandles.g5axes2);
        set(gca,'linewidth',0.7,'TickLength',[0.035,0.025]);
        elipse1(group(2),weight(2),sigmaall(3:4,3:4),2,1);
        axes(cehandles.g5axes3);
        set(gca,'linewidth',0.7,'TickLength',[0.035,0.025]);
        elipse1(group(3),weight(3),sigmaall(5:6,5:6),2,1);
        axes(cehandles.g5axes4);
        set(gca,'linewidth',0.7,'TickLength',[0.035,0.025]);
        elipse1(group(4),weight(4),sigmaall(7:8,7:8),2,1);
        axes(cehandles.g5axes5);
        set(gca,'linewidth',0.7,'TickLength',[0.035,0.025]);
        elipse1(group(5),weight(5),sigmaall(9:10,9:10),2,1);
        
    elseif length(group) == 6
        run('confidence2.m')
        %open('confidence2.fig');
        cehandles = guihandles;
        xs6 = [cehandles.g6axes1,cehandles.g6axes2,cehandles.g6axes3,cehandles.g6axes4,cehandles.g6axes5,cehandles.g6axes6];
        
        set(xs6,'Visible','on');
        [sigmaage,sigmaall] = confidence6KDE1(mydata,weight,group,sigma);
        axes(cehandles.g6axes1);
        set(gca,'linewidth',0.7,'TickLength',[0.035,0.025]);
        elipse1(group(1),weight(1),sigmaall(1:2,1:2),2,1);
        axes(cehandles.g6axes2);
        set(gca,'linewidth',0.7,'TickLength',[0.035,0.025]);
        elipse1(group(2),weight(2),sigmaall(3:4,3:4),2,1);
        axes(cehandles.g6axes3);
        set(gca,'linewidth',0.7,'TickLength',[0.035,0.025]);
        elipse1(group(3),weight(3),sigmaall(5:6,5:6),2,1);
        axes(cehandles.g6axes4);
        set(gca,'linewidth',0.7,'TickLength',[0.035,0.025]);
        elipse1(group(4),weight(4),sigmaall(7:8,7:8),2,1);
        axes(cehandles.g6axes5);
        set(gca,'linewidth',0.7,'TickLength',[0.035,0.025]);
        elipse1(group(5),weight(5),sigmaall(9:10,9:10),2,1);
        axes(cehandles.g6axes6);
        set(gca,'linewidth',0.7,'TickLength',[0.035,0.025]);
        elipse1(group(6),weight(6),sigmaall(11:12,11:12),2,1);
        
    elseif length(group) == 7
        run('confidence2.m');
        %open('confidence2.fig');
        cehandles = guihandles;
        xs7 = [cehandles.g7axes1,cehandles.g7axes2,cehandles.g7axes3,cehandles.g7axes4,cehandles.g7axes5,...
            cehandles.g7axes6,cehandles.g7axes7];
        
        set(xs7,'Visible','on');
        [sigmaage,sigmaall] = confidence7KDE1(mydata,weight,group,sigma);
        axes(cehandles.g7axes1);
        set(gca,'linewidth',0.7,'TickLength',[0.035,0.025]);
        elipse1(group(1),weight(1),sigmaall(1:2,1:2),2,1);
        axes(cehandles.g7axes2);
        set(gca,'linewidth',0.7,'TickLength',[0.035,0.025]);
        elipse1(group(2),weight(2),sigmaall(3:4,3:4),2,1);
        axes(cehandles.g7axes3);
        set(gca,'linewidth',0.7,'TickLength',[0.035,0.025]);
        elipse1(group(3),weight(3),sigmaall(5:6,5:6),2,1);
        axes(cehandles.g7axes4);
        set(gca,'linewidth',0.7,'TickLength',[0.035,0.025]);
        elipse1(group(4),weight(4),sigmaall(7:8,7:8),2,1);
        axes(cehandles.g7axes5);
        set(gca,'linewidth',0.7,'TickLength',[0.035,0.025]);
        elipse1(group(5),weight(5),sigmaall(9:10,9:10),2,1);
        axes(cehandles.g7axes6);
        set(gca,'linewidth',0.7,'TickLength',[0.035,0.025]);
        elipse1(group(6),weight(6),sigmaall(11:12,11:12),2,1);
        axes(cehandles.g7axes7);
        set(gca,'linewidth',0.7,'TickLength',[0.035,0.025]);
        elipse1(group(7),weight(7),sigmaall(13:14,13:14),2,1);
        
    elseif length(group) == 8
        run('confidence2.m');
        %open('confidence2.fig');
        cehandles = guihandles;
        xs8 = [cehandles.g8axes1,cehandles.g8axes2,cehandles.g8axes3,cehandles.g8axes4,cehandles.g8axes5,...
            cehandles.g8axes6,cehandles.g8axes7,cehandles.g8axes8];
        
        set(xs8,'Visible','on');
        [sigmaage,sigmaall] = confidence8KDE1(mydata,weight,group,sigma);
        axes(cehandles.g8axes1);
        set(gca,'linewidth',0.7,'TickLength',[0.035,0.025]);
        elipse1(group(1),weight(1),sigmaall(1:2,1:2),2,1);
        axes(cehandles.g8axes2);
        set(gca,'linewidth',0.7,'TickLength',[0.035,0.025]);
        elipse1(group(2),weight(2),sigmaall(3:4,3:4),2,1);
        axes(cehandles.g8axes3);
        set(gca,'linewidth',0.7,'TickLength',[0.035,0.025]);
        elipse1(group(3),weight(3),sigmaall(5:6,5:6),2,1);
        axes(cehandles.g8axes4);
        set(gca,'linewidth',0.7,'TickLength',[0.035,0.025]);
        elipse1(group(4),weight(4),sigmaall(7:8,7:8),2,1);
        axes(cehandles.g8axes5);
        set(gca,'linewidth',0.7,'TickLength',[0.035,0.025]);
        elipse1(group(5),weight(5),sigmaall(9:10,9:10),2,1);
        axes(cehandles.g8axes6);
        set(gca,'linewidth',0.7,'TickLength',[0.035,0.025]);
        elipse1(group(6),weight(6),sigmaall(11:12,11:12),2,1);
        axes(cehandles.g8axes7);
        set(gca,'linewidth',0.7,'TickLength',[0.035,0.025]);
        elipse1(group(7),weight(7),sigmaall(13:14,13:14),2,1);
        axes(cehandles.g8axes8);
        set(gca,'linewidth',0.7,'TickLength',[0.035,0.025]);
        elipse1(group(8),weight(8),sigmaall(15:16,15:16),2,1);
        
    elseif length(group) == 9
        run('confidence3.m');
        %open('confidence3.fig');
        cehandles = guihandles;
        xs9 = [cehandles.g9axes1,cehandles.g9axes2,cehandles.g9axes3,cehandles.g9axes4,cehandles.g9axes5,...
            cehandles.g9axes6,cehandles.g9axes7,cehandles.g9axes8,cehandles.g9axes9];
        
        set(xs9,'Visible','on');
        [sigmaage,sigmaall] = confidence9KDE1(mydata,weight,group,sigma);
        axes(cehandles.g9axes1);
        set(gca,'linewidth',0.7,'TickLength',[0.035,0.025]);
        elipse1(group(1),weight(1),sigmaall(1:2,1:2),2,1);
        axes(cehandles.g9axes2);
        set(gca,'linewidth',0.7,'TickLength',[0.035,0.025]);
        elipse1(group(2),weight(2),sigmaall(3:4,3:4),2,1);
        axes(cehandles.g9axes3);
        set(gca,'linewidth',0.7,'TickLength',[0.035,0.025]);
        elipse1(group(3),weight(3),sigmaall(5:6,5:6),2,1);
        axes(cehandles.g9axes4);
        set(gca,'linewidth',0.7,'TickLength',[0.035,0.025]);
        elipse1(group(4),weight(4),sigmaall(7:8,7:8),2,1);
        axes(cehandles.g9axes5);
        set(gca,'linewidth',0.7,'TickLength',[0.035,0.025]);
        elipse1(group(5),weight(5),sigmaall(9:10,9:10),2,1);
        axes(cehandles.g9axes6);
        set(gca,'linewidth',0.7,'TickLength',[0.035,0.025]);
        elipse1(group(6),weight(6),sigmaall(11:12,11:12),2,1);
        axes(cehandles.g9axes7);
        set(gca,'linewidth',0.7,'TickLength',[0.035,0.025]);
        elipse1(group(7),weight(7),sigmaall(13:14,13:14),2,1);
        axes(cehandles.g9axes8);
        set(gca,'linewidth',0.7,'TickLength',[0.035,0.025]);
        elipse1(group(8),weight(8),sigmaall(15:16,15:16),2,1);
        axes(cehandles.g9axes9);
        set(gca,'linewidth',0.7,'TickLength',[0.035,0.025]);
        elipse1(group(9),weight(9),sigmaall(17:18,17:18),2,1);
        
    elseif length(group) == 10
        run('confidence3.m');
        %open('confidence3.fig');
        cehandles = guihandles;
        xs10 = [cehandles.g9axes1,cehandles.g9axes2,cehandles.g9axes3,cehandles.g9axes4,cehandles.g9axes5,...
            cehandles.g9axes6,cehandles.g10axes7,cehandles.g10axes8,cehandles.g10axes9,cehandles.g10axes10];
        
        set(xs10,'Visible','on');
        [sigmaage,sigmaall] = confidence10KDE1(mydata,weight,group,sigma);
        axes(cehandles.g9axes1);
        set(gca,'linewidth',0.7,'TickLength',[0.035,0.025]);
        elipse1(group(1),weight(1),sigmaall(1:2,1:2),2,1);
        axes(cehandles.g9axes2);
        set(gca,'linewidth',0.7,'TickLength',[0.035,0.025]);
        elipse1(group(2),weight(2),sigmaall(3:4,3:4),2,1);
        axes(cehandles.g9axes3);
        set(gca,'linewidth',0.7,'TickLength',[0.035,0.025]);
        elipse1(group(3),weight(3),sigmaall(5:6,5:6),2,1);
        axes(cehandles.g9axes4);
        set(gca,'linewidth',0.7,'TickLength',[0.035,0.025]);
        elipse1(group(4),weight(4),sigmaall(7:8,7:8),2,1);
        axes(cehandles.g9axes5);
        set(gca,'linewidth',0.7,'TickLength',[0.035,0.025]);
        elipse1(group(5),weight(5),sigmaall(9:10,9:10),2,1);
        axes(cehandles.g9axes6);
        set(gca,'linewidth',0.7,'TickLength',[0.035,0.025]);
        elipse1(group(6),weight(6),sigmaall(11:12,11:12),2,1);
        axes(cehandles.g10axes7);
        set(gca,'linewidth',0.7,'TickLength',[0.035,0.025]);
        elipse1(group(7),weight(7),sigmaall(13:14,13:14),2,1);
        axes(cehandles.g10axes8);
        set(gca,'linewidth',0.7,'TickLength',[0.035,0.025]);
        elipse1(group(8),weight(8),sigmaall(15:16,15:16),2,1);
        axes(cehandles.g10axes9);
        set(gca,'linewidth',0.7,'TickLength',[0.035,0.025]);
        elipse1(group(9),weight(9),sigmaall(17:18,17:18),2,1);
        axes(cehandles.g10axes10);
        set(gca,'linewidth',0.7,'TickLength',[0.035,0.025]);
        elipse1(group(10),weight(10),sigmaall(19:20,19:20),2,1);
        
    elseif length(group) == 11
        run('confidence4.m');
        %open('confidence4.fig');
        cehandles = guihandles;
        xish = [cehandles.g11axes1,cehandles.g11axes2,cehandles.g11axes3,cehandles.g11axes4,cehandles.g11axes5,...
            cehandles.g11axes6,cehandles.g11axes7,cehandles.g11axes8,cehandles.g11axes9,cehandles.g11axes10,...
            cehandles.g11axes11];
        set(xish,'Visible','on');
        [sigmaage,sigmaall] = confidence11KDE1(mydata,weight,group,sigma);
        axes(cehandles.g11axes1);
        set(gca,'linewidth',0.7,'TickLength',[0.035,0.025]);
        elipse1(group(1),weight(1),sigmaall(1:2,1:2),2,1);
        axes(cehandles.g11axes2);
        set(gca,'linewidth',0.7,'TickLength',[0.035,0.025]);
        elipse1(group(2),weight(2),sigmaall(3:4,3:4),2,1);
        axes(cehandles.g11axes3);
        set(gca,'linewidth',0.7,'TickLength',[0.035,0.025]);
        elipse1(group(3),weight(3),sigmaall(5:6,5:6),2,1);
        axes(cehandles.g11axes4);
        set(gca,'linewidth',0.7,'TickLength',[0.035,0.025]);
        elipse1(group(4),weight(4),sigmaall(7:8,7:8),2,1);
        axes(cehandles.g11axes5);
        set(gca,'linewidth',0.7,'TickLength',[0.035,0.025]);
        elipse1(group(5),weight(5),sigmaall(9:10,9:10),2,1);
        axes(cehandles.g11axes6);
        set(gca,'linewidth',0.7,'TickLength',[0.035,0.025])
        elipse1(group(6),weight(6),sigmaall(11:12,11:12),2,1);
        axes(cehandles.g11axes7);
        set(gca,'linewidth',0.7,'TickLength',[0.035,0.025]);
        elipse1(group(7),weight(7),sigmaall(13:14,13:14),2,1);
        axes(cehandles.g11axes8);
        set(gca,'linewidth',0.7,'TickLength',[0.035,0.025]);
        elipse1(group(8),weight(8),sigmaall(15:16,15:16),2,1);
        axes(cehandles.g11axes9);
        set(gca,'linewidth',0.7,'TickLength',[0.035,0.025]);
        elipse1(group(9),weight(9),sigmaall(17:18,17:18),2,1);
        axes(cehandles.g11axes10);
        set(gca,'linewidth',0.7,'TickLength',[0.035,0.025]);
        elipse1(group(10),weight(10),sigmaall(19:20,19:20),2,1);
        axes(cehandles.g11axes11);
        set(gca,'linewidth',0.7,'TickLength',[0.035,0.025]);
        elipse1(group(11),weight(11),sigmaall(21:22,21:22),2,1);
        
        
    elseif length(group) == 12
        run('confidence4.m');
        %open('confidence4.fig');
        cehandles = guihandles;
        xish12 = [cehandles.g12axes1,cehandles.g12axes2,cehandles.g12axes3,cehandles.g12axes4,...
            cehandles.g11axes4,cehandles.g11axes5,cehandles.g11axes6,cehandles.g11axes7,...
            cehandles.g11axes8,cehandles.g11axes9,cehandles.g11axes10,cehandles.g11axes11];
        set(xish12,'Visible','on');
        [sigmaage,sigmaall] = confidence12KDE1(mydata,weight,group,sigma);
        axes(cehandles.g12axes1);
        set(gca,'linewidth',0.7,'TickLength',[0.035,0.025]);
        elipse1(group(1),weight(1),sigmaall(1:2,1:2),2,1);
        axes(cehandles.g12axes2);
        set(gca,'linewidth',0.7,'TickLength',[0.035,0.025]);
        elipse1(group(2),weight(2),sigmaall(3:4,3:4),2,1);
        axes(cehandles.g12axes3);
        set(gca,'linewidth',0.7,'TickLength',[0.035,0.025]);
        elipse1(group(3),weight(3),sigmaall(5:6,5:6),2,1);
        axes(cehandles.g12axes4);
        set(gca,'linewidth',0.7,'TickLength',[0.035,0.025]);
        elipse1(group(4),weight(4),sigmaall(7:8,7:8),2,1);
        axes(cehandles.g11axes4);
        set(gca,'linewidth',0.7,'TickLength',[0.035,0.025]);
        elipse1(group(5),weight(5),sigmaall(9:10,9:10),2,1);
        axes(cehandles.g11axes5);
        set(gca,'linewidth',0.7,'TickLength',[0.035,0.025]);
        elipse1(group(6),weight(6),sigmaall(11:12,11:12),2,1);
        axes(cehandles.g11axes6);
        set(gca,'linewidth',0.7,'TickLength',[0.035,0.025]);
        elipse1(group(7),weight(7),sigmaall(13:14,13:14),2,1);
        axes(cehandles.g11axes7);
        set(gca,'linewidth',0.7,'TickLength',[0.035,0.025]);
        elipse1(group(8),weight(8),sigmaall(15:16,15:16),2,1);
        axes(cehandles.g11axes8);
        set(gca,'linewidth',0.7,'TickLength',[0.035,0.025]);
        elipse1(group(9),weight(9),sigmaall(17:18,17:18),2,1);
        axes(cehandles.g11axes9);
        set(gca,'linewidth',0.7,'TickLength',[0.035,0.025]);
        elipse1(group(10),weight(10),sigmaall(19:20,19:20),2,1);
        axes(cehandles.g11axes10);
        set(gca,'linewidth',0.7,'TickLength',[0.035,0.025]);
        elipse1(group(11),weight(11),sigmaall(21:22,21:22),2,1);
        axes(cehandles.g11axes11);
        set(gca,'linewidth',0.7,'TickLength',[0.035,0.025]);
        elipse1(group(12),weight(12),sigmaall(23:24,23:24),2,1);
        
    elseif length(group) == 13
        run('confidence4.m');
        %open('confidence4.fig');
        cehandles = guihandles;
        xish13 = [cehandles.g15axes1,cehandles.g15axes2,cehandles.g15axes3,...
            cehandles.g14axes4,cehandles.g14axes5,cehandles.g14axes6,...
            cehandles.g13axes7,cehandles.g13axes8,cehandles.g13axes9,...
            cehandles.g16axes13,cehandles.g16axes14,cehandles.g16axes15,cehandles.g16axes16];
        set(xish13,'Visible','on');
        [sigmaage,sigmaall] = confidence13KDE1(mydata,weight,group,sigma);
        axes(cehandles.g15axes1);
        set(gca,'linewidth',0.7,'TickLength',[0.035,0.025]);
        elipse1(group(1),weight(1),sigmaall(1:2,1:2),2,1);
        axes(cehandles.g15axes2);
        set(gca,'linewidth',0.7,'TickLength',[0.035,0.025]);
        elipse1(group(2),weight(2),sigmaall(3:4,3:4),2,1);
        axes(cehandles.g15axes3);
        set(gca,'linewidth',0.7,'TickLength',[0.035,0.025]);
        elipse1(group(3),weight(3),sigmaall(5:6,5:6),2,1);
        axes(cehandles.g14axes4);
        set(gca,'linewidth',0.7,'TickLength',[0.035,0.025]);
        elipse1(group(4),weight(4),sigmaall(7:8,7:8),2,1);
        axes(cehandles.g14axes5);
        set(gca,'linewidth',0.7,'TickLength',[0.035,0.025]);
        elipse1(group(5),weight(5),sigmaall(9:10,9:10),2,1);
        axes(cehandles.g14axes6);
        set(gca,'linewidth',0.7,'TickLength',[0.035,0.025]);
        elipse1(group(6),weight(6),sigmaall(11:12,11:12),2,1);
        axes(cehandles.g13axes7);
        set(gca,'linewidth',0.7,'TickLength',[0.035,0.025]);
        elipse1(group(7),weight(7),sigmaall(13:14,13:14),2,1);
        axes(cehandles.g13axes8);
        set(gca,'linewidth',0.7,'TickLength',[0.035,0.025]);
        elipse1(group(8),weight(8),sigmaall(15:16,15:16),2,1);
        axes(cehandles.g13axes9);
        set(gca,'linewidth',0.7,'TickLength',[0.035,0.025]);
        elipse1(group(9),weight(9),sigmaall(17:18,17:18),2,1);
        axes(cehandles.g16axes13);
        set(gca,'linewidth',0.7,'TickLength',[0.035,0.025]);
        elipse1(group(10),weight(10),sigmaall(19:20,19:20),2,1);
        axes(cehandles.g16axes14);
        set(gca,'linewidth',0.7,'TickLength',[0.035,0.025]);
        elipse1(group(11),weight(11),sigmaall(21:22,21:22),2,1);
        axes(cehandles.g16axes15);
        set(gca,'linewidth',0.7,'TickLength',[0.035,0.025]);
        elipse1(group(12),weight(12),sigmaall(23:24,23:24),2,1);
        axes(cehandles.g16axes16);
        set(gca,'linewidth',0.7,'TickLength',[0.035,0.025]);
        elipse1(group(13),weight(13),sigmaall(25:26,25:26),2,1);
        
    elseif length(group) == 14
        run('confidence4.m');
        %open('confidence4.fig');
        cehandles = guihandles;
        xish14 = [cehandles.g15axes1,cehandles.g15axes2,cehandles.g15axes3,...
            cehandles.g14axes4,cehandles.g14axes5,cehandles.g14axes6,...
            cehandles.g16axes9,cehandles.g16axes10,cehandles.g16axes11,cehandles.g16axes12,...
            cehandles.g16axes13,cehandles.g16axes14,cehandles.g16axes15,cehandles.g16axes16];
        set(xish14,'Visible','on');
        [sigmaage,sigmaall] = confidence14KDE1(mydata,weight,group,sigma);
        axes(cehandles.g15axes1);
        set(gca,'linewidth',0.7,'TickLength',[0.035,0.025]);
        elipse1(group(1),weight(1),sigmaall(1:2,1:2),2,1);
        axes(cehandles.g15axes2);
        set(gca,'linewidth',0.7,'TickLength',[0.035,0.025]);
        elipse1(group(2),weight(2),sigmaall(3:4,3:4),2,1);
        axes(cehandles.g15axes3);
        set(gca,'linewidth',0.7,'TickLength',[0.035,0.025]);
        elipse1(group(3),weight(3),sigmaall(5:6,5:6),2,1);
        axes(cehandles.g14axes4);
        set(gca,'linewidth',0.7,'TickLength',[0.035,0.025]);
        elipse1(group(4),weight(4),sigmaall(7:8,7:8),2,1);
        axes(cehandles.g14axes5);
        set(gca,'linewidth',0.7,'TickLength',[0.035,0.025]);
        elipse1(group(5),weight(5),sigmaall(9:10,9:10),2,1);
        axes(cehandles.g14axes6);
        set(gca,'linewidth',0.7,'TickLength',[0.035,0.025]);
        elipse1(group(6),weight(6),sigmaall(11:12,11:12),2,1);
        axes(cehandles.g16axes9);
        set(gca,'linewidth',0.7,'TickLength',[0.035,0.025]);
        elipse1(group(7),weight(7),sigmaall(13:14,13:14),2,1);
        axes(cehandles.g16axes10);
        set(gca,'linewidth',0.7,'TickLength',[0.035,0.025]);
        elipse1(group(8),weight(8),sigmaall(15:16,15:16),2,1);
        axes(cehandles.g16axes11);
        set(gca,'linewidth',0.7,'TickLength',[0.035,0.025]);
        elipse1(group(9),weight(9),sigmaall(17:18,17:18),2,1);
        axes(cehandles.g16axes12);
        set(gca,'linewidth',0.7,'TickLength',[0.035,0.025]);
        elipse1(group(10),weight(10),sigmaall(19:20,19:20),2,1);
        axes(cehandles.g16axes13);
        set(gca,'linewidth',0.7,'TickLength',[0.035,0.025]);
        elipse1(group(11),weight(11),sigmaall(21:22,21:22),2,1);
        axes(cehandles.g16axes14);
        set(gca,'linewidth',0.7,'TickLength',[0.035,0.025]);
        elipse1(group(12),weight(12),sigmaall(23:24,23:24),2,1);
        axes(cehandles.g16axes15);
        set(gca,'linewidth',0.7,'TickLength',[0.035,0.025]);
        elipse1(group(13),weight(13),sigmaall(25:26,25:26),2,1);
        axes(cehandles.g16axes16);
        set(gca,'linewidth',0.7,'TickLength',[0.035,0.025]);
        elipse1(group(14),weight(14),sigmaall(27:28,27:28),2,1);
        
        
    elseif length(group) == 15
        run('confidence4.m');
        %open('confidence4.fig');
        cehandles = guihandles;
        xish15 = [cehandles.g15axes1,cehandles.g15axes2,cehandles.g15axes3,...
            cehandles.g16axes5,cehandles.g16axes6,cehandles.g16axes7,cehandles.g16axes8,...
            cehandles.g16axes9,cehandles.g16axes10,cehandles.g16axes11,cehandles.g16axes12,...
            cehandles.g16axes13,cehandles.g16axes14,cehandles.g16axes15,cehandles.g16axes16];
        set(xish15,'Visible','on');
        [sigmaage,sigmaall] = confidence15KDE1(mydata,weight,group,sigma);
        axes(cehandles.g15axes1);
        set(gca,'linewidth',0.7,'TickLength',[0.035,0.025]);
        elipse1(group(1),weight(1),sigmaall(1:2,1:2),2,1);
        axes(cehandles.g15axes2);
        set(gca,'linewidth',0.7,'TickLength',[0.035,0.025]);
        elipse1(group(2),weight(2),sigmaall(3:4,3:4),2,1);
        axes(cehandles.g15axes3);
        set(gca,'linewidth',0.7,'TickLength',[0.035,0.025]);
        elipse1(group(3),weight(3),sigmaall(5:6,5:6),2,1);
        axes(cehandles.g16axes5);
        set(gca,'linewidth',0.7,'TickLength',[0.035,0.025]);
        elipse1(group(4),weight(4),sigmaall(7:8,7:8),2,1);
        axes(cehandles.g16axes6);
        set(gca,'linewidth',0.7,'TickLength',[0.035,0.025]);
        elipse1(group(5),weight(5),sigmaall(9:10,9:10),2,1);
        axes(cehandles.g16axes7);
        set(gca,'linewidth',0.7,'TickLength',[0.035,0.025]);
        elipse1(group(6),weight(6),sigmaall(11:12,11:12),2,1);
        axes(cehandles.g16axes8);
        set(gca,'linewidth',0.7,'TickLength',[0.035,0.025]);
        elipse1(group(7),weight(7),sigmaall(13:14,13:14),2,1);
        axes(cehandles.g16axes9);
        set(gca,'linewidth',0.7,'TickLength',[0.035,0.025]);
        elipse1(group(8),weight(8),sigmaall(15:16,15:16),2,1);
        axes(cehandles.g16axes10);
        set(gca,'linewidth',0.7,'TickLength',[0.035,0.025]);
        elipse1(group(9),weight(9),sigmaall(17:18,17:18),2,1);
        axes(cehandles.g16axes11);
        set(gca,'linewidth',0.7,'TickLength',[0.035,0.025]);
        elipse1(group(10),weight(10),sigmaall(19:20,19:20),2,1);
        axes(cehandles.g16axes12);
        set(gca,'linewidth',0.7,'TickLength',[0.035,0.025]);
        elipse1(group(11),weight(11),sigmaall(21:22,21:22),2,1);
        axes(cehandles.g16axes13);
        set(gca,'linewidth',0.7,'TickLength',[0.035,0.025]);
        elipse1(group(12),weight(12),sigmaall(23:24,23:24),2,1);
        axes(cehandles.g16axes14);
        set(gca,'linewidth',0.7,'TickLength',[0.035,0.025]);
        elipse1(group(13),weight(13),sigmaall(25:26,25:26),2,1);
        axes(cehandles.g16axes15);
        set(gca,'linewidth',0.7,'TickLength',[0.035,0.025]);
        elipse1(group(14),weight(14),sigmaall(27:28,27:28),2,1);
        axes(cehandles.g16axes16);
        set(gca,'linewidth',0.7,'TickLength',[0.035,0.025]);
        elipse1(group(15),weight(15),sigmaall(29:30,29:30),2,1);
        
    elseif length(group) == 16
        run('confidence4.m');
        %open('confidence4.fig');
        cehandles = guihandles;
        xish16 = [cehandles.g16axes1,cehandles.g16axes2,cehandles.g16axes3,cehandles.g16axes4,...
            cehandles.g16axes5,cehandles.g16axes6,cehandles.g16axes7,cehandles.g16axes8,...
            cehandles.g16axes9,cehandles.g16axes10,cehandles.g16axes11,cehandles.g16axes12,...
            cehandles.g16axes13,cehandles.g16axes14,cehandles.g16axes15,cehandles.g16axes16];
        set(xish16,'Visible','on');
        [sigmaage,sigmaall] = confidence16KDE1(mydata,weight,group,sigma);
        axes(cehandles.g16axes1);
        set(gca,'linewidth',0.7,'TickLength',[0.035,0.025]);
        elipse1(group(1),weight(1),sigmaall(1:2,1:2),2,1);
        axes(cehandles.g16axes2);
        set(gca,'linewidth',0.7,'TickLength',[0.035,0.025]);
        elipse1(group(2),weight(2),sigmaall(3:4,3:4),2,1);
        axes(cehandles.g16axes3);
        set(gca,'linewidth',0.7,'TickLength',[0.035,0.025]);
        elipse1(group(3),weight(3),sigmaall(5:6,5:6),2,1);
        axes(cehandles.g16axes4);
        set(gca,'linewidth',0.7,'TickLength',[0.035,0.025]);
        elipse1(group(4),weight(4),sigmaall(7:8,7:8),2,1);
        axes(cehandles.g16axes5);
        set(gca,'linewidth',0.7,'TickLength',[0.035,0.025]);
        elipse1(group(5),weight(5),sigmaall(9:10,9:10),2,1);
        axes(cehandles.g16axes6);
        set(gca,'linewidth',0.7,'TickLength',[0.035,0.025]);
        elipse1(group(6),weight(6),sigmaall(11:12,11:12),2,1);
        axes(cehandles.g16axes7);
        set(gca,'linewidth',0.7,'TickLength',[0.035,0.025]);
        elipse1(group(7),weight(7),sigmaall(13:14,13:14),2,1);
        axes(cehandles.g16axes8);
        set(gca,'linewidth',0.7,'TickLength',[0.035,0.025]);
        elipse1(group(8),weight(8),sigmaall(15:16,15:16),2,1);
        axes(cehandles.g16axes9);
        set(gca,'linewidth',0.7,'TickLength',[0.035,0.025]);
        elipse1(group(9),weight(9),sigmaall(17:18,17:18),2,1);
        axes(cehandles.g16axes10);
        set(gca,'linewidth',0.7,'TickLength',[0.035,0.025])
        elipse1(group(10),weight(10),sigmaall(19:20,19:20),2,1);
        axes(cehandles.g16axes11);
        set(gca,'linewidth',0.7,'TickLength',[0.035,0.025]);
        elipse1(group(11),weight(11),sigmaall(21:22,21:22),2,1);
        axes(cehandles.g16axes12);
        set(gca,'linewidth',0.7,'TickLength',[0.035,0.025]);
        elipse1(group(12),weight(12),sigmaall(23:24,23:24),2,1);
        axes(cehandles.g16axes13);
        set(gca,'linewidth',0.7,'TickLength',[0.035,0.025]);
        elipse1(group(13),weight(13),sigmaall(25:26,25:26),2,1);
        axes(cehandles.g16axes14);
        set(gca,'linewidth',0.7,'TickLength',[0.035,0.025]);
        elipse1(group(14),weight(14),sigmaall(27:28,27:28),2,1);
        axes(cehandles.g16axes15);
        set(gca,'linewidth',0.7,'TickLength',[0.035,0.025]);
        elipse1(group(15),weight(15),sigmaall(29:30,29:30),2,1);
        axes(cehandles.g16axes16);
        set(gca,'linewidth',0.7,'TickLength',[0.035,0.025]);
        elipse1(group(16),weight(16),sigmaall(31:32,31:32),2,1);
        
    elseif length(group) == 17
        run('confidence5.m');
        %open('confidence5.fig');
        cehandles = guihandles;
        xish17 = [cehandles.g19axes1,cehandles.g19axes2,cehandles.g19axes3,...
            cehandles.g18axes4,cehandles.g18axes5,cehandles.g18axes6,...
            cehandles.g17axes7,cehandles.g17axes8,cehandles.g17axes9,...
            cehandles.g20axes13,cehandles.g20axes14,cehandles.g20axes15,cehandles.g20axes16,...
            cehandles.g20axes17,cehandles.g20axes18,cehandles.g20axes19,cehandles.g20axes20];
        set(xish17,'Visible','on');
        [sigmaage,sigmaall] = confidence17KDE1(mydata,weight,group,sigma);
        axes(cehandles.g19axes1);
        set(gca,'linewidth',0.7,'TickLength',[0.035,0.025]);
        elipse1(group(1),weight(1),sigmaall(1:2,1:2),2,1);
        axes(cehandles.g19axes2);
        set(gca,'linewidth',0.7,'TickLength',[0.035,0.025]);
        elipse1(group(2),weight(2),sigmaall(3:4,3:4),2,1);
        axes(cehandles.g19axes3);
        set(gca,'linewidth',0.7,'TickLength',[0.035,0.025]);
        elipse1(group(3),weight(3),sigmaall(5:6,5:6),2,1);
        axes(cehandles.g18axes4);
        set(gca,'linewidth',0.7,'TickLength',[0.035,0.025]);
        elipse1(group(4),weight(4),sigmaall(7:8,7:8),2,1);
        axes(cehandles.g18axes5);
        set(gca,'linewidth',0.7,'TickLength',[0.035,0.025]);
        elipse1(group(5),weight(5),sigmaall(9:10,9:10),2,1);
        axes(cehandles.g18axes6);
        set(gca,'linewidth',0.7,'TickLength',[0.035,0.025]);
        elipse1(group(6),weight(6),sigmaall(11:12,11:12),2,1);
        axes(cehandles.g17axes7);
        set(gca,'linewidth',0.7,'TickLength',[0.035,0.025]);
        elipse1(group(7),weight(7),sigmaall(13:14,13:14),2,1);
        axes(cehandles.g17axes8);
        set(gca,'linewidth',0.7,'TickLength',[0.035,0.025]);
        elipse1(group(8),weight(8),sigmaall(15:16,15:16),2,1);
        axes(cehandles.g17axes9);
        set(gca,'linewidth',0.7,'TickLength',[0.035,0.025]);
        elipse1(group(9),weight(9),sigmaall(17:18,17:18),2,1);
        axes(cehandles.g20axes13);
        set(gca,'linewidth',0.7,'TickLength',[0.035,0.025]);
        elipse1(group(10),weight(10),sigmaall(19:20,19:20),2,1);
        axes(cehandles.g20axes14);
        set(gca,'linewidth',0.7,'TickLength',[0.035,0.025]);
        elipse1(group(11),weight(11),sigmaall(21:22,21:22),2,1);
        axes(cehandles.g20axes15);
        set(gca,'linewidth',0.7,'TickLength',[0.035,0.025]);
        elipse1(group(12),weight(12),sigmaall(23:24,23:24),2,1);
        axes(cehandles.g20axes16);
        set(gca,'linewidth',0.7,'TickLength',[0.035,0.025]);
        elipse1(group(13),weight(13),sigmaall(25:26,25:26),2,1);
        axes(cehandles.g20axes17);
        set(gca,'linewidth',0.7,'TickLength',[0.035,0.025]);
        elipse1(group(14),weight(14),sigmaall(27:28,27:28),2,1);
        axes(cehandles.g20axes18);
        set(gca,'linewidth',0.7,'TickLength',[0.035,0.025]);
        elipse1(group(15),weight(15),sigmaall(29:30,29:30),2,1);
        axes(cehandles.g20axes19);
        set(gca,'linewidth',0.7,'TickLength',[0.035,0.025]);
        elipse1(group(16),weight(16),sigmaall(31:32,31:32),2,1);
        axes(cehandles.g20axes20);
        set(gca,'linewidth',0.7,'TickLength',[0.035,0.025]);
        elipse1(group(17),weight(17),sigmaall(33:34,33:34),2,1);
        
    elseif length(group) == 18
        run('confidence5.m');
        %open('confidence5.fig');
        cehandles = guihandles;
        xish18 = [cehandles.g19axes1,cehandles.g19axes2,cehandles.g19axes3,...
            cehandles.g18axes4,cehandles.g18axes5,cehandles.g18axes6,...
            cehandles.g20axes9,cehandles.g20axes10,cehandles.g20axes11,cehandles.g20axes12,...
            cehandles.g20axes13,cehandles.g20axes14,cehandles.g20axes15,cehandles.g20axes16,...
            cehandles.g20axes17,cehandles.g20axes18,cehandles.g20axes19,cehandles.g20axes20];
        set(xish18,'Visible','on');
        [sigmaage,sigmaall] = confidence18KDE1(mydata,weight,group,sigma);
        axes(cehandles.g19axes1);
        set(gca,'linewidth',0.7,'TickLength',[0.035,0.025]);
        elipse1(group(1),weight(1),sigmaall(1:2,1:2),2,1);
        axes(cehandles.g19axes2);
        set(gca,'linewidth',0.7,'TickLength',[0.035,0.025]);
        elipse1(group(2),weight(2),sigmaall(3:4,3:4),2,1);
        axes(cehandles.g19axes3);
        set(gca,'linewidth',0.7,'TickLength',[0.035,0.025]);
        elipse1(group(3),weight(3),sigmaall(5:6,5:6),2,1);
        axes(cehandles.g18axes4);
        set(gca,'linewidth',0.7,'TickLength',[0.035,0.025]);
        elipse1(group(4),weight(4),sigmaall(7:8,7:8),2,1);
        axes(cehandles.g18axes5);
        set(gca,'linewidth',0.7,'TickLength',[0.035,0.025]);
        elipse1(group(5),weight(5),sigmaall(9:10,9:10),2,1);
        axes(cehandles.g18axes6);
        set(gca,'linewidth',0.7,'TickLength',[0.035,0.025]);
        elipse1(group(6),weight(6),sigmaall(11:12,11:12),2,1);
        axes(cehandles.g20axes9);
        set(gca,'linewidth',0.7,'TickLength',[0.035,0.025]);
        elipse1(group(7),weight(7),sigmaall(13:14,13:14),2,1);
        axes(cehandles.g20axes10);
        set(gca,'linewidth',0.7,'TickLength',[0.035,0.025]);
        elipse1(group(8),weight(8),sigmaall(15:16,15:16),2,1);
        axes(cehandles.g20axes11);
        set(gca,'linewidth',0.7,'TickLength',[0.035,0.025]);
        elipse1(group(9),weight(9),sigmaall(17:18,17:18),2,1);
        axes(cehandles.g20axes12);
        set(gca,'linewidth',0.7,'TickLength',[0.035,0.025]);
        elipse1(group(10),weight(10),sigmaall(19:20,19:20),2,1);
        axes(cehandles.g20axes13);
        set(gca,'linewidth',0.7,'TickLength',[0.035,0.025]);
        elipse1(group(11),weight(11),sigmaall(21:22,21:22),2,1);
        axes(cehandles.g20axes14);
        set(gca,'linewidth',0.7,'TickLength',[0.035,0.025]);
        elipse1(group(12),weight(12),sigmaall(23:24,23:24),2,1);
        axes(cehandles.g20axes15);
        set(gca,'linewidth',0.7,'TickLength',[0.035,0.025]);
        elipse1(group(13),weight(13),sigmaall(25:26,25:26),2,1);
        axes(cehandles.g20axes16);
        set(gca,'linewidth',0.7,'TickLength',[0.035,0.025]);
        elipse1(group(14),weight(14),sigmaall(27:28,27:28),2,1);
        axes(cehandles.g20axes17);
        set(gca,'linewidth',0.7,'TickLength',[0.035,0.025]);
        elipse1(group(15),weight(15),sigmaall(29:30,29:30),2,1);
        axes(cehandles.g20axes18);
        set(gca,'linewidth',0.7,'TickLength',[0.035,0.025]);
        elipse1(group(16),weight(16),sigmaall(31:32,31:32),2,1);
        axes(cehandles.g20axes19);
        set(gca,'linewidth',0.7,'TickLength',[0.035,0.025]);
        elipse1(group(17),weight(17),sigmaall(33:34,33:34),2,1);
        axes(cehandles.g20axes20);
        set(gca,'linewidth',0.7,'TickLength',[0.035,0.025]);
        elipse1(group(18),weight(18),sigmaall(35:36,35:36),2,1);
        
    elseif length(group) == 19
        run('confidence5.m');
        %open('confidence5.fig');
        cehandles = guihandles;
        xish19 = [cehandles.g19axes1,cehandles.g19axes2,cehandles.g19axes3,...
            cehandles.g20axes5,cehandles.g20axes6,cehandles.g20axes7,cehandles.g20axes8,...
            cehandles.g20axes9,cehandles.g20axes10,cehandles.g20axes11,cehandles.g20axes12,...
            cehandles.g20axes13,cehandles.g20axes14,cehandles.g20axes15,cehandles.g20axes16,...
            cehandles.g20axes17,cehandles.g20axes18,cehandles.g20axes19,cehandles.g20axes20];
        set(xish19,'Visible','on');
        [sigmaage,sigmaall] = confidence19KDE1(mydata,weight,group,sigma);
        axes(cehandles.g19axes1);
        set(gca,'linewidth',0.7,'TickLength',[0.035,0.025]);
        elipse1(group(1),weight(1),sigmaall(1:2,1:2),2,1);
        axes(cehandles.g19axes2);
        set(gca,'linewidth',0.7,'TickLength',[0.035,0.025]);
        elipse1(group(2),weight(2),sigmaall(3:4,3:4),2,1);
        axes(cehandles.g19axes3);
        set(gca,'linewidth',0.7,'TickLength',[0.035,0.025]);
        elipse1(group(3),weight(3),sigmaall(5:6,5:6),2,1);
        axes(cehandles.g20axes5);
        set(gca,'linewidth',0.7,'TickLength',[0.035,0.025]);
        elipse1(group(4),weight(4),sigmaall(7:8,7:8),2,1);
        axes(cehandles.g20axes6);
        set(gca,'linewidth',0.7,'TickLength',[0.035,0.025]);
        elipse1(group(5),weight(5),sigmaall(9:10,9:10),2,1);
        axes(cehandles.g20axes7);
        set(gca,'linewidth',0.7,'TickLength',[0.035,0.025]);
        elipse1(group(6),weight(6),sigmaall(11:12,11:12),2,1);
        axes(cehandles.g20axes8);
        set(gca,'linewidth',0.7,'TickLength',[0.035,0.025]);
        elipse1(group(7),weight(7),sigmaall(13:14,13:14),2,1);
        axes(cehandles.g20axes9);
        set(gca,'linewidth',0.7,'TickLength',[0.035,0.025]);
        elipse1(group(8),weight(8),sigmaall(15:16,15:16),2,1);
        axes(cehandles.g20axes10);
        set(gca,'linewidth',0.7,'TickLength',[0.035,0.025]);
        elipse1(group(9),weight(9),sigmaall(17:18,17:18),2,1);
        axes(cehandles.g20axes11);
        set(gca,'linewidth',0.7,'TickLength',[0.035,0.025]);
        elipse1(group(10),weight(10),sigmaall(19:20,19:20),2,1);
        axes(cehandles.g20axes12);
        set(gca,'linewidth',0.7,'TickLength',[0.035,0.025]);
        elipse1(group(11),weight(11),sigmaall(21:22,21:22),2,1);
        axes(cehandles.g20axes13);
        set(gca,'linewidth',0.7,'TickLength',[0.035,0.025]);
        elipse1(group(12),weight(12),sigmaall(23:24,23:24),2,1);
        axes(cehandles.g20axes14);
        set(gca,'linewidth',0.7,'TickLength',[0.035,0.025]);
        elipse1(group(13),weight(13),sigmaall(25:26,25:26),2,1);
        axes(cehandles.g20axes15);
        set(gca,'linewidth',0.7,'TickLength',[0.035,0.025]);
        elipse1(group(14),weight(14),sigmaall(27:28,27:28),2,1);
        axes(cehandles.g20axes16);
        set(gca,'linewidth',0.7,'TickLength',[0.035,0.025]);
        elipse1(group(15),weight(15),sigmaall(29:30,29:30),2,1);
        axes(cehandles.g20axes17);
        set(gca,'linewidth',0.7,'TickLength',[0.035,0.025]);
        elipse1(group(16),weight(16),sigmaall(31:32,31:32),2,1);
        axes(cehandles.g20axes18);
        set(gca,'linewidth',0.7,'TickLength',[0.035,0.025]);
        elipse1(group(17),weight(17),sigmaall(33:34,33:34),2,1);
        axes(cehandles.g20axes19);
        set(gca,'linewidth',0.7,'TickLength',[0.035,0.025]);
        elipse1(group(18),weight(18),sigmaall(35:36,35:36),2,1);
        axes(cehandles.g20axes20);
        set(gca,'linewidth',0.7,'TickLength',[0.035,0.025]);
        elipse1(group(19),weight(19),sigmaall(37:38,37:38),2,1);
        
    elseif length(group) == 20
        run('confidence5.m');
        %open('confidence5.fig');
        cehandles = guihandles;
        xish20 = [cehandles.g20axes1,cehandles.g20axes2,cehandles.g20axes3,cehandles.g20axes4,...
            cehandles.g20axes5,cehandles.g20axes6,cehandles.g20axes7,cehandles.g20axes8,...
            cehandles.g20axes9,cehandles.g20axes10,cehandles.g20axes11,cehandles.g20axes12,...
            cehandles.g20axes13,cehandles.g20axes14,cehandles.g20axes15,cehandles.g20axes16,...
            cehandles.g20axes17,cehandles.g20axes18,cehandles.g20axes19,cehandles.g20axes20];
        set(xish20,'Visible','on');
        [sigmaage,sigmaall] = confidence20KDE1(mydata,weight,group,sigma);
        axes(cehandles.g20axes1);
        set(gca,'linewidth',0.7,'TickLength',[0.035,0.025]);
        elipse1(group(1),weight(1),sigmaall(1:2,1:2),2,1);
        axes(cehandles.g20axes2);
        set(gca,'linewidth',0.7,'TickLength',[0.035,0.025]);
        elipse1(group(2),weight(2),sigmaall(3:4,3:4),2,1);
        axes(cehandles.g20axes3);
        set(gca,'linewidth',0.7,'TickLength',[0.035,0.025]);
        elipse1(group(3),weight(3),sigmaall(5:6,5:6),2,1);
        axes(cehandles.g20axes4);
        set(gca,'linewidth',0.7,'TickLength',[0.035,0.025]);
        elipse1(group(4),weight(4),sigmaall(7:8,7:8),2,1);
        axes(cehandles.g20axes5);
        set(gca,'linewidth',0.7,'TickLength',[0.035,0.025]);
        elipse1(group(5),weight(5),sigmaall(9:10,9:10),2,1);
        axes(cehandles.g20axes6);
        set(gca,'linewidth',0.7,'TickLength',[0.035,0.025]);
        elipse1(group(6),weight(6),sigmaall(11:12,11:12),2,1);
        axes(cehandles.g20axes7);
        set(gca,'linewidth',0.7,'TickLength',[0.035,0.025]);
        elipse1(group(7),weight(7),sigmaall(13:14,13:14),2,1);
        axes(cehandles.g20axes8);
        set(gca,'linewidth',0.7,'TickLength',[0.035,0.025]);
        elipse1(group(8),weight(8),sigmaall(15:16,15:16),2,1);
        axes(cehandles.g20axes9);
        set(gca,'linewidth',0.7,'TickLength',[0.035,0.025]);
        elipse1(group(9),weight(9),sigmaall(17:18,17:18),2,1);
        axes(cehandles.g20axes10);
        set(gca,'linewidth',0.7,'TickLength',[0.035,0.025]);
        elipse1(group(10),weight(10),sigmaall(19:20,19:20),2,1);
        axes(cehandles.g20axes11);
        set(gca,'linewidth',0.7,'TickLength',[0.035,0.025]);
        elipse1(group(11),weight(11),sigmaall(21:22,21:22),2,1);
        axes(cehandles.g20axes12);
        set(gca,'linewidth',0.7,'TickLength',[0.035,0.025]);
        elipse1(group(12),weight(12),sigmaall(23:24,23:24),2,1);
        axes(cehandles.g20axes13);
        set(gca,'linewidth',0.7,'TickLength',[0.035,0.025]);
        elipse1(group(13),weight(13),sigmaall(25:26,25:26),2,1);
        axes(cehandles.g20axes14);
        set(gca,'linewidth',0.7,'TickLength',[0.035,0.025]);
        elipse1(group(14),weight(14),sigmaall(27:28,27:28),2,1);
        axes(cehandles.g20axes15);
        set(gca,'linewidth',0.7,'TickLength',[0.035,0.025]);
        elipse1(group(15),weight(15),sigmaall(29:30,29:30),2,1);
        axes(cehandles.g20axes16);
        set(gca,'linewidth',0.7,'TickLength',[0.035,0.025]);
        elipse1(group(16),weight(16),sigmaall(31:32,31:32),2,1);
        axes(cehandles.g20axes17);
        set(gca,'linewidth',0.7,'TickLength',[0.035,0.025]);
        elipse1(group(17),weight(17),sigmaall(33:34,33:34),2,1);
        axes(cehandles.g20axes18);
        set(gca,'linewidth',0.7,'TickLength',[0.035,0.025]);
        elipse1(group(18),weight(18),sigmaall(35:36,35:36),2,1);
        axes(cehandles.g20axes19);
        set(gca,'linewidth',0.7,'TickLength',[0.035,0.025]);
        elipse1(group(19),weight(19),sigmaall(37:38,37:38),2,1);
        axes(cehandles.g20axes20);
        set(gca,'linewidth',0.7,'TickLength',[0.035,0.025]);
        elipse1(group(20),weight(20),sigmaall(39:40,39:40),2,1);
    end
end
