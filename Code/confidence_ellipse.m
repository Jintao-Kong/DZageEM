function varargout = confidence_ellipse(varargin)
% CONFIDENCE_ELLIPSE MATLAB code for confidence_ellipse.fig
%      CONFIDENCE_ELLIPSE, by itself, creates a new CONFIDENCE_ELLIPSE or raises the existing
%      singleton*.
%
%      H = CONFIDENCE_ELLIPSE returns the handle to a new CONFIDENCE_ELLIPSE or the handle to
%      the existing singleton*.
%
%      CONFIDENCE_ELLIPSE('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in CONFIDENCE_ELLIPSE.M with the given input arguments.
%
%      CONFIDENCE_ELLIPSE('Property','Value',...) creates a new CONFIDENCE_ELLIPSE or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before confidence_ellipse_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to confidence_ellipse_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help confidence_ellipse

% Last Modified by GUIDE v2.5 13-Aug-2021 16:52:15

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @confidence_ellipse_OpeningFcn, ...
                   'gui_OutputFcn',  @confidence_ellipse_OutputFcn, ...
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


% --- Executes just before confidence_ellipse is made visible.
function confidence_ellipse_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to confidence_ellipse (see VARARGIN)

% Choose default command line output for confidence_ellipse
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes confidence_ellipse wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = confidence_ellipse_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --------------------------------------------------------------------
function export1_Callback(hObject, eventdata, handles)
% hObject    handle to export1 (see GCBO)
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