unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Buttons, ExtCtrls, StdCtrls, XPMan,DateUtils, ComCtrls, Menus;

type
  TForm1 = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    ComboBox1: TComboBox;
    SpeedButton1: TSpeedButton;
    XPManifest1: TXPManifest;
    SpeedButton2: TSpeedButton;
    MainMenu1: TMainMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    N5: TMenuItem;
    StatusBar1: TStatusBar;
    ComboBox2: TComboBox;
    procedure StartTime;
    procedure EndTime;
    function FindProg(Name:PAnsiChar):boolean;
    function TimeBeetween(finish:boolean; format:integer):extended;
    procedure SpeedButton1Click(Sender: TObject);
    procedure WaitEnd;
    procedure WaitStart;
    procedure SaveList(Box:TCombobox);
    procedure LoadList(Box:TCombobox);
    function  EqualStr(Str:string; Box:TCombobox):boolean;
    procedure SpeedButton2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure N5Click(Sender: TObject);
    procedure N4Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  stop:boolean;
  t1,t2:TDateTime;
implementation

{$R *.dfm}

function TForm1.EqualStr(Str:string; Box:TCombobox):boolean;
var
i:integer;
begin
 for i:=0 to Box.items.count-1 do begin
  if Str=Box.Items[i] then begin
   Result:=true;
   exit;
  end;
 end;
Result:=false;
end;

procedure TForm1.SaveList(Box:TCombobox);
var
i:integer;
begin
 AssignFile(output,'Windows.lst');
 Rewrite(output);
 For i:=0 to Box.items.Count-1 do begin
  Writeln(Box.items[i]);
 end;
 CloseFile(output);
end;

procedure TForm1.LoadList(Box:TCombobox);
var
str,rem:string;
i:integer;
begin
rem:=Box.Text;
Box.Clear;
 AssignFile(input,'Windows.lst');
 Reset(input);
 while not eof(input) do begin
  Readln(str);
  Box.Items.Add(Str);
 end;
 CloseFile(input);
Box.Text:=rem;
end;

procedure TForm1.StartTime;
begin
t1:=GetTime;
end;

procedure TForm1.EndTime;
begin
t2:=GetTime;
end;

function TForm1.TimeBeetween(finish:boolean; format:integer):extended;
var
t:Extended;
begin
if finish=true then EndTime;
 t:=MilliSecondsBetween(t1,t2);
 case Format of
  0: result:=t;
  1: result:=t/1000;
  2: result:=t/60000;
  3: result:=t/3600000;
 end;
end;

function TForm1.FindProg(Name:PAnsiChar):boolean;
var
h:HWND;
begin
h:=FindWindow(nil,Name);
if h=0 then Result:=false else Result:=true;
end;

procedure TForm1.SpeedButton1Click(Sender: TObject);
begin
if Combobox2.Text<>'' then begin
 if equalStr(Combobox2.Text,Combobox2)=false then begin
  Combobox2.Items.Add(Combobox2.Text);
  SaveList(Combobox2);
 end;
 waitstart;
end else showmessage('Название не может быть пустым');
end;

procedure TForm1.WaitStart;
begin
stop:=false;
 SpeedButton1.Enabled:=false;
 SpeedButton2.Enabled:=true;
StatusBar1.Panels[0].Text:='Поиск окна...';
application.ProcessMessages;
repeat
 if FindProg(PansiChar(Combobox2.text))=true then begin
  StartTime;
  WaitEnd;
  exit;
 end;
application.ProcessMessages;
until stop=true;
StatusBar1.Panels[0].Text:='Работа прервана.';
end;

procedure TForm1.WaitEnd;
var
res:extended;
begin
StatusBar1.Panels[0].Text:='Жду окончания работы...';
repeat
 if FindProg(PansiChar(Combobox2.text))=false then begin
  res:=TimeBeetween(true,Combobox1.ItemIndex);
   SpeedButton1.Enabled:=true;
   SpeedButton2.Enabled:=false;
  StatusBar1.Panels[0].Text:='Результат: '+Floattostr(res);
  LoadList(Combobox2);
  exit;
 end;
application.ProcessMessages;
until stop=true;
StatusBar1.Panels[0].Text:='Работа прервана.';
LoadList(Combobox2);
end;

procedure TForm1.SpeedButton2Click(Sender: TObject);
begin
Stop:=true;
 SpeedButton1.Enabled:=true;
 SpeedButton2.Enabled:=false;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin

Combobox1.ItemIndex:=0;
end;

procedure TForm1.N5Click(Sender: TObject);
begin
Stop:=true;
 SpeedButton1.Enabled:=true;
 SpeedButton2.Enabled:=false;
application.ProcessMessages;
Form1.Close;
end;

procedure TForm1.N4Click(Sender: TObject);
begin
showmessage('Автор программы Бышин Артем'+#13#10+'Версия программы 1.0');
end;

procedure TForm1.FormShow(Sender: TObject);
begin
loadList(Combobox2);
end;

end.
