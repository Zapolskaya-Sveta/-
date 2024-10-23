unit pravilaa;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.OleCtrls, SHDocVw,
  sButton, Vcl.ExtCtrls;

type
  Tpravila = class(TForm)
    WebBrowser1: TWebBrowser;
    sButton1: TsButton;
    Image1: TImage;
    procedure FormCreate(Sender: TObject);
    procedure sButton1Click(Sender: TObject);
    procedure FormDestroy(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  pravila: Tpravila;

implementation

{$R *.dfm}

uses glavnaya;



procedure Tpravila.FormCreate(Sender: TObject);
var fontway:string;
begin
fontway:=extractfilepath(application.ExeName);
addfontresource(PChar(fontway + 'רנטפעû\ofont.ru_Brahms Gotisch.ttf'));
addfontresource(PChar(fontway + 'רנטפעû\ofont.ru_Bowler.ttf'));
Webbrowser1.navigate(ExtractFilePath(paramstr(0))+'htm/ֿנאגטכא טדנû.htm');
end;




procedure Tpravila.FormDestroy(Sender: TObject);
var fontway:string;
begin
fontway:=extractfilepath(application.ExeName);
removefontresource(PChar(fontway + 'רנטפעû\ofont.ru_Brahms Gotisch.ttf'));
removefontresource(PChar(fontway + 'רנטפעû\ofont.ru_Bowler.ttf'));

end;

procedure Tpravila.sButton1Click(Sender: TObject);
begin
glavnayaa.MediaPlayer2.FileName:='ַגףך/8af5b2bf5d19c00.wav';
glavnayaa.MediaPlayer2.Open;
glavnayaa.MediaPlayer2.Play;
close;
end;

end.
