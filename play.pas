unit play;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.Menus, Vcl.Buttons, Vcl.MPlayer,MMSystem,
  Vcl.Imaging.jpeg, acPNG, sBevel, sLabel, sListBox;

type
  TForm2 = class(TForm)
    ����������: TPanel;
    �: TButton;
    �: TButton;
    �: TButton;
    �: TButton;
    �: TButton;
    �: TButton;
    �: TButton;
    �: TButton;
    �: TButton;
    �: TButton;
    �: TButton;
    �: TButton;
    �: TButton;
    �: TButton;
    �: TButton;
    �: TButton;
    �: TButton;
    �: TButton;
    �: TButton;
    �: TButton;
    �: TButton;
    �: TButton;
    �: TButton;
    �: TButton;
    �: TButton;
    �: TButton;
    �: TButton;
    �: TButton;
    �: TButton;
    �: TButton;
    �: TButton;
    �: TButton;
    �: TButton;
    ���: TImage;
    MediaPlayer1: TMediaPlayer;
    �������: TImage;
    ���������: TSpeedButton;
    �����: TSpeedButton;
    ������: TSpeedButton;
    ������: TImage;
    �������������������: TImage;
    ���������: TSpeedButton;
    sBevel1: TsBevel;
    ����: TsLabel;
    �������: TsLabel;
    ����������������: TsLabel;
    ������: TsLabel;
    ��������: TsLabel;
    ���������: TsLabel;
    ������������: TsLabel;
    ���������: TsLabel;
    Timer1: TTimer;
    MediaPlayer2: TMediaPlayer;


    procedure AlphabetButtonClick(Sender: TObject);


    procedure FormClose(Sender: TObject; var Action: TCloseAction);

    procedure MediaPlayer1Notify(Sender: TObject);


    procedure ���������Click(Sender: TObject);
    procedure ������Click(Sender: TObject);
    procedure �����Click(Sender: TObject);

    procedure proverkabukv(Sender: TObject);

    procedure �������������������MouseEnter(Sender: TObject);
    procedure �������������������MouseLeave(Sender: TObject);
    procedure ���������Click(Sender: TObject);
    procedure sozdaniepanelee;
    procedure �����MouseEnter(Sender: TObject);
    procedure �����MouseLeave(Sender: TObject);
    procedure ������MouseEnter(Sender: TObject);
    procedure ������MouseLeave(Sender: TObject);
    procedure ���������MouseEnter(Sender: TObject);
    procedure ���������MouseLeave(Sender: TObject);
    procedure ���������MouseEnter(Sender: TObject);
    procedure ���������MouseLeave(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure SaveRecordToFile;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);



  private
   LetterPanels: array of TPanel;
    { Private declarations }

  public
    StopCalled: Boolean;
     Guessed: Boolean;
    { Public declarations }
  end;

var
  Form2: TForm2;
    Lines: TStringList;
      Attempts: Integer;

  Word: string;
    WordList: TStringList;
     Attempt: Integer;
     Attemptss: Integer;
implementation

{$R *.dfm}

uses glavnaya, igra, nastroikii, oknopobedaproigrsha, pravilaa, recorrdu;

















procedure TForm2.FormClose(Sender: TObject; var Action: TCloseAction);       //��������
var
  i: Integer;
  Component: TComponent;
begin
  for i := Low(LetterPanels) to High(LetterPanels) do
    LetterPanels[i].Free;
  SetLength(LetterPanels, 0);

  for i := 0 to ComponentCount - 1 do
  begin
    Component := Components[i];
    if (Component is TButton) then
      TButton(Component).Enabled := True;
  end;


  ����������������.Caption := '';
  ������.Caption := '';
  Attempts := 8; //���������
  Attempt := 8; //�������
   Attemptss:=10;    //������
form2.StopCalled := True;
form2.MediaPlayer1.Stop;
glavnayaa.MediaPlayer1.play;
glavnayaa.StopCalled := False;
���������.Enabled := True;
���������.Enabled:=true;
 ����������.Enabled:=false;
 form2.�������.Picture:=nil;
end;


procedure TForm2.FormCreate(Sender: TObject);
var fontway:string;
begin
fontway:=extractfilepath(application.ExeName);
addfontresource(PChar(fontway + '������\ofont.ru_Brahms Gotisch.ttf'));
addfontresource(PChar(fontway + '������\ofont.ru_Bowler.ttf'));
end;

