unit play;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.Menus, Vcl.Buttons, Vcl.MPlayer,MMSystem,
  Vcl.Imaging.jpeg, acPNG, sBevel, sLabel, sListBox;

type
  TForm2 = class(TForm)
    клавиатура: TPanel;
    Й: TButton;
    Ф: TButton;
    Ц: TButton;
    У: TButton;
    В: TButton;
    Ы: TButton;
    К: TButton;
    А: TButton;
    П: TButton;
    Г: TButton;
    Р: TButton;
    Ш: TButton;
    Щ: TButton;
    О: TButton;
    Н: TButton;
    Л: TButton;
    З: TButton;
    Ж: TButton;
    Х: TButton;
    Д: TButton;
    Е: TButton;
    Ъ: TButton;
    Я: TButton;
    Ч: TButton;
    С: TButton;
    Т: TButton;
    Э: TButton;
    М: TButton;
    И: TButton;
    Ю: TButton;
    Б: TButton;
    Ь: TButton;
    Ё: TButton;
    фон: TImage;
    MediaPlayer1: TMediaPlayer;
    мученик: TImage;
    подсказка: TSpeedButton;
    пауза: TSpeedButton;
    заново: TSpeedButton;
    звезда: TImage;
    количествоподсказок: TImage;
    запустить: TSpeedButton;
    sBevel1: TsBevel;
    тема: TsLabel;
    уровень: TsLabel;
    инфаобподсказках: TsLabel;
    звезды: TsLabel;
    соопауза: TsLabel;
    соозаново: TsLabel;
    сооподсказка: TsLabel;
    сооначать: TsLabel;
    Timer1: TTimer;
    MediaPlayer2: TMediaPlayer;


    procedure AlphabetButtonClick(Sender: TObject);


    procedure FormClose(Sender: TObject; var Action: TCloseAction);

    procedure MediaPlayer1Notify(Sender: TObject);


    procedure подсказкаClick(Sender: TObject);
    procedure зановоClick(Sender: TObject);
    procedure паузаClick(Sender: TObject);

    procedure proverkabukv(Sender: TObject);

    procedure количествоподсказокMouseEnter(Sender: TObject);
    procedure количествоподсказокMouseLeave(Sender: TObject);
    procedure запуститьClick(Sender: TObject);
    procedure sozdaniepanelee;
    procedure паузаMouseEnter(Sender: TObject);
    procedure паузаMouseLeave(Sender: TObject);
    procedure зановоMouseEnter(Sender: TObject);
    procedure зановоMouseLeave(Sender: TObject);
    procedure подсказкаMouseEnter(Sender: TObject);
    procedure подсказкаMouseLeave(Sender: TObject);
    procedure запуститьMouseEnter(Sender: TObject);
    procedure запуститьMouseLeave(Sender: TObject);
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

















procedure TForm2.FormClose(Sender: TObject; var Action: TCloseAction);       //обновляю
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


  инфаобподсказках.Caption := '';
  звезды.Caption := '';
  Attempts := 8; //подсказки
  Attempt := 8; //попытки
   Attemptss:=10;    //звезды
form2.StopCalled := True;
form2.MediaPlayer1.Stop;
glavnayaa.MediaPlayer1.play;
glavnayaa.StopCalled := False;
подсказка.Enabled := True;
запустить.Enabled:=true;
 клавиатура.Enabled:=false;
 form2.мученик.Picture:=nil;
end;


procedure TForm2.FormCreate(Sender: TObject);
var fontway:string;
begin
fontway:=extractfilepath(application.ExeName);
addfontresource(PChar(fontway + 'шрифты\ofont.ru_Brahms Gotisch.ttf'));
addfontresource(PChar(fontway + 'шрифты\ofont.ru_Bowler.ttf'));
end;

procedure TForm2.FormDestroy(Sender: TObject);
var fontway:string;
begin
fontway:=extractfilepath(application.ExeName);
removefontresource(PChar(fontway + 'шрифты\ofont.ru_Brahms Gotisch.ttf'));
removefontresource(PChar(fontway + 'шрифты\ofont.ru_Bowler.ttf'));

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





procedure TForm2.подсказкаClick(Sender: TObject);

var
  i: Integer;
  HintUsed: Boolean;
  CurrentLetter: Char;

