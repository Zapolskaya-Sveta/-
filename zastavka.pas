unit zastavka;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.ComCtrls,
  acProgressBar;

type
  Tzastavkaa = class(TForm)
    Image1: TImage;
    Timer1: TTimer;
    sProgressBar1: TsProgressBar;
    procedure Timer1Timer(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  zastavkaa: Tzastavkaa;

implementation

{$R *.dfm}





procedure Tzastavkaa.Timer1Timer(Sender: TObject);
begin
if sProgressBar1.position<sProgressBar1.max then
sProgressBar1.Position:=sProgressBar1.Position+10
else
begin
close;
timer1.Enabled:=False;
end;
end;

end.