procedure TForm2.FormDestroy(Sender: TObject);
var fontway:string;
begin
fontway:=extractfilepath(application.ExeName);
removefontresource(PChar(fontway + '������\ofont.ru_Brahms Gotisch.ttf'));
removefontresource(PChar(fontway + '������\ofont.ru_Bowler.ttf'));

end;

procedure TForm2.MediaPlayer1Notify(Sender: TObject);
begin
begin
  with MediaPlayer1 do
  begin
    if NotifyValue = nvSuccessful then
    begin
      if not StopCalled then
      begin
        Notify := False;
        Play;
        Notify := True;
      end;
    end;
  end;
end;
end;





procedure TForm2.���������Click(Sender: TObject);

var
  i: Integer;
  HintUsed: Boolean;
  CurrentLetter: Char;

begin
glavnayaa.MediaPlayer2.FileName:='����/8af5b2bf5d19c00.wav';
glavnayaa.MediaPlayer2.Open;
glavnayaa.MediaPlayer2.Play;
  HintUsed := False;

  // ��������, �������� �� ��� ���������
  if Attempts > 0 then
  begin
    // ������ ������ ������ ��� ����� � ��������� ��������� �����
    for i := 0 to Length(Word) - 1 do
    begin
      if (i < Length(LetterPanels)) and (LetterPanels[i].Caption = '') then
      begin
        CurrentLetter := Word[i + 1];
        HintUsed := True;
        Break; // ������ �� ����� ����� ���������� ������ ������ ������
      end;
    end;

    // ���� �������������� ���������, ��������� ��� ������ � ���� ������
    if HintUsed then
    begin
      for i := 0 to Length(Word) - 1 do
      begin
        if (i < Length(LetterPanels)) and (Word[i + 1] = CurrentLetter) then
        begin
          LetterPanels[i].Caption := AnsiUpperCase(CurrentLetter);
        end;
      end;
      Dec(Attempts);
      ����������������.Caption := '� ��� �������� ' + IntToStr(Attempts) + ' ���������';
      Dec(Attemptss);
     begin
    if Attemptss > 0 then
      ������.Caption := IntToStr(Attemptss)
    else
      ������.Caption := '0';
     end;

      proverkabukv(Sender); // ��������, ��� �� ����� ��������
    end;

  end;

  // ���� ��������� �� ��������, ��������� ������
  if Attempts = 0 then
  begin
    TButton(Sender).Enabled := False;
    ����������������.Caption := '��������� �����������';
  end;
end;

procedure TForm2.���������MouseEnter(Sender: TObject);
begin
������������.Visible :=true;
end;

procedure TForm2.���������MouseLeave(Sender: TObject);
begin
������������.Visible :=false;
end;

procedure TForm2.proverkabukv(Sender: TObject);
var
  i: Integer;
begin
  // ���������, ��� �� ����� ��������
  Guessed := True;
  for i := Low(LetterPanels) to High(LetterPanels) do
  begin
    if LetterPanels[i].Caption = '' then
    begin
      Guessed := False;
      Break;
    end;
  end;

  if Guessed then
  begin
    Timer1.Enabled := True;
  end;
end;

procedure TForm2.�����Click(Sender: TObject);
begin
glavnayaa.MediaPlayer2.FileName:='����/8af5b2bf5d19c00.wav';
glavnayaa.MediaPlayer2.Open;
glavnayaa.MediaPlayer2.Play;
 okno.�����������.Picture.LoadFromFile('img/img10spit.png');
  StopCalled := True;
    MediaPlayer1.Stop;
    okno.MediaPlayer1.FileName := '����/�����.wav';
      okno.MediaPlayer1.Open;
      okno.MediaPlayer1.Play;
      okno.MediaPlayer1.Notify:=true;
      okno.StopCalled := False;

okno.������2.Visible:=false;
okno.����������.Visible:=true;
okno.Image2.visible:=false;
okno.��������.caption:='�����';
 okno.������������������������������.caption:='���� ��������������';
okno.����������.Visible:=false;
okno.��������.left:=213;
 okno.������������������������������.left:=85;
  okno.������������������������������.top:=154;
    okno.���������������.Caption:='';
okno.showmodal;


end;

procedure TForm2.�����MouseEnter(Sender: TObject);
begin
��������.Visible :=true;
end;

