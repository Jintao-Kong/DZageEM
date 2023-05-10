function varargout = confidence5(varargin)
% CONFIDENCE5 MATLAB code for confidence5.fig
%      CONFIDENCE5, by itself, creates a new CONFIDENCE5 or raises the existing
%      singleton*.
% 
%      H = CONFIDENCE5 returns the handle to a new CONFIDENCE5 or the handle to
%      the existing singleton*.
%
%      CONFIDENCE5('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in CONFIDENCE5.M with the given input arguments.
%
%      CONFIDENCE5('Property','Value',...) creates a new CONFIDENCE5 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before confidence5_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to confidence5_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help confidence5

% Last Modified by GUIDE v2.5 13-Aug-2021 16:55:13

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @confidence5_OpeningFcn, ...
                   'gui_OutputFcn',  @confidence5_OutputFcn, ...
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


% --- Executes just before confidence5 is made visible.
function confidence5_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to confidence5 (see VARARGIN)

% Choose default command line output for confidence5
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes confidence5 wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = confidence5_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --------------------------------------------------------------------
function export5_Callback(hObject, eventdata, handles)
% hObject    handle to export5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

[filename pathname fileindex]=uiputfile({'*.png';'*.bmp';'*.jpeg';'*.eps';},'Export Confidence Ellipse');
if  filename~=0
    file=strcat(pathname,filename);
    switch fileindex 
        case 1
            print(gcf,'-dpng',file);          
        case 2
            print(gcf,'-dbmp',file);           
        case 3
            print(gcf,'-djpeg',file);          
        case 4
            print(gcf,'-depsc',file);           
    end
    msgbox('   Confidence Ellipse Export Completed !!! ','Complete');
end
