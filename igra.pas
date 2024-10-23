unit igra;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls,
  Vcl.Imaging.jpeg, sButton, sPanel, sLabel;

type
  Turovni = class(TForm)
    ������������: TEdit;
    Image1: TImage;
    �����������: TsLabel;
    ���������������������: TsPanel;
    Button5: TsButton;
    sButton2: TsButton;
    sButton3: TsButton;
    ������������������: TsPanel;
    sButton6: TsButton;
    sButton7: TsButton;
    sButton8: TsButton;
    ������������������: TsPanel;
    sButton1: TsButton;
    sButton4: TsButton;
    sButton5: TsButton;
    �����������: TsPanel;
    ��������: TsButton;
    �����: TsButton;
    �����������: TsButton;
    ���������: TsButton;
    �����: TsButton;
    ����������������������: TsPanel;
    sButton9: TsButton;
    sButton10: TsButton;
    sButton11: TsButton;

    procedure ��������Click(Sender: TObject);
    procedure ���������Click(Sender: TObject);
    procedure �����Click(Sender: TObject);
    procedure �����Click(Sender: TObject);
    procedure Button17Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure �����������Click(Sender: TObject);
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
glavnayaa.MediaPlayer2.FileName:='����/8af5b2bf5d19c00.wav';
glavnayaa.MediaPlayer2.Open;
glavnayaa.MediaPlayer2.Play;
close;
end;

procedure Turovni.��������Click(Sender: TObject);
begin
glavnayaa.MediaPlayer2.FileName:='����/8af5b2bf5d19c00.wav';
glavnayaa.MediaPlayer2.Open;
glavnayaa.MediaPlayer2.Play;
���������������������.Visible:=true;
������������������.Visible:=false;
����������������������.Visible:=false;
������������������.Visible:=false;
form2.����.caption:='';
form2.����.caption:='����: ��������';


end;

procedure Turovni.���������Click(Sender: TObject);
begin
glavnayaa.MediaPlayer2.FileName:='����/8af5b2bf5d19c00.wav';
glavnayaa.MediaPlayer2.Open;
glavnayaa.MediaPlayer2.Play;
����������������������.Visible:=true;
������������������.Visible:=false;
������������������.Visible:=false;
���������������������.Visible:=false;
form2.����.caption:='';
form2.����.caption:='����: ���������� �����';
end;

procedure Turovni.�����Click(Sender: TObject);
begin
glavnayaa.MediaPlayer2.FileName:='����/8af5b2bf5d19c00.wav';
glavnayaa.MediaPlayer2.Open;
glavnayaa.MediaPlayer2.Play;
����������������������.Visible:=false;
������������������.Visible:=false;
������������������.visible:=true;
���������������������.Visible:=false;

form2.����.caption:='';
form2.����.caption:='����: ��� ������';
end;

procedure Turovni.�����Click(Sender: TObject);
begin
glavnayaa.MediaPlayer2.FileName:='����/8af5b2bf5d19c00.wav';
glavnayaa.MediaPlayer2.Open;
glavnayaa.MediaPlayer2.Play;
������������������.Visible:=true;
����������������������.Visible:=false;
������������������.Visible:=false;
���������������������.Visible:=false;
form2.����.caption:='';
form2.����.caption:='����: �����';
end;

procedure Turovni.Button5Click(Sender: TObject);

begin
glavnayaa.MediaPlayer2.FileName:='����/8af5b2bf5d19c00.wav';
glavnayaa.MediaPlayer2.Open;
glavnayaa.MediaPlayer2.Play;
FileName := '���������/��������������.txt';
form2.Show;
glavnayaa.StopCalled := True;
glavnayaa.MediaPlayer1.Stop;
Form2.MediaPlayer1.Visible:=false;
Form2.MediaPlayer1.FileName:='����/1074b635e9877f4.wav';
Form2.MediaPlayer1.Open;
Form2.MediaPlayer1.Play;
Form2.MediaPlayer1.Notify:=true;
form2.StopCalled := False;
form2.�������.caption:='�������: ������';
end;




procedure Turovni.FormCreate(Sender: TObject);
var fontway:string;
begin
fontway:=extractfilepath(application.ExeName);
addfontresource(PChar(fontway + '������\ofont.ru_Brahms Gotisch.ttf'));
addfontresource(PChar(fontway + '������\ofont.ru_Bowler.ttf'));
end;

procedure Turovni.FormDestroy(Sender: TObject);
var fontway:string;
begin
fontway:=extractfilepath(application.ExeName);
removefontresource(PChar(fontway + '������\ofont.ru_Brahms Gotisch.ttf'));
removefontresource(PChar(fontway + '������\ofont.ru_Bowler.ttf'));

