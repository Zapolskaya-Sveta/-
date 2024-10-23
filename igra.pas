unit igra;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls,
  Vcl.Imaging.jpeg, sButton, sPanel, sLabel;

type
  Turovni = class(TForm)
    вводникнейма: TEdit;
    Image1: TImage;
    текствашник: TsLabel;
    Панельуровнейживотные: TsPanel;
    Button5: TsButton;
    sButton2: TsButton;
    sButton3: TsButton;
    панельуровнейнаука: TsPanel;
    sButton6: TsButton;
    sButton7: TsButton;
    sButton8: TsButton;
    панельуровнейспорт: TsPanel;
    sButton1: TsButton;
    sButton4: TsButton;
    sButton5: TsButton;
    Выьоруровня: TsPanel;
    животные: TsButton;
    Наука: TsButton;
    кнопканазад: TsButton;
    кулинария: TsButton;
    спорт: TsButton;
    панельуровнейкулинария: TsPanel;
    sButton9: TsButton;
    sButton10: TsButton;
    sButton11: TsButton;

    procedure животныеClick(Sender: TObject);
    procedure кулинарияClick(Sender: TObject);
    procedure НаукаClick(Sender: TObject);
    procedure спортClick(Sender: TObject);
    procedure Button17Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure кнопканазадClick(Sender: TObject);
    procedure sButton2Click(Sender: TObject);
    procedure sButton3Click(Sender: TObject);
    procedure sButton9Click(Sender: TObject);
    procedure sButton10Click(Sender: TObject);
    procedure sButton11Click(Sender: TObject);
    procedure sButton6Click(Sender: TObject);
    procedure sButton7Click(Sender: TObject);
    procedure sButton8Click(Sender: TObject);
    procedure sButton1Click(Sender: TObject);
    procedure sButton4Click(Sender: TObject);
    procedure sButton5Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);




  private
    { Private declarations }
  public
      FileName: string;

    { Public declarations }
  end;

var
  urovni: Turovni;


implementation

{$R *.dfm}

uses glavnaya, play;

procedure Turovni.Button17Click(Sender: TObject);
begin
glavnayaa.MediaPlayer2.FileName:='Звук/8af5b2bf5d19c00.wav';
glavnayaa.MediaPlayer2.Open;
glavnayaa.MediaPlayer2.Play;
close;
end;

procedure Turovni.животныеClick(Sender: TObject);
begin
glavnayaa.MediaPlayer2.FileName:='Звук/8af5b2bf5d19c00.wav';
glavnayaa.MediaPlayer2.Open;
glavnayaa.MediaPlayer2.Play;
Панельуровнейживотные.Visible:=true;
панельуровнейнаука.Visible:=false;
панельуровнейкулинария.Visible:=false;
панельуровнейспорт.Visible:=false;
form2.тема.caption:='';
form2.тема.caption:='Тема: животное';


end;

procedure Turovni.кулинарияClick(Sender: TObject);
begin
glavnayaa.MediaPlayer2.FileName:='Звук/8af5b2bf5d19c00.wav';
glavnayaa.MediaPlayer2.Open;
glavnayaa.MediaPlayer2.Play;
панельуровнейкулинария.Visible:=true;
панельуровнейнаука.Visible:=false;
панельуровнейспорт.Visible:=false;
Панельуровнейживотные.Visible:=false;
form2.тема.caption:='';
form2.тема.caption:='Тема: кулинарные блюда';
end;

procedure Turovni.спортClick(Sender: TObject);
begin
glavnayaa.MediaPlayer2.FileName:='Звук/8af5b2bf5d19c00.wav';
glavnayaa.MediaPlayer2.Open;
glavnayaa.MediaPlayer2.Play;
панельуровнейкулинария.Visible:=false;
панельуровнейнаука.Visible:=false;
панельуровнейспорт.visible:=true;
Панельуровнейживотные.Visible:=false;

form2.тема.caption:='';
form2.тема.caption:='Тема: вид спорта';
end;

procedure Turovni.НаукаClick(Sender: TObject);
begin
glavnayaa.MediaPlayer2.FileName:='Звук/8af5b2bf5d19c00.wav';
glavnayaa.MediaPlayer2.Open;
glavnayaa.MediaPlayer2.Play;
панельуровнейнаука.Visible:=true;
панельуровнейкулинария.Visible:=false;
панельуровнейспорт.Visible:=false;
Панельуровнейживотные.Visible:=false;
form2.тема.caption:='';
form2.тема.caption:='Тема: наука';
end;

procedure Turovni.Button5Click(Sender: TObject);

begin
glavnayaa.MediaPlayer2.FileName:='Звук/8af5b2bf5d19c00.wav';
glavnayaa.MediaPlayer2.Open;
glavnayaa.MediaPlayer2.Play;
FileName := 'текстовые/животныелегкий.txt';
form2.Show;
glavnayaa.StopCalled := True;
glavnayaa.MediaPlayer1.Stop;
Form2.MediaPlayer1.Visible:=false;
Form2.MediaPlayer1.FileName:='Звук/1074b635e9877f4.wav';
Form2.MediaPlayer1.Open;
Form2.MediaPlayer1.Play;
Form2.MediaPlayer1.Notify:=true;
form2.StopCalled := False;
form2.уровень.caption:='Уровень: легкий';
end;




