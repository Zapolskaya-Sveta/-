unit recorrdu;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, sMemo, Vcl.ExtCtrls,
  sButton, sLabel;

type
  Trecordu = class(TForm)
    Image1: TImage;
    sButton1: TsButton;
    ListBox1: TListBox;
    sLabel1: TsLabel;
    sButton2: TsButton;
    procedure sButton1Click(Sender: TObject);
    procedure LoadRecords;
    procedure ClearFile;
    procedure FormCreate(Sender: TObject);
    procedure sButton2Click(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  recordu: Trecordu;

implementation

{$R *.dfm}

uses glavnaya;

procedure Trecordu.sButton1Click(Sender: TObject);
begin
glavnayaa.MediaPlayer2.FileName:='Звук/8af5b2bf5d19c00.wav';
glavnayaa.MediaPlayer2.Open;
glavnayaa.MediaPlayer2.Play;
close;
end;


procedure Trecordu.sButton2Click(Sender: TObject);
begin
glavnayaa.MediaPlayer2.FileName:='Звук/8af5b2bf5d19c00.wav';
glavnayaa.MediaPlayer2.Open;
glavnayaa.MediaPlayer2.Play;
ListBox1.Clear;
 ClearFile;
end;

procedure Trecordu.FormCreate(Sender: TObject);
var fontway:string;
begin
fontway:=extractfilepath(application.ExeName);
addfontresource(PChar(fontway + 'шрифты\ofont.ru_Brahms Gotisch.ttf'));
addfontresource(PChar(fontway + 'шрифты\ofont.ru_Bowler.ttf'));
LoadRecords;
end;
procedure Trecordu.FormDestroy(Sender: TObject);
var fontway:string;
begin
fontway:=extractfilepath(application.ExeName);
removefontresource(PChar(fontway + 'шрифты\ofont.ru_Brahms Gotisch.ttf'));
removefontresource(PChar(fontway + 'шрифты\ofont.ru_Bowler.ttf'));

end;

//очистка
procedure Trecordu.ClearFile;
var
  RecordsFile: TStringList;
begin
  RecordsFile := TStringList.Create;
  try
    RecordsFile.SaveToFile('текстовые/рекорды.txt');
  finally
    RecordsFile.Free;
  end;
end;
 //запись из файла
procedure Trecordu.LoadRecords;
var
  RecordsList: TStringList;
  i: Integer;
begin
  RecordsList := TStringList.Create;
  try
    RecordsList.LoadFromFile('текстовые/рекорды.txt');
    for i := 0 to RecordsList.Count - 1 do
      recordu.ListBox1.Items.Add(RecordsList[i]);
  finally
    RecordsList.Free;
  end;
end;
end.