end;

procedure Turovni.sButton10Click(Sender: TObject);
begin
glavnayaa.MediaPlayer2.FileName:='����/8af5b2bf5d19c00.wav';
glavnayaa.MediaPlayer2.Open;
glavnayaa.MediaPlayer2.Play;
FileName := '���������/����������������.txt';
form2.Show;
glavnayaa.StopCalled := True;
glavnayaa.MediaPlayer1.Stop;
Form2.MediaPlayer1.Visible:=false;
Form2.MediaPlayer1.FileName:='����/1074b635e9877f4.wav';
Form2.MediaPlayer1.Open;
Form2.MediaPlayer1.Play;
Form2.MediaPlayer1.Notify:=true;
form2.StopCalled := False;
form2.�������.caption:='�������: �������';
end;

procedure Turovni.sButton11Click(Sender: TObject);
begin
glavnayaa.MediaPlayer2.FileName:='����/8af5b2bf5d19c00.wav';
glavnayaa.MediaPlayer2.Open;
glavnayaa.MediaPlayer2.Play;
FileName := '���������/����������������.txt';
form2.Show;
glavnayaa.StopCalled := True;
glavnayaa.MediaPlayer1.Stop;
Form2.MediaPlayer1.Visible:=false;
Form2.MediaPlayer1.FileName:='����/1074b635e9877f4.wav';
Form2.MediaPlayer1.Open;
Form2.MediaPlayer1.Play;
Form2.MediaPlayer1.Notify:=true;
form2.StopCalled := False;
form2.�������.caption:='�������: �������';
end;

procedure Turovni.sButton1Click(Sender: TObject);
begin
glavnayaa.MediaPlayer2.FileName:='����/8af5b2bf5d19c00.wav';
glavnayaa.MediaPlayer2.Open;
glavnayaa.MediaPlayer2.Play;
FileName := '���������/�����������.txt';
form2.Show;
glavnayaa.StopCalled := True;
glavnayaa.MediaPlayer1.Stop;
Form2.MediaPlayer1.Visible:=false;
Form2.MediaPlayer1.FileName:='����/1074b635e9877f4.wav';
Form2.MediaPlayer1.Open;
Form2.MediaPlayer1.Play;
Form2.MediaPlayer1.Notify:=true;
form2.StopCalled := False;
form2.�������.caption:='�������: �����';
end;

procedure Turovni.sButton2Click(Sender: TObject);
begin
glavnayaa.MediaPlayer2.FileName:='����/8af5b2bf5d19c00.wav';
glavnayaa.MediaPlayer2.Open;
glavnayaa.MediaPlayer2.Play;
FileName := '���������/���������������.txt';
form2.Show;
glavnayaa.StopCalled := True;
glavnayaa.MediaPlayer1.Stop;
Form2.MediaPlayer1.Visible:=false;
Form2.MediaPlayer1.FileName:='����/1074b635e9877f4.wav';
Form2.MediaPlayer1.Open;
Form2.MediaPlayer1.Play;
Form2.MediaPlayer1.Notify:=true;
form2.StopCalled := False;
form2.�������.caption:='�������: �������';
end;

procedure Turovni.sButton3Click(Sender: TObject);
begin
glavnayaa.MediaPlayer2.FileName:='����/8af5b2bf5d19c00.wav';
glavnayaa.MediaPlayer2.Open;
glavnayaa.MediaPlayer2.Play;
FileName := '���������/���������������.txt';
form2.Show;
glavnayaa.StopCalled := True;
glavnayaa.MediaPlayer1.Stop;
Form2.MediaPlayer1.Visible:=false;
Form2.MediaPlayer1.FileName:='����/1074b635e9877f4.wav';
Form2.MediaPlayer1.Open;
Form2.MediaPlayer1.Play;
Form2.MediaPlayer1.Notify:=true;
form2.StopCalled := False;
form2.�������.caption:='�������: �������';
end;


procedure Turovni.sButton4Click(Sender: TObject);
begin
glavnayaa.MediaPlayer2.FileName:='����/8af5b2bf5d19c00.wav';
glavnayaa.MediaPlayer2.Open;
glavnayaa.MediaPlayer2.Play;
FileName := '���������/������������.txt';
form2.Show;
glavnayaa.StopCalled := True;
glavnayaa.MediaPlayer1.Stop;
Form2.MediaPlayer1.Visible:=false;
Form2.MediaPlayer1.FileName:='����/1074b635e9877f4.wav';
Form2.MediaPlayer1.Open;
Form2.MediaPlayer1.Play;
Form2.MediaPlayer1.Notify:=true;
form2.StopCalled := False;
form2.�������.caption:='�������: �������';
end;