procedure Turovni.FormCreate(Sender: TObject);
var fontway:string;
begin
fontway:=extractfilepath(application.ExeName);
addfontresource(PChar(fontway + 'шрифты\ofont.ru_Brahms Gotisch.ttf'));
addfontresource(PChar(fontway + 'шрифты\ofont.ru_Bowler.ttf'));
end;

procedure Turovni.FormDestroy(Sender: TObject);
var fontway:string;
begin
fontway:=extractfilepath(application.ExeName);
removefontresource(PChar(fontway + 'шрифты\ofont.ru_Brahms Gotisch.ttf'));
removefontresource(PChar(fontway + 'шрифты\ofont.ru_Bowler.ttf'));

end;

procedure Turovni.sButton10Click(Sender: TObject);
begin
glavnayaa.MediaPlayer2.FileName:='Звук/8af5b2bf5d19c00.wav';
glavnayaa.MediaPlayer2.Open;
glavnayaa.MediaPlayer2.Play;
FileName := 'текстовые/кулинариясредний.txt';
form2.Show;
glavnayaa.StopCalled := True;
glavnayaa.MediaPlayer1.Stop;
Form2.MediaPlayer1.Visible:=false;
Form2.MediaPlayer1.FileName:='Звук/1074b635e9877f4.wav';
Form2.MediaPlayer1.Open;
Form2.MediaPlayer1.Play;
Form2.MediaPlayer1.Notify:=true;
form2.StopCalled := False;
form2.уровень.caption:='Уровень: средний';
end;

procedure Turovni.sButton11Click(Sender: TObject);
begin
glavnayaa.MediaPlayer2.FileName:='Звук/8af5b2bf5d19c00.wav';
glavnayaa.MediaPlayer2.Open;
glavnayaa.MediaPlayer2.Play;
FileName := 'текстовые/кулинариясложный.txt';
form2.Show;
glavnayaa.StopCalled := True;
glavnayaa.MediaPlayer1.Stop;
Form2.MediaPlayer1.Visible:=false;
Form2.MediaPlayer1.FileName:='Звук/1074b635e9877f4.wav';
Form2.MediaPlayer1.Open;
Form2.MediaPlayer1.Play;
Form2.MediaPlayer1.Notify:=true;
form2.StopCalled := False;
form2.уровень.caption:='Уровень: сложный';
end;

procedure Turovni.sButton1Click(Sender: TObject);
begin
glavnayaa.MediaPlayer2.FileName:='Звук/8af5b2bf5d19c00.wav';
glavnayaa.MediaPlayer2.Open;
glavnayaa.MediaPlayer2.Play;
FileName := 'текстовые/спортлегкий.txt';
form2.Show;
glavnayaa.StopCalled := True;
glavnayaa.MediaPlayer1.Stop;
Form2.MediaPlayer1.Visible:=false;
Form2.MediaPlayer1.FileName:='Звук/1074b635e9877f4.wav';
Form2.MediaPlayer1.Open;
Form2.MediaPlayer1.Play;
Form2.MediaPlayer1.Notify:=true;
form2.StopCalled := False;
form2.уровень.caption:='Уровень: лёгкий';
end;

procedure Turovni.sButton2Click(Sender: TObject);
begin
glavnayaa.MediaPlayer2.FileName:='Звук/8af5b2bf5d19c00.wav';
glavnayaa.MediaPlayer2.Open;
glavnayaa.MediaPlayer2.Play;
FileName := 'текстовые/животныесредний.txt';
form2.Show;
glavnayaa.StopCalled := True;
glavnayaa.MediaPlayer1.Stop;
Form2.MediaPlayer1.Visible:=false;
Form2.MediaPlayer1.FileName:='Звук/1074b635e9877f4.wav';
Form2.MediaPlayer1.Open;
Form2.MediaPlayer1.Play;
Form2.MediaPlayer1.Notify:=true;
form2.StopCalled := False;
form2.уровень.caption:='Уровень: средний';
end;

procedure Turovni.sButton3Click(Sender: TObject);
begin
glavnayaa.MediaPlayer2.FileName:='Звук/8af5b2bf5d19c00.wav';
glavnayaa.MediaPlayer2.Open;
glavnayaa.MediaPlayer2.Play;
FileName := 'текстовые/животныесложный.txt';
form2.Show;
glavnayaa.StopCalled := True;
glavnayaa.MediaPlayer1.Stop;
Form2.MediaPlayer1.Visible:=false;
Form2.MediaPlayer1.FileName:='Звук/1074b635e9877f4.wav';
Form2.MediaPlayer1.Open;
Form2.MediaPlayer1.Play;
Form2.MediaPlayer1.Notify:=true;
form2.StopCalled := False;
form2.уровень.caption:='Уровень: сложный';
end;