begin
glavnayaa.MediaPlayer2.FileName:='Звук/8af5b2bf5d19c00.wav';
glavnayaa.MediaPlayer2.Open;
glavnayaa.MediaPlayer2.Play;
  HintUsed := False;

  // Проверяю, остались ли еще подсказки
  if Attempts > 0 then
  begin
    // Нахожу первую панель без буквы и открываем следующую букву
    for i := 0 to Length(Word) - 1 do
    begin
      if (i < Length(LetterPanels)) and (LetterPanels[i].Caption = '') then
      begin
        CurrentLetter := Word[i + 1];
        HintUsed := True;
        Break; // Выхожу из цикла после нахождения первой пустой панели
      end;
    end;

    // Если использовалась подсказка, заполняет все панели с этой буквой
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
      инфаобподсказках.Caption := 'У вас осталось ' + IntToStr(Attempts) + ' подсказок';
      Dec(Attemptss);
     begin
    if Attemptss > 0 then
      звезды.Caption := IntToStr(Attemptss)
    else
      звезды.Caption := '0';
     end;

      proverkabukv(Sender); // Проверяю, все ли буквы отгаданы
    end;

  end;

  // Если подсказок не осталось, отключаем кнопку
  if Attempts = 0 then
  begin
    TButton(Sender).Enabled := False;
    инфаобподсказках.Caption := 'Подсказки закончились';
  end;
end;

procedure TForm2.подсказкаMouseEnter(Sender: TObject);
begin
сооподсказка.Visible :=true;
end;

procedure TForm2.подсказкаMouseLeave(Sender: TObject);
begin
сооподсказка.Visible :=false;
end;

procedure TForm2.proverkabukv(Sender: TObject);
var
  i: Integer;
begin
  // Проверяем, все ли буквы отгаданы
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

procedure TForm2.паузаClick(Sender: TObject);
begin
glavnayaa.MediaPlayer2.FileName:='Звук/8af5b2bf5d19c00.wav';
glavnayaa.MediaPlayer2.Open;
glavnayaa.MediaPlayer2.Play;
 okno.мученикокно.Picture.LoadFromFile('img/img10spit.png');
  StopCalled := True;
    MediaPlayer1.Stop;
    okno.MediaPlayer1.FileName := 'Звук/пауза.wav';
      okno.MediaPlayer1.Open;
      okno.MediaPlayer1.Play;
      okno.MediaPlayer1.Notify:=true;
      okno.StopCalled := False;

okno.заново2.Visible:=false;
okno.продолжить.Visible:=true;
okno.Image2.visible:=false;
okno.название.caption:='Пауза';
 okno.сообщениядляморальнойподдержки.caption:='Игра приостановлена';
okno.какоеслово.Visible:=false;
okno.название.left:=213;
 okno.сообщениядляморальнойподдержки.left:=85;
  okno.сообщениядляморальнойподдержки.top:=154;
    okno.набранныезвезды.Caption:='';
okno.showmodal;


end;

procedure TForm2.паузаMouseEnter(Sender: TObject);
begin
соопауза.Visible :=true;
end;

procedure TForm2.паузаMouseLeave(Sender: TObject);
begin
соопауза.Visible :=false;
end;

procedure TForm2.зановоClick(Sender: TObject);
begin
glavnayaa.MediaPlayer2.FileName:='Звук/8af5b2bf5d19c00.wav';
glavnayaa.MediaPlayer2.Open;
glavnayaa.MediaPlayer2.Play;
 sozdaniepanelee;
 клавиатура.Enabled:=true;
end;



procedure TForm2.зановоMouseEnter(Sender: TObject);
begin
соозаново.Visible :=true;
end;

procedure TForm2.зановоMouseLeave(Sender: TObject);
begin
соозаново.Visible :=false;
end;

procedure TForm2.sozdaniepanelee;
var
  RandomLine: string;
  i: Integer;
  Panel: TPanel;
  Component: TComponent;
  PanelLeft: Integer;
begin
  glavnayaa.MediaPlayer2.FileName := 'Звук/8af5b2bf5d19c00.wav';
  glavnayaa.MediaPlayer2.Open;
  glavnayaa.MediaPlayer2.Play;


  // Удаление старых панелей
  for i := Low(LetterPanels) to High(LetterPanels) do
  begin
    LetterPanels[i].Free;
  end;
  SetLength(LetterPanels, 0);

  Self.Repaint; // Обновление формы после удаления панелей
  Application.ProcessMessages;
  for i := 0 to ComponentCount - 1 do
  begin
    Component := Components[i];
    if (Component is TButton) then
      TButton(Component).Enabled := True;
  end;

  подсказка.Enabled := True;

  // Создание новых панелей
  WordList := TStringList.Create;
  try
    WordList.LoadFromFile(urovni.FileName);
    Word := WordList[Random(WordList.Count)];
    SetLength(LetterPanels, Length(Word));

    // Определение позиции панели в зависимости от количества
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
    инфаобподсказках.Caption := 'У вас осталось ' + IntToStr(Attempts) + ' подсказок';
    звезды.Caption := IntToStr(Attemptss);
  finally
    WordList.Free;
  end;
end;

 //рекорды
procedure TForm2.SaveRecordToFile;
var
  RecordFileName: string;
  RecordFile: TextFile;
begin
  RecordFileName := 'текстовые/рекорды.txt';


    AssignFile(RecordFile, RecordFileName);
    if FileExists(RecordFileName) then
      Append(RecordFile)
    else
      Rewrite(RecordFile);

    // Записываем рекорд в файл
    Writeln(RecordFile, уровень.caption + ' | ' + тема.Caption + ' | ' + urovni.вводникнейма.Text + ' набрал/а: ' + звезды.Caption + ' звёзд ');

    CloseFile(RecordFile);