procedure Turovni.sButton5Click(Sender: TObject);
begin
glavnayaa.MediaPlayer2.FileName:='����/8af5b2bf5d19c00.wav';
glavnayaa.MediaPlayer2.Open;
glavnayaa.MediaPlayer2.Play;
FileName := '���������/������������.txt';
form2.Show;
glavnayaa.StopCalled := True;
glavnayaa.MediaPlayer1.Stop;
Form2.MediaPlayer1.Visible:=false;
Form2.MediaPlayer1.FileName:='����/1074b635e9877f4.wav';
Form2.MediaPlayer1.Open;
Form2.MediaPlayer1.Play;
Form2.MediaPlayer1.Notify:=true;
form2.StopCalled := False;
form2.�������.caption:='�������: �������';
end;

procedure Turovni.sButton6Click(Sender: TObject);
begin
glavnayaa.MediaPlayer2.FileName:='����/8af5b2bf5d19c00.wav';
glavnayaa.MediaPlayer2.Open;
glavnayaa.MediaPlayer2.Play;
FileName := '���������/�����������.txt';
form2.Show;
glavnayaa.StopCalled := True;
glavnayaa.MediaPlayer1.Stop;
Form2.MediaPlayer1.Visible:=false;
Form2.MediaPlayer1.FileName:='����/1074b635e9877f4.wav';
Form2.MediaPlayer1.Open;
Form2.MediaPlayer1.Play;
Form2.MediaPlayer1.Notify:=true;
form2.StopCalled := False;
form2.�������.caption:='�������: �����';
end;

procedure Turovni.sButton7Click(Sender: TObject);
begin
glavnayaa.MediaPlayer2.FileName:='����/8af5b2bf5d19c00.wav';
glavnayaa.MediaPlayer2.Open;
glavnayaa.MediaPlayer2.Play;
FileName := '���������/������������.txt';
form2.Show;
glavnayaa.StopCalled := True;
glavnayaa.MediaPlayer1.Stop;
Form2.MediaPlayer1.Visible:=false;
Form2.MediaPlayer1.FileName:='����/1074b635e9877f4.wav';
Form2.MediaPlayer1.Open;
Form2.MediaPlayer1.Play;
Form2.MediaPlayer1.Notify:=true;
form2.StopCalled := False;
form2.�������.caption:='�������: �������';
end;

procedure Turovni.sButton8Click(Sender: TObject);
begin
glavnayaa.MediaPlayer2.FileName:='����/8af5b2bf5d19c00.wav';
glavnayaa.MediaPlayer2.Open;
glavnayaa.MediaPlayer2.Play;
FileName := '���������/������������.txt';
form2.Show;
glavnayaa.StopCalled := True;
glavnayaa.MediaPlayer1.Stop;
Form2.MediaPlayer1.Visible:=false;
Form2.MediaPlayer1.FileName:='����/1074b635e9877f4.wav';
Form2.MediaPlayer1.Open;
Form2.MediaPlayer1.Play;
Form2.MediaPlayer1.Notify:=true;
form2.StopCalled := False;
form2.�������.caption:='�������: �������';
end;

procedure Turovni.sButton9Click(Sender: TObject);
begin
glavnayaa.MediaPlayer2.FileName:='����/8af5b2bf5d19c00.wav';
glavnayaa.MediaPlayer2.Open;
glavnayaa.MediaPlayer2.Play;
FileName := '���������/���������������.txt';
form2.Show;
glavnayaa.StopCalled := True;
glavnayaa.MediaPlayer1.Stop;
Form2.MediaPlayer1.Visible:=false;
Form2.MediaPlayer1.FileName:='����/1074b635e9877f4.wav';
Form2.MediaPlayer1.Open;
Form2.MediaPlayer1.Play;
Form2.MediaPlayer1.Notify:=true;
form2.StopCalled := False;
form2.�������.caption:='�������: �����';
end;

procedure Turovni.�����������Click(Sender: TObject);
begin
glavnayaa.MediaPlayer2.FileName:='����/8af5b2bf5d19c00.wav';
glavnayaa.MediaPlayer2.Open;
glavnayaa.MediaPlayer2.Play;
����������������������.Visible:=false;
������������������.Visible:=false;
������������������.visible:=false;
���������������������.Visible:=false;
close;
end;

end.