procedure TForm2.�����MouseLeave(Sender: TObject);
begin
��������.Visible :=false;
end;

procedure TForm2.������Click(Sender: TObject);
begin
glavnayaa.MediaPlayer2.FileName:='����/8af5b2bf5d19c00.wav';
glavnayaa.MediaPlayer2.Open;
glavnayaa.MediaPlayer2.Play;
 sozdaniepanelee;
 ����������.Enabled:=true;
end;



procedure TForm2.������MouseEnter(Sender: TObject);
begin
���������.Visible :=true;
end;

procedure TForm2.������MouseLeave(Sender: TObject);
begin
���������.Visible :=false;
end;

procedure TForm2.sozdaniepanelee;
var
  RandomLine: string;
  i: Integer;
  Panel: TPanel;
  Component: TComponent;
  PanelLeft: Integer;
begin
  glavnayaa.MediaPlayer2.FileName := '����/8af5b2bf5d19c00.wav';
  glavnayaa.MediaPlayer2.Open;
  glavnayaa.MediaPlayer2.Play;


  // �������� ������ �������
  for i := Low(LetterPanels) to High(LetterPanels) do
  begin
    LetterPanels[i].Free;
  end;
  SetLength(LetterPanels, 0);

  Self.Repaint; // ���������� ����� ����� �������� �������
  Application.ProcessMessages;
  for i := 0 to ComponentCount - 1 do
  begin
    Component := Components[i];
    if (Component is TButton) then
      TButton(Component).Enabled := True;
  end;

  ���������.Enabled := True;

  // �������� ����� �������
  WordList := TStringList.Create;
  try
    WordList.LoadFromFile(urovni.FileName);
    Word := WordList[Random(WordList.Count)];
    SetLength(LetterPanels, Length(Word));

    // ����������� ������� ������ � ����������� �� ����������
    case Length(Word) of
      2:
        PanelLeft := 607;
      3:
        PanelLeft := 593;
      4:
        PanelLeft := 581;
      5:
        PanelLeft := 563;
      6:
        PanelLeft := 555;
      7:
        PanelLeft := 536;
      8:
        PanelLeft := 524;
      9:
        PanelLeft := 508;
      10:
        PanelLeft := 493;
      11:
        PanelLeft := 484;
      12:
        PanelLeft := 472;
      13:
        PanelLeft := 463;
      14:
        PanelLeft := 445;
      15:
        PanelLeft := 425;
    end;

    for i := 1 to Length(Word) do
    begin
      Panel := TPanel.Create(Self);
      Panel.Parent := Self;
      Panel.Width := 30;
      Panel.Height := 30;
      Panel.Left := PanelLeft + (30 * (i - 1));
      Panel.Top := 100;
      Panel.Caption := '';
      Panel.Visible := True;
      Panel.Tag := 999;
      LetterPanels[i - 1] := Panel;
    end;

    Attempts := 8;
    Attempt := 8;
    Attemptss := 10;
    ����������������.Caption := '� ��� �������� ' + IntToStr(Attempts) + ' ���������';
    ������.Caption := IntToStr(Attemptss);
  finally
    WordList.Free;
  end;
end;

 //�������
procedure TForm2.SaveRecordToFile;
var
  RecordFileName: string;
  RecordFile: TextFile;
begin
  RecordFileName := '���������/�������.txt';


    AssignFile(RecordFile, RecordFileName);
    if FileExists(RecordFileName) then
      Append(RecordFile)
    else
      Rewrite(RecordFile);

    // ���������� ������ � ����
    Writeln(RecordFile, �������.caption + ' | ' + ����.Caption + ' | ' + urovni.������������.Text + ' ������/�: ' + ������.Caption + ' ���� ');

    CloseFile(RecordFile);
end;