end;

procedure TForm2.Timer1Timer(Sender: TObject);
begin
  Timer1.Enabled := False; // Останавливаем таймер

  if not Guessed then
  begin
  клавиатура.Enabled:=false;
  okno.какоеслово.Visible:=true;
  okno.какоеслово.caption:='Задуманное слово было: '+ Word;
  okno.заново2.Visible:=true;
   okno.набранныезвезды.caption:='';
    okno.Image2.visible:=false;
    okno.продолжить.Visible:=false;
    okno.название.left:=29;
    okno.сообщениядляморальнойподдержки.top:=122;
    okno.название.caption:='Вы проиграли :(';
    okno.сообщениядляморальнойподдержки.Caption:='Попробуйте ещё раз! ;)';
    okno.сообщениядляморальнойподдержки.left:=86;
    StopCalled := True;
    MediaPlayer1.Stop;
    okno.MediaPlayer1.FileName := 'Звук/проигрышь.wav';
    okno.MediaPlayer1.Open;
    okno.MediaPlayer1.Play;
    okno.мученикокно.Picture.LoadFromFile('img/img8plach.png');

  end else
  begin
  клавиатура.Enabled:=false;
  SaveRecordToFile;
  okno.какоеслово.Visible:=false;
  okno.мученикокно.Picture.LoadFromFile('img/img9radost.png');
  okno.заново2.Visible:=true;
    okno.Image2.visible:=true;
       okno.продолжить.Visible:=false;
       okno.набранныезвезды.top:=152;
    okno.набранныезвезды.left:=440;
     okno.сообщениядляморальнойподдержки.top:=154;
    okno.сообщениядляморальнойподдержки.left:=142;
    okno.название.top:=32;
    okno.название.left:=153;
    okno.название.caption:='ПОБЕДА! :)';
    okno.сообщениядляморальнойподдержки.Caption:='ВЫ НАБРАЛИ';
    okno.набранныезвезды.Caption:=IntToStr(Attemptss);
    recordu.ListBox1.Items.Add(уровень.caption + ' | '+тема.Caption+' | '+ urovni.вводникнейма.Text + ' набрал/а: ' + звезды.Caption +' звёзд ');
    StopCalled := True;
    MediaPlayer1.Stop;
     okno.MediaPlayer1.FileName := 'Звук/победа.wav';
      okno.MediaPlayer1.Open;
      okno.MediaPlayer1.Play;
  end;

  okno.ShowModal;
end;


procedure TForm2.запуститьClick(Sender: TObject);
 begin
 glavnayaa.MediaPlayer2.FileName:='Звук/8af5b2bf5d19c00.wav';
glavnayaa.MediaPlayer2.Open;
glavnayaa.MediaPlayer2.Play;
sozdaniepanelee;
запустить.Enabled:=false;
 клавиатура.Enabled:=true;
end;




procedure TForm2.запуститьMouseEnter(Sender: TObject);
begin
сооначать.Visible :=true;
end;

procedure TForm2.запуститьMouseLeave(Sender: TObject);
begin
сооначать.Visible :=false;
end;

procedure TForm2.количествоподсказокMouseEnter(
  Sender: TObject);
begin
 инфаобподсказках.visible:=true;
инфаобподсказках.caption:='У вас осталось ' + IntToStr(Attempts) + ' подсказок';
end;

procedure TForm2.количествоподсказокMouseLeave(
  Sender: TObject);
begin
 инфаобподсказках.caption:='';
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
       MediaPlayer2.FileName := 'Звук/правильная кнопка.wav';
       MediaPlayer2.Open;
        MediaPlayer2.Play;
    end;
  end;

  if not Guessed then
  begin
    Button.Enabled := False;
    MediaPlayer2.FileName := 'Звук/неправильная кнопка.wav';
    MediaPlayer2.Open;
    MediaPlayer2.Play;
    Dec(Attempt);
    Dec(Attemptss);
     if Attemptss > 0 then
      звезды.Caption := IntToStr(Attemptss)
    else
      звезды.Caption := '0';
    звезды.Caption := IntToStr(Attemptss);
    case Attempt of
      7: мученик.Picture.LoadFromFile('img/img0.png');
      6: мученик.Picture.LoadFromFile('img/img1.png');
      5: мученик.Picture.LoadFromFile('img/img2.png');
      4: мученик.Picture.LoadFromFile('img/img3.png');
      3: мученик.Picture.LoadFromFile('img/img4.png');
      2: мученик.Picture.LoadFromFile('img/img5.png');
      1: мученик.Picture.LoadFromFile('img/img6.png');
      0: begin
           мученик.Picture.LoadFromFile('img/img7.png');
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
