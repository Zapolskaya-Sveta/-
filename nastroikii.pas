unit nastroikii;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ComCtrls, Vcl.MPlayer,
  sTrackBar, sLabel, sButton, sCheckBox, Vcl.Imaging.jpeg, Vcl.ExtCtrls;

type
  Tnastroiki = class(TForm)
    sTrackBar1: TsTrackBar;
    Назад: TsButton;
    sCheckBox1: TsCheckBox;
    Image1: TImage;
    sLabel1: TsLabel;
    sLabel2: TsLabel;

    procedure sTrackBar1Change(Sender: TObject);
    procedure НазадClick(Sender: TObject);
    procedure sCheckBox1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);






  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  nastroiki: Tnastroiki;

implementation

{$R *.dfm}

uses glavnaya, play;







procedure Tnastroiki.FormCreate(Sender: TObject);
var fontway:string;
begin
fontway:=extractfilepath(application.ExeName);
addfontresource(PChar(fontway + 'шрифты\ofont.ru_Brahms Gotisch.ttf'));
addfontresource(PChar(fontway + 'шрифты\ofont.ru_Bowler.ttf'));

end;

procedure Tnastroiki.FormDestroy(Sender: TObject);
var fontway:string;
begin
fontway:=extractfilepath(application.ExeName);
removefontresource(PChar(fontway + 'шрифты\ofont.ru_Brahms Gotisch.ttf'));
removefontresource(PChar(fontway + 'шрифты\ofont.ru_Bowler.ttf'));

end;

procedure Tnastroiki.sCheckBox1Click(Sender: TObject);
begin
glavnayaa.MediaPlayer2.FileName:='Звук/8af5b2bf5d19c00.wav';
glavnayaa.MediaPlayer2.Open;
glavnayaa.MediaPlayer2.Play;
if sCheckBox1.Checked then
begin
sTrackBar1.position:=32767;
  sCheckBox1.Caption := 'вкл';
end
else
begin
  sCheckBox1.Caption := 'выкл';
sTrackBar1.position:=0;
end;
end;




procedure Tnastroiki.sTrackBar1Change(Sender: TObject);
begin
 glavnayaa.SetVolume(sTrackBar1.Position);
end;




procedure Tnastroiki.НазадClick(Sender: TObject);
begin
glavnayaa.MediaPlayer2.FileName:='Звук/8af5b2bf5d19c00.wav';
glavnayaa.MediaPlayer2.Open;
glavnayaa.MediaPlayer2.Play;
close;
end;

end.