procedure TForm2.Timer1Timer(Sender: TObject);
begin
  Timer1.Enabled := False; // ������������� ������

  if not Guessed then
  begin
  ����������.Enabled:=false;
  okno.����������.Visible:=true;
  okno.����������.caption:='���������� ����� ����: '+ Word;
  okno.������2.Visible:=true;
   okno.���������������.caption:='';
    okno.Image2.visible:=false;
    okno.����������.Visible:=false;
    okno.��������.left:=29;
    okno.������������������������������.top:=122;
    okno.��������.caption:='�� ��������� :(';
    okno.������������������������������.Caption:='���������� ��� ���! ;)';
    okno.������������������������������.left:=86;
    StopCalled := True;
    MediaPlayer1.Stop;
    okno.MediaPlayer1.FileName := '����/���������.wav';
    okno.MediaPlayer1.Open;
    okno.MediaPlayer1.Play;
    okno.�����������.Picture.LoadFromFile('img/img8plach.png');

  end else
  begin
  ����������.Enabled:=false;
  SaveRecordToFile;
  okno.����������.Visible:=false;
  okno.�����������.Picture.LoadFromFile('img/img9radost.png');
  okno.������2.Visible:=true;
    okno.Image2.visible:=true;
       okno.����������.Visible:=false;
       okno.���������������.top:=152;
    okno.���������������.left:=440;
     okno.������������������������������.top:=154;
    okno.������������������������������.left:=142;
    okno.��������.top:=32;
    okno.��������.left:=153;
    okno.��������.caption:='������! :)';
    okno.������������������������������.Caption:='�� �������';
    okno.���������������.Caption:=IntToStr(Attemptss);
    recordu.ListBox1.Items.Add(�������.caption + ' | '+����.Caption+' | '+ urovni.������������.Text + ' ������/�: ' + ������.Caption +' ���� ');
    StopCalled := True;
    MediaPlayer1.Stop;
     okno.MediaPlayer1.FileName := '����/������.wav';
      okno.MediaPlayer1.Open;
      okno.MediaPlayer1.Play;
  end;

  okno.ShowModal;
end;


procedure TForm2.���������Click(Sender: TObject);
 begin
 glavnayaa.MediaPlayer2.FileName:='����/8af5b2bf5d19c00.wav';
glavnayaa.MediaPlayer2.Open;
glavnayaa.MediaPlayer2.Play;
sozdaniepanelee;
���������.Enabled:=false;
 ����������.Enabled:=true;
end;




procedure TForm2.���������MouseEnter(Sender: TObject);
begin
���������.Visible :=true;
end;

procedure TForm2.���������MouseLeave(Sender: TObject);
begin
���������.Visible :=false;
end;

procedure TForm2.�������������������MouseEnter(
  Sender: TObject);
begin
 ����������������.visible:=true;
����������������.caption:='� ��� �������� ' + IntToStr(Attempts) + ' ���������';
end;

procedure TForm2.�������������������MouseLeave(
  Sender: TObject);
begin
 ����������������.caption:='';
end;

procedure TForm2.AlphabetButtonClick(Sender: TObject);
var
  Button: TButton;
  i: Integer;
begin
  Button := Sender as TButton;
  Guessed := False;

  for i := 1 to Length(Word) do
  begin
    if AnsiUpperCase(Word[i]) = AnsiUpperCase(Button.Caption) then
    begin
      LetterPanels[i-1].Caption := Button.Caption;
      Guessed := True;
       Button.Enabled := False;
       MediaPlayer2.FileName := '����/���������� ������.wav';
       MediaPlayer2.Open;
        MediaPlayer2.Play;
    end;
  end;

  if not Guessed then
  begin
    Button.Enabled := False;
    MediaPlayer2.FileName := '����/������������ ������.wav';
    MediaPlayer2.Open;
    MediaPlayer2.Play;
    Dec(Attempt);
    Dec(Attemptss);
     if Attemptss > 0 then
      ������.Caption := IntToStr(Attemptss)
    else
      ������.Caption := '0';
    ������.Caption := IntToStr(Attemptss);
    case Attempt of
      7: �������.Picture.LoadFromFile('img/img0.png');
      6: �������.Picture.LoadFromFile('img/img1.png');
      5: �������.Picture.LoadFromFile('img/img2.png');
      4: �������.Picture.LoadFromFile('img/img3.png');
      3: �������.Picture.LoadFromFile('img/img4.png');
      2: �������.Picture.LoadFromFile('img/img5.png');
      1: �������.Picture.LoadFromFile('img/img6.png');
      0: begin
           �������.Picture.LoadFromFile('img/img7.png');
            Timer1.Enabled := True;


           Exit;
         end;
    end;
  end;


  Guessed := True;
  for i := Low(LetterPanels) to High(LetterPanels) do
  begin
    if LetterPanels[i].Caption = '' then
    begin
      Guessed := False;
      Break;
    end;
  end;

  if Guessed then
  begin
  Timer1.Enabled := True;
  end;
end;

end.