procedure Turovni.sButton4Click(Sender: TObject);
begin
glavnayaa.MediaPlayer2.FileName:='Звук/8af5b2bf5d19c00.wav';
glavnayaa.MediaPlayer2.Open;
glavnayaa.MediaPlayer2.Play;
FileName := 'текстовые/спортсредний.txt';
form2.Show;
glavnayaa.StopCalled := True;
glavnayaa.MediaPlayer1.Stop;
Form2.MediaPlayer1.Visible:=false;
Form2.MediaPlayer1.FileName:='Звук/1074b635e9877f4.wav';
Form2.MediaPlayer1.Open;
Form2.MediaPlayer1.Play;
Form2.MediaPlayer1.Notify:=true;
form2.StopCalled := False;
form2.уровень.caption:='Уровень: средний';
end;

procedure Turovni.sButton5Click(Sender: TObject);
begin
glavnayaa.MediaPlayer2.FileName:='Звук/8af5b2bf5d19c00.wav';
glavnayaa.MediaPlayer2.Open;
glavnayaa.MediaPlayer2.Play;
FileName := 'текстовые/спортсложный.txt';
form2.Show;
glavnayaa.StopCalled := True;
glavnayaa.MediaPlayer1.Stop;
Form2.MediaPlayer1.Visible:=false;
Form2.MediaPlayer1.FileName:='Звук/1074b635e9877f4.wav';
Form2.MediaPlayer1.Open;
Form2.MediaPlayer1.Play;
Form2.MediaPlayer1.Notify:=true;
form2.StopCalled := False;
form2.уровень.caption:='Уровень: сложный';
end;

procedure Turovni.sButton6Click(Sender: TObject);
begin
glavnayaa.MediaPlayer2.FileName:='Звук/8af5b2bf5d19c00.wav';
glavnayaa.MediaPlayer2.Open;
glavnayaa.MediaPlayer2.Play;
FileName := 'текстовые/наукалегкий.txt';
form2.Show;
glavnayaa.StopCalled := True;
glavnayaa.MediaPlayer1.Stop;
Form2.MediaPlayer1.Visible:=false;
Form2.MediaPlayer1.FileName:='Звук/1074b635e9877f4.wav';
Form2.MediaPlayer1.Open;
Form2.MediaPlayer1.Play;
Form2.MediaPlayer1.Notify:=true;
form2.StopCalled := False;
form2.уровень.caption:='Уровень: лёгкий';
end;

procedure Turovni.sButton7Click(Sender: TObject);
begin
glavnayaa.MediaPlayer2.FileName:='Звук/8af5b2bf5d19c00.wav';
glavnayaa.MediaPlayer2.Open;
glavnayaa.MediaPlayer2.Play;
FileName := 'текстовые/наукасредний.txt';
form2.Show;
glavnayaa.StopCalled := True;
glavnayaa.MediaPlayer1.Stop;
Form2.MediaPlayer1.Visible:=false;
Form2.MediaPlayer1.FileName:='Звук/1074b635e9877f4.wav';
Form2.MediaPlayer1.Open;
Form2.MediaPlayer1.Play;
Form2.MediaPlayer1.Notify:=true;
form2.StopCalled := False;
form2.уровень.caption:='Уровень: средний';
end;

procedure Turovni.sButton8Click(Sender: TObject);
begin
glavnayaa.MediaPlayer2.FileName:='Звук/8af5b2bf5d19c00.wav';
glavnayaa.MediaPlayer2.Open;
glavnayaa.MediaPlayer2.Play;
FileName := 'текстовые/наукасложный.txt';
form2.Show;
glavnayaa.StopCalled := True;
glavnayaa.MediaPlayer1.Stop;
Form2.MediaPlayer1.Visible:=false;
Form2.MediaPlayer1.FileName:='Звук/1074b635e9877f4.wav';
Form2.MediaPlayer1.Open;
Form2.MediaPlayer1.Play;
Form2.MediaPlayer1.Notify:=true;
form2.StopCalled := False;
form2.уровень.caption:='Уровень: сложный';
end;

procedure Turovni.sButton9Click(Sender: TObject);
begin
glavnayaa.MediaPlayer2.FileName:='Звук/8af5b2bf5d19c00.wav';
glavnayaa.MediaPlayer2.Open;
glavnayaa.MediaPlayer2.Play;
FileName := 'текстовые/кулинариялегкий.txt';
form2.Show;
glavnayaa.StopCalled := True;
glavnayaa.MediaPlayer1.Stop;
Form2.MediaPlayer1.Visible:=false;
Form2.MediaPlayer1.FileName:='Звук/1074b635e9877f4.wav';
Form2.MediaPlayer1.Open;
Form2.MediaPlayer1.Play;
Form2.MediaPlayer1.Notify:=true;
form2.StopCalled := False;
form2.уровень.caption:='Уровень: лёгкий';
end;

procedure Turovni.кнопканазадClick(Sender: TObject);
begin
glavnayaa.MediaPlayer2.FileName:='Звук/8af5b2bf5d19c00.wav';
glavnayaa.MediaPlayer2.Open;
glavnayaa.MediaPlayer2.Play;
панельуровнейкулинария.Visible:=false;
панельуровнейнаука.Visible:=false;
панельуровнейспорт.visible:=false;
Панельуровнейживотные.Visible:=false;
close;
end;

end.
