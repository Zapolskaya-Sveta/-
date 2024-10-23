unit obavtore;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.OleCtrls, SHDocVw,
  Vcl.StdCtrls, sButton;

type
  Tobavtorre = class(TForm)
    Image1: TImage;
    WebBrowser1: TWebBrowser;
    sButton1: TsButton;
    procedure sButton1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  obavtorre: Tobavtorre;

implementation

{$R *.dfm}

procedure Tobavtorre.sButton1Click(Sender: TObject);
begin
close;
end;

end.
