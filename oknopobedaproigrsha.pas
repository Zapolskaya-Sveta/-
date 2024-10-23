unit oknopobedaproigrsha;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, sSpeedButton,
  Vcl.ExtCtrls, Vcl.Imaging.jpeg, acPNG, sLabel, Vcl.MPlayer;

type
  Tokno = class(TForm)
    Image1: TImage;
    настройки2: TsSpeedButton;
    продолжить: TsSpeedButton;
    Image2: TImage;
    обратнокуровням: TsSpeedButton;
    название: TsLabel;
    сообщениядляморальнойподдержки: TsLabel;
    набранныезвезды: TsLabel;
    заново2: TsSpeedButton;
    MediaPlayer1: TMediaPlayer;
    мученикокно: TImage;
    какоеслово: TsLabel;
    procedure обратнокуровнямClick(Sender: TObject);
    procedure продолжитьClick(Sender: TObject);
    procedure настройки2Click(Sender: TObject);
    procedure заново2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure MediaPlayer1Notify(Sender: TObject);

  private
    { Private declarations }
  public
  StopCalled: Boolean;
    { Public declarations }
  end;

var
  okno: Tokno;

implementation

{$R *.dfm}

uses play, glavnaya, nastroikii, igra;







procedure Tokno.FormCreate(Sender: TObject);
var fontway:string;
begin
fontway:=extractfilepath(application.ExeName);
addfontresource(PChar(fontway + 'шрифты\ofont.ru_Brahms Gotisch.ttf'));
addfontresource(PChar(fontway + 'шрифты\ofont.ru_Bowler.ttf'));
end;

procedure Tokno.FormDestroy(Sender: TObject);
var fontway:string;
begin
fontway:=extractfilepath(application.ExeName);
removefontresource(PChar(fontway + 'шрифты\ofont.ru_Brahms Gotisch.ttf'));
removefontresource(PChar(fontway + 'шрифты\ofont.ru_Bowler.ttf'));

end;

procedure Tokno.MediaPlayer1Notify(Sender: TObject);
begin
 begin
  with MediaPlayer1 do
  begin
    if NotifyValue = nvSuccessful then
    begin
      if not StopCalled then
      begin
        Notify := False;    //выкл уведмл
        Open;
        Play;

        Notify := True;        ///вкл уведомл
      end;
    end;
  end;
end;
end;

procedure Tokno.заново2Click(Sender: TObject);
begin
okno.MediaPlayer1.Notify:=false;
okno.StopCalled := true;
glavnayaa.MediaPlayer2.FileName:='Звук/8af5b2bf5d19c00.wav';
glavnayaa.MediaPlayer2.Open;
glavnayaa.MediaPlayer2.Play;

form2.клавиатура.Enabled:=true;
form2.StopCalled := false;
form2.MediaPlayer1.play;
MediaPlayer1.stop;
form2.sozdaniepanelee;
form2.мученик.Picture:=nil;
close;
end;



procedure Tokno.настройки2Click(Sender: TObject);
begin
glavnayaa.MediaPlayer2.FileName:='Звук/8af5b2bf5d19c00.wav';
glavnayaa.MediaPlayer2.Open;
glavnayaa.MediaPlayer2.Play;
nastroiki.showmodal;
end;





procedure Tokno.продолжитьClick(Sender: TObject);
begin
okno.MediaPlayer1.Notify:=false;
okno.StopCalled := true;
glavnayaa.MediaPlayer2.FileName:='Звук/8af5b2bf5d19c00.wav';
glavnayaa.MediaPlayer2.Open;
glavnayaa.MediaPlayer2.Play;
form2.StopCalled := false;
form2.MediaPlayer1.play;
MediaPlayer1.stop;
close;
end;





procedure Tokno.обратнокуровнямClick(Sender: TObject);
begin
okno.MediaPlayer1.Notify:=false;
okno.StopCalled := true;
glavnayaa.MediaPlayer2.FileName:='Звук/8af5b2bf5d19c00.wav';
glavnayaa.MediaPlayer2.Open;
glavnayaa.MediaPlayer2.Play;
urovni.панельуровнейкулинария.Visible:=false;
urovni.панельуровнейнаука.Visible:=false;
urovni.панельуровнейспорт.visible:=false;
urovni.Панельуровнейживотные.Visible:=false;
MediaPlayer1.stop;
close;
form2.Close;
end;





end.
