function varargout = comparison(varargin)
% COMPARISON MATLAB code for comparison.fig
%      COMPARISON, by itself, creates a new COMPARISON or raises the existing
%      singleton*.
%
%      H = COMPARISON returns the handle to a new COMPARISON or the handle to
%      the existing singleton*.
%
%      COMPARISON('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in COMPARISON.M with the given input arguments.
%
%      COMPARISON('Property','Value',...) creates a new COMPARISON or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before comparison_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to comparison_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help comparison

% Last Modified by GUIDE v2.5 07-Sep-2021 22:36:40

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @comparison_OpeningFcn, ...
                   'gui_OutputFcn',  @comparison_OutputFcn, ...
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


% --- Executes just before comparison is made visible.
function comparison_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to comparison (see VARARGIN)

% Choose default command line output for comparison
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes comparison wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = comparison_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --------------------------------------------------------------------
function Untitled_1_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_1 (see GCBO)
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
    msgbox('               Export Completed !!! ','Complete');
end
