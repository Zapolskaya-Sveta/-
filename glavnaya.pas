unit glavnaya;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls,
  Vcl.Imaging.jpeg, sPanel, sButton, sSkinManager, sBevel, Vcl.MPlayer,MMSystem,
  Vcl.ComCtrls, sStatusBar, sLabel, Vcl.Menus, ShellAPI;

type
  Tglavnayaa = class(TForm)
    Image1: TImage;
    sSkinManager1: TsSkinManager;
    Начатьигру: TsButton;
    рекорды: TsButton;
    Правила: TsButton;
    настройки: TsButton;
    Выход: TsButton;
    MediaPlayer1: TMediaPlayer;
    MediaPlayer2: TMediaPlayer;
    справка: TMainMenu;
    N2: TMenuItem;
    N4: TMenuItem;
    N8: TMenuItem;
    N9: TMenuItem;

    procedure FormShow(Sender: TObject);
    procedure НачатьигруClick(Sender: TObject);
    procedure ПравилаClick(Sender: TObject);
    procedure ВыходClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure MediaPlayer1Notify(Sender: TObject);
    procedure настройкиClick(Sender: TObject);
    procedure рекордыClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure N9Click(Sender: TObject);
    procedure N2Click(Sender: TObject);










  private
    { Private declarations }
  public
    StopCalled: Boolean;
    { Public declarations }
     procedure SetVolume(Volume: integer);
  end;

var
  glavnayaa: Tglavnayaa;

implementation

{$R *.dfm}

uses zastavka, igra, pravilaa, play, nastroikii, recorrdu, obavtore;







procedure Tglavnayaa.SetVolume(Volume: integer);
var
  ConvertedVolume: DWORD;
begin

  if (Volume < nastroiki.sTrackBar1.Min) or (Volume > nastroiki.sTrackBar1.Max) then Exit;  //проверка на диапозон
  ConvertedVolume := Round((Volume / nastroiki.sTrackBar1.Max) * 32767);
  // Установка громкости
  waveOutSetVolume(0, MAKELONG(ConvertedVolume, ConvertedVolume));

end;



procedure Tglavnayaa.FormCreate(Sender: TObject);
var fontway:string;
begin
fontway:=extractfilepath(application.ExeName);
addfontresource(PChar(fontway + 'шрифты\ofont.ru_Brahms Gotisch.ttf'));
addfontresource(PChar(fontway + 'шрифты\ofont.ru_Bowler.ttf'));

MediaPlayer1.Visible:=false;
MediaPlayer1.FileName:='Звук/f95d59c3e76296a.wav';
MediaPlayer1.Open;
MediaPlayer1.Play;
MediaPlayer1.Notify:=true;
StopCalled := False;


end;

//zvuk



procedure Tglavnayaa.FormDestroy(Sender: TObject);
var fontway:string;
begin
fontway:=extractfilepath(application.ExeName);
removefontresource(PChar(fontway + 'шрифты\ofont.ru_Brahms Gotisch.ttf'));
removefontresource(PChar(fontway + 'шрифты\ofont.ru_Bowler.ttf'));

end;

procedure Tglavnayaa.FormShow(Sender: TObject);
begin
 zastavkaa.showmodal;
end;








procedure Tglavnayaa.MediaPlayer1Notify(Sender: TObject);
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






procedure Tglavnayaa.N2Click(Sender: TObject);
begin
ShellExecute(0,PChar('Open'),PChar('Справка.chm'),nil,nil,SW_SHOW);
end;

procedure Tglavnayaa.N9Click(Sender: TObject);
begin
close;
end;

procedure Tglavnayaa.НачатьигруClick(Sender: TObject);
begin
MediaPlayer2.FileName:='Звук/8af5b2bf5d19c00.wav';
MediaPlayer2.Open;
MediaPlayer2.Play;
urovni.showmodal;

end;

procedure Tglavnayaa.рекордыClick(Sender: TObject);
begin
recordu.showmodal;
end;

procedure Tglavnayaa.ПравилаClick(Sender: TObject);
begin
MediaPlayer2.FileName:='Звук/8af5b2bf5d19c00.wav';
MediaPlayer2.Open;
MediaPlayer2.Play;
pravila.show;
end;

procedure Tglavnayaa.настройкиClick(Sender: TObject);
begin
MediaPlayer2.FileName:='Звук/8af5b2bf5d19c00.wav';
MediaPlayer2.Open;
MediaPlayer2.Play;
nastroiki.showmodal;
end;

procedure Tglavnayaa.ВыходClick(Sender: TObject);
begin
MediaPlayer2.FileName:='Звук/8af5b2bf5d19c00.wav';
MediaPlayer2.Open;
MediaPlayer2.Play;
close;
end;

end.
