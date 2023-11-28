unit Main;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  Vcl.StdCtrls, Vcl.FileCtrl, Xml.XMLIntf, Xml.XMLDoc, Data.DB, Vcl.Buttons,
  Vcl.ExtCtrls, ZAbstractRODataset, ZAbstractDataset, ZDataset,
  ZAbstractConnection, ZConnection, DateUtils, IniFiles, Vcl.DBCtrls,
  Vcl.Samples.Gauges, ShellApi, Vcl.ComCtrls, Xml.xmldom, Xml.Win.msxmldom,
  Vcl.Menus, ZipMstr;

type
  TMainForm = class(TForm)
    FileListBox1: TFileListBox;
    XMLDocument1: TXMLDocument;
    DataSource1: TDataSource;
    ZQuery1: TZQuery;
    E_IP: TEdit;
    E_USER: TEdit;
    E_PASS: TEdit;
    E_Port: TEdit;
    Panel1: TPanel;
    E_DB: TEdit;
    Btn_Conect: TBitBtn;
    E_PATH_XLS: TEdit;
    BTN_CH_PATH: TBitBtn;
    BitBtn1: TBitBtn;
    Memo1: TMemo;
    ZQuery2: TZQuery;
    DataSource2: TDataSource;
    ZConnection2: TZConnection;
    CheckBox1: TCheckBox;
    Gauge1: TGauge;
    BitBtn6: TBitBtn;
    Panel2: TPanel;
    Label7: TLabel;
    BitBtn7: TBitBtn;
    CB_AUTO: TCheckBox;
    TiM_Auto: TTimer;
    btn_updatefolder: TBitBtn;
    mm1: TMainMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    mmo1: TMemo;
    N4: TMenuItem;
    ZipMaster1: TZipMaster;
    N5: TMenuItem;
    lst1: TListBox;
    lst2: TListBox;
    Label_2: TLabel;
    Label_3: TLabel;
    BTN_left: TBitBtn;
    BTN_rigth: TBitBtn;
    N6: TMenuItem;
    BTN_SAVELOG: TBitBtn;
    pgc1: TPageControl;
    ts1: TTabSheet;
    ts2: TTabSheet;
    lst3: TListBox;
    BTN_p2: TBitBtn;
    BTN_p3: TBitBtn;
    lst4: TListBox;
    ComboBox_inst: TComboBox;
    DTP_1: TDateTimePicker;
    ComboBox_metod: TComboBox;
    DS_temp: TDataSource;
    zQ_temp: TZQuery;
    BTN_1: TBitBtn;
    Label_4: TLabel;
    Label_5: TLabel;
    CheckBox_1: TCheckBox;
    E_Ciros: TEdit;
    Memo2: TMemo;
    Label_1: TLabel;
    Label_OP: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure Btn_ConectClick(Sender: TObject);
    procedure BTN_CH_PATHClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
//    procedure FileListBox1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn6Click(Sender: TObject);
    procedure BitBtn7Click(Sender: TObject);
    procedure TiM_AutoTimer(Sender: TObject);
    procedure btn_updatefolderClick(Sender: TObject);
    procedure N3Click(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure N4Click(Sender: TObject);
    procedure N5Click(Sender: TObject);
    procedure CB_AUTOClick(Sender: TObject);
    procedure N6Click(Sender: TObject);
    procedure BTN_rigthClick(Sender: TObject);
    procedure BTN_leftClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure BTN_SAVELOGClick(Sender: TObject);
    procedure ComboBox_instClick(Sender: TObject);
    procedure BTN_1Click(Sender: TObject);
  private
    { Private declarations }

  public
    { Public declarations }

  end;

type
  Isl = record
    ID_isl: integer;
    Name: string;
    Metod: string;
    Type_isl: string;
    date: string;
    date_rec: string;
    Instrument: string;
    info: string;
    Origin: string;
    R: string;
    Vx: string;
    Va: string;
    DateT: string;
    AC: string;
  end;

type
  EXP = record
    ID_EXP: integer;
    ID_isl: integer;
    Nom: integer;
    datetime: string;
    Status: string;
  end;

type
  EXP_Data = record
    ID_EXP: integer;
    IdName: string;
    IdEl: string;
    IdEl_Leng: string;
    Status: string;
    Conc: string;
    ConcUnit: string;
    RawInt: string;
    BgCoorrInt: string;
    IECInt: string;
    StdzInt: string;
    Deleted: string;
  end;

const
  IsTest = false;

var
  MainForm: TMainForm;
  breack_MASS: boolean;
  Path: string;
  mass_ARR: array of double;
  DubleIsl: integer;
  Metod: string;
  USER: string;

implementation

uses
  R_FM, Mass, Metod_unit;

{$R *.dfm}

procedure TMainForm.N1Click(Sender: TObject);
var
  s: string;
begin
  s := InputBox('Password', #1'Please Enter a Password', '');
  if ((s = 'ёлки') or (s = '`krb')) then
  begin
    FM_Rastvor.Visible := False;
    FM_Rastvor.Visible := true;
    FM_Rastvor.rg1Click(R_FM.FM_Rastvor.rg1);
  end;
end;

procedure LOG(str: string);
begin
  MainForm.Memo1.Lines.Add(timetostr(Time()) + '|' + str);
end;

function StringReplaceMy(S: string): string;
begin
  result := S;
  result := StringReplace(result, '*', '', [rfReplaceAll, rfIgnoreCase]);
  result := StringReplace(result, ')', '', [rfReplaceAll, rfIgnoreCase]);
  result := StringReplace(result, '(', '', [rfReplaceAll, rfIgnoreCase]);
end;

function parseName(S: string): isl;
var
  temp: string;
begin
  result.R := '1';
  result.Vx := '1';
  result.Va := '1';
  result.DateT := '';
  result.AC := '';
  if Pos('R=', S) > 0 then
  begin
    temp := S;
    System.Delete(temp, 1, Pos('R=', temp));
    System.Delete(temp, Pos(' ', temp), length(temp) - Pos(' ', temp) + 1);
    System.Delete(temp, Pos('=', temp), 1);
    result.R := temp;
  end;
  if Pos('r=', S) > 0 then
  begin
    temp := S;
    System.Delete(temp, 1, Pos('r=', temp));
    System.Delete(temp, Pos(' ', temp), length(temp) - Pos(' ', temp) + 1);
    System.Delete(temp, Pos('=', temp), 1);
    result.R := temp;
  end;
  if Pos('г=', S) > 0 then
  begin
    temp := S;
    System.Delete(temp, 1, Pos('г=', temp));
    System.Delete(temp, Pos(' ', temp), length(temp) - Pos(' ', temp) + 1);
    System.Delete(temp, Pos('=', temp), 1);
    result.R := temp;
  end;
  if Pos('Vx=', S) > 0 then
  begin
    temp := S;
    System.Delete(temp, 1, Pos('Vx=', temp) + 1);
    System.Delete(temp, Pos(' ', temp), length(temp) - Pos(' ', temp) + 1);
    System.Delete(temp, Pos('=', temp), 1);
    result.Vx := temp;
  end;
  if Pos('V=', S) > 0 then
  begin
    temp := S;
    System.Delete(temp, 1, Pos('V=', temp) + 1);
    System.Delete(temp, Pos(' ', temp), length(temp) - Pos(' ', temp) + 1);
    System.Delete(temp, Pos('=', temp), 1);
    result.Vx := temp;
  end;
  if Pos('Va=', S) > 0 then
  begin
    temp := S;
    System.Delete(temp, 1, Pos('Va=', temp) + 1);
    System.Delete(temp, Pos(' ', temp), length(temp) - Pos(' ', temp) + 1);
    System.Delete(temp, Pos('=', temp), 1);
    result.Va := temp;
  end;
  if Pos('Date=', S) > 0 then
  begin
    temp := S;
    System.Delete(temp, 1, Pos('Date=', temp) + 4);
         //Delete(temp,1,Pos(' ',temp)+1);
    result.DateT := temp;
  end;
  if Pos('AC=', S) > 0 then
  begin
    temp := S;
    System.Delete(temp, 1, Pos('AC=', temp) + 1);
    System.Delete(temp, Pos(')', temp), length(temp) - Pos(')', temp) + 1);
    System.Delete(temp, Pos('=', temp), 1);
    result.AC := temp;
  end;
  result.R := StringReplaceMy(result.R);
  result.Va := StringReplaceMy(result.Va);
  result.Vx := StringReplaceMy(result.Vx);
  result.DateT := StringReplaceMy(result.DateT);
end;

procedure TMainForm.N3Click(Sender: TObject);
var
  Nameisl, id: string;
  i: integer;
  ISl_1: Isl;
  date: Ttime;
begin
 // repeat
  date := time();
  with ZQuery1 do
  begin
    Active := False;
    sql.Text := 'SELECT `id_isl`,`Name`  FROM `lims`.`isl` where ' + '`Name` like "%R=%" or ' + '`Name` like "%Vx=%" or  ' + '`Name` like "%V=%" or `Name` like "%Va=%" or  ' + '`Name` like "%г=%" or `Name` like "%AC=%" or  ' + '`Name` like "%Date=%"';
    Active := True;
    i := 1;
    log(IntToStr(RecordCount));
    if RecordCount <> 0 then
    begin
      first;
      while not eof do
      begin
        Nameisl := FieldByName('Name').AsString;
        ISl_1 := parseName(Nameisl);
        id := FieldByName('id_isl').AsString;
        with ZQuery2 do
        begin
          Active := False;
          SQL.Clear;
          SQL.Add('UPDATE `lims`.`isl`');
          SQL.Add('SET');
          SQL.Add('`R` = "' + ISl_1.R + '",');
          SQL.Add('`M` = "' + ISl_1.Va + '",');
          SQL.Add('`V` = "' + ISl_1.Vx + '",');
          SQL.Add('`AC` = "' + ISl_1.AC + '",');
          SQL.Add('`DateT` = "' + ISl_1.DateT + '"');
          SQL.Add('WHERE (`id_isl` = "' + id + '") ');
          ExecSQL;
        end;
        //log(SQL.Text);
        log(IntToStr(i) + ':' + IntToStr(RecordCount));
        i := i + 1;
        next;
      end;
    end;
  end;
  date := time() - date;
  log('END:' + TimeToStr(date));
end;

procedure TMainForm.TiM_AutoTimer(Sender: TObject);
begin
  if CB_AUTO.Checked then
  begin
    FileListBox1.Update;
    if FileListBox1.Count > 0 then
    begin

      BitBtn6Click(BitBtn6);
    end;
  end
  else
  begin
    TiM_Auto.Enabled := false;
    log('автоматика выкл!');
  end;
end;

function StrToDT_MY(s: string): Tdatetime;
var
  MySettings: TFormatSettings;
//  d: TDateTime;
begin
  GetLocaleFormatSettings(GetUserDefaultLCID, MySettings);
  MySettings.DateSeparator := '-';
  MySettings.TimeSeparator := ':';
  MySettings.ShortDateFormat := 'yyyy-mm-dd';
  MySettings.ShortTimeFormat := 'hh:nn:ss';
  Result := StrToDateTime(s, MySettings);
end;

function maxID(mode: string): integer;
begin
  with MainForm do
  begin
    ZQuery1.Active := false;
    ZQuery1.SQL.Text := 'Select max(ID_' + mode + ') from ' + mode;
    ZQuery1.Active := true;
    if ZQuery1.Fields.Fields[0].IsNull then
      Result := 1
    else
      Result := ZQuery1.Fields.Fields[0].AsInteger + 1;
  end;

end;

procedure ADD_MYSQL(SQLe: string);
begin
  log(SQLe);
  try
    with MainForm.ZQuery1 do
      if IsTest = false then
      begin
        Active := false;
        SQL.Text := SQLe;
        ExecSQL;
      end;
  except
    on E: Exception do
    begin
      log(E.ClassName + '|Ошибка ! : ' + E.Message);
    end;
  end;
end;

function StrToFloat_MY(s: string): Extended;
var
  temp: string;
begin
  if System.pos(',', s) > 0 then
    temp := StringReplace(s, ',', FormatSettings.DecimalSeparator, [rfReplaceAll, rfIgnoreCase])
  else if System.pos('.', s) > 0 then
    temp := StringReplace(s, '.', FormatSettings.DecimalSeparator, [rfReplaceAll, rfIgnoreCase]);
  Result := StrToFloat(temp);
end;

function FloatToSTR_MY(s: Extended): string;
begin
  Result := StringReplace(FloatToStr(s), FormatSettings.DecimalSeparator, '.', [rfReplaceAll, rfIgnoreCase])
end;

procedure loadline(Measurement: IXMLNode; List: TListBox; List2: TListBox);
var
  i: integer;
  ResultValues: IXMLNode;
begin
  List.Clear;
  List2.Clear;
  for i := 0 to Measurement.ChildNodes.Count - 1 do
  begin
    ResultValues := Measurement.ChildNodes[i];
    if ResultValues.Attributes['Type'] = 'Line' then
    begin
      List.Items.Add(ResultValues.Attributes['IDName']);
    end;
  end;
  List.Sorted := false;
  List.Sorted := true;
end;

function IsLoad(Line: string): string;
var
  I: Integer;
begin
  result := '1';
  for I := 0 to MainForm.lst1.Count - 1 do
  begin
    if Line = MainForm.lst1.Items.Strings[I] then
    begin
      result := '0';
      break;
    end;
  end;

end;

function decodLine(line: string): string;
begin
  if pos('0x', line) = 0 then
    Result := line
  else
  begin
    if line = '0x00000106-Ag' then
    begin
      Result := 'Ag 328.068'
    end
    else if line = '0x000000E4-As' then
    begin
      Result := 'As 189.042'
    end
    else if line = '0x00000109-B' then
    begin
      Result := 'B 249.773'
    end
    else if line = '0x000000FE-Ba' then
    begin
      Result := 'Ba 455.404'
    end
    else if line = '0x00000071-Ca' then
    begin
      Result := 'Ca 317.933'
    end
    else if line = '0x000000E8-Cd' then
    begin
      Result := 'Cd 228.802'
    end
    else if line = '0x000000DA-Co' then
    begin
      Result := 'Co 228.616'
    end
    else if line = '0x00000116-Co' then
    begin
      Result := 'Co 228.615'
    end
    else if line = '0x00000102-Cr' then
    begin
      Result := 'Cr 267.716'
    end
    else if line = '0x00000117-Cr' then
    begin
      Result := 'Cr 407.771'
    end
    else if line = '0x000000EB-Mn' then
    begin
      Result := 'Mn 257.611'
    end
    else if line = '0x000000DC-Ni' then
    begin
      Result := 'Ni 231.604'
    end
    else if line = '0x00000113-Se' then
    begin
      Result := 'Se 196.090'
    end
    else if line = '0x00000115-Sr' then
    begin
      Result := 'Sr 407.771'
    end
    else if line = '0x000000F4-V' then
    begin
      Result := 'V 292.402'
    end
    else if line = '0x000000E0-Zn' then
    begin
      Result := 'Zn 213.856'
    end

  end;

end;

function lastID(): integer;
begin

  with MainForm.ZQuery1 do
  begin
    Active := false;
    sql.Text := 'SELECT LAST_INSERT_ID() as `ID`;';
    log(sql.Text);
    Active := true;
    First;

    Result := FieldByName('ID').AsInteger;
  end;
end;

function loaddata(Oneisl: ISl; Measurements: IXMLNode): integer;
var
  R_Isl, TempISL: ISl;
  R_Exp: array of exp;
  R_Exp_Data: array of exp_data;
  i, y, k: integer;
  Measurement: IXMLNode;
  ResultValues: IXMLNode;
  ResultValue: IXMLNode;
  temp, TypeR: string;
begin
  try
    R_Isl := Oneisl;
///////
 ///  Записываем параметры для таблицы ISL
 ///  ID вытаскиваем функцией максимального значения ID
/////////////////////////////
    R_Isl.ID_isl := maxID('isl');
    result := R_Isl.ID_isl;
    if breack_MASS = true then
      exit;
    ///////// Проверку на список и метод нужно делать до ЗАГРУЗКИ!!!
    //// Запустили мы такие в 1й раз программу.. надо заполнить список.. заполняем
    ///  и останавливаем загрузку...
    if Metod = '-1' then
    begin
      LoadLine(Measurements.ChildNodes[0], MainForm.lst1, MainForm.lst2);
      Metod := Oneisl.Metod;
      breack_MASS := true;
      MainForm.CB_AUTO.Checked := false;
      ShowMessage('Выберете нужные линии и нажмите на кнопку "Загрузить Всё"');
      log('Выберете нужные линии и нажмите на кнопку "Загрузить Всё"');
      result := -1;
      exit;
    end;
    // если метод  сменился до сбрасываем все линии
    if Metod <> Oneisl.Metod then
    begin
      LoadLine(Measurements.ChildNodes[0], MainForm.lst1, MainForm.lst2);
      Metod := Oneisl.Metod;
      if not (MainForm.CheckBox_1.Checked) then
      begin
        breack_MASS := true;
        MainForm.CB_AUTO.Checked := false;
        ShowMessage('МЕТОД ИЗМЕНИЛСЯ!!! ' + #13 + ' Выберете нужные линии и нажмите на кнопку "Загрузить Всё"');
        result := -1;
      end;
      log('МЕТОД ИЗМЕНИЛСЯ!!! ');
      exit;
    end;
    //1 проверяем не пуст ли список загрузок если пусть заполняем
    // на всякий случай
    if MainForm.lst1.Count = 0 then
    begin
      LoadLine(Measurements.ChildNodes[0], MainForm.lst1, MainForm.lst2);
      breack_MASS := true;
      ShowMessage('Чтото случилось не так. сбросили линии ' + #13 + ' Выберете нужные линии и нажмите на кнопку "Загрузить Всё"');
      log('Чтото случилось не так. сбросили линии.');
      result := -1;
      exit;
    end;
    if R_Isl.date_rec = '' then
      R_Isl.date_rec := R_Isl.date;
/////////////////////////////
///  Вытаскивание Параметров из Имени
///     R_Isl.Name
///
    TempISL := parseName(R_Isl.Name);
    if (Oneisl.r <> '') then
      R_Isl.R := Oneisl.r
    else
      R_Isl.R := TempISL.R;
    R_Isl.Vx := TempISL.Vx;
    R_Isl.Va := TempISL.Va;
    R_Isl.DateT := TempISL.DateT;
    R_Isl.AC := TempISL.AC;
    //exit;
////////////
    ADD_MYSQL('INSERT INTO `lims`.`isl` (`Oper`,`M`,`V`,`R`,`AC`,`DateT`,`info_isl`,`origin_isl`,`Instrument`,`Name`,`Metod`,`Type_Isl`,`Date`,`Date_recal`)' + 'VALUES ("'+USER+'", "' + R_Isl.Va + '","' + R_Isl.Vx + '","' + R_Isl.R + '","' + R_Isl.AC + '","' + R_Isl.DateT + '","' + R_Isl.info + '","' + R_Isl.Origin + '","' + R_Isl.Instrument + '","' + R_Isl.Name + '","' + R_Isl.Metod + '","' + R_Isl.Type_isl + '","' + R_Isl.date + '","' + R_Isl.date_rec + '");');
    R_Isl.ID_isl := lastID();
    log('id_isl:' + inttostr(R_Isl.ID_isl));
    result := R_Isl.ID_isl;
 ///////////
 ///    Теперь парсим
 ///    Measurements - эксперементы
 //////////
    SetLength(R_Exp, Measurements.ChildNodes.Count + 1);
    for i := 0 to Measurements.ChildNodes.Count - 1 do //Measurements
      if Measurements.ChildNodes[i].NodeName = 'Measurement' then // Measurement
      begin
        Measurement := Measurements.ChildNodes[i];

        R_Exp[i].ID_isl := R_Isl.ID_isl;
        //R_Exp[i].ID_EXP := maxID('EXP');
        R_Exp[i].Nom := Measurement.Attributes['No'];
        R_Exp[i].Status := Measurement.Attributes['Status'];
        if R_Isl.Instrument <> 'Ciros' then
          temp := 'MeasureDateTime'
        else
          temp := 'Time';
        R_Exp[i].datetime := Measurement.Attributes[temp];
        ADD_MYSQL('INSERT INTO `lims`.`EXP`(`Status`,`id_isl`,`N`,`DateTime`)' + 'VALUES ( "' + R_Exp[i].Status + '",' + IntToStr(R_Isl.ID_isl) + ' ,' + inttostr(R_Exp[i].Nom) + ' ,"' + R_Exp[i].datetime + '" );');
        R_Exp[i].ID_EXP := lastID();
        log('ID_EXP:' + inttostr(R_Exp[i].ID_EXP));
        //result := R_Isl.ID_isl;
        SetLength(R_Exp_Data, Measurement.ChildNodes.Count);
        for y := 0 to Measurement.ChildNodes.Count - 1 do    //ResultValues
        begin
          temp := Measurement.ChildNodes[y].NodeName;
          ResultValues := Measurement.ChildNodes[y]; //
          if ResultValues.Attributes['Type'] = 'Line' then
          begin
          {id експ }
            R_Exp_Data[y].ID_EXP := R_Exp[i].ID_EXP;
          {Имя элемента }
            /////
            R_Exp_Data[y].IdName := ResultValues.Attributes['IDName'];
            //2 проверяем  есть ли эта линия в списке загрузок
            R_Exp_Data[y].Deleted := IsLoad(R_Exp_Data[y].IdName);
             ////
            temp := decodLine(R_Exp_Data[y].IdName);
            Delete(temp, Pos(' ', temp), length(temp) - Pos(' ', temp) + 1);
            R_Exp_Data[y].IdEl := temp;
            temp := R_Exp_Data[y].IdName;
            Delete(temp, 1, Pos(' ', temp));
            R_Exp_Data[y].IdEl_Leng := temp;
            R_Exp_Data[y].Conc := '';
            R_Exp_Data[y].BgCoorrInt := '';
            R_Exp_Data[y].IECInt := '';
            R_Exp_Data[y].StdzInt := '';
          //// ЗАНОСИМ    Conc  RawInt   BgCorrInt  IECInt   StdzInt
            for k := 0 to ResultValues.ChildNodes.Count - 1 do  // ResultValue
            begin
              ResultValue := ResultValues.ChildNodes[k];
              TypeR := ResultValue.Attributes['Type'];
              if TypeR = 'Conc' then
              begin
                R_Exp_Data[y].ConcUnit := ResultValue.Attributes['Unit'];
                R_Exp_Data[y].Conc := ResultValue.NodeValue;
                if R_Isl.Instrument = 'Ciros' then
                  R_Exp_Data[y].Status := ResultValue.Attributes['Status']
                else
                  R_Exp_Data[y].Status := ResultValue.Attributes['CalibrationStatus'];
              end;
              if (TypeR = 'Raw Int') or (TypeR = 'RawInt') then
                R_Exp_Data[y].RawInt := ResultValue.NodeValue;
              if (TypeR = 'BgCorrInt') or (TypeR = 'BGCorr Int') then
                R_Exp_Data[y].BgCoorrInt := ResultValue.NodeValue;
              if (TypeR = 'IECInt') or (ResultValue.Attributes['Type'] = 'InterElementCorr Int') then
                R_Exp_Data[y].IECInt := ResultValue.NodeValue;
              if (TypeR = 'StdzInt') or (ResultValue.Attributes['Type'] = 'Stdz Int') then
                R_Exp_Data[y].StdzInt := ResultValue.NodeValue;
            end;
            if R_Exp_Data[y].Conc = '' then
              R_Exp_Data[y].Conc := '0';
            if R_Exp_Data[y].BgCoorrInt = '' then
              R_Exp_Data[y].BgCoorrInt := '0';
            if R_Exp_Data[y].IECInt = '' then
              R_Exp_Data[y].IECInt := '0';
            if R_Exp_Data[y].RawInt = '' then
              R_Exp_Data[y].RawInt := '0';
            if R_Exp_Data[y].StdzInt = '' then
              R_Exp_Data[y].StdzInt := '0';
            Application.ProcessMessages;
            ADD_MYSQL('INSERT INTO `lims`.`exp_date`  ' + '(`DELETE`,`id_exp`,`ElementP`,`Element`,`Element_Length`,`Status`,`Cons`,`ConcUnit`,`RawInt`,`BgCorrInt`,`IECInt`,`StdzInt`)' + 'VALUES (' + R_Exp_Data[y].Deleted + ',"' + inttostr(R_Exp_Data[y].ID_EXP) + '","' + R_Exp_Data[y].IdName + '","' + R_Exp_Data[y].IdEl + '","' + R_Exp_Data[y].IdEl_Leng + '","' + R_Exp_Data[y].Status + '","' + R_Exp_Data[y].Conc + '","' + R_Exp_Data[y].ConcUnit + '","' + R_Exp_Data[y].RawInt + '","' + R_Exp_Data[y].BgCoorrInt + '","' + R_Exp_Data[y].IECInt + '","' + R_Exp_Data[y].StdzInt + '");');
          end;
        end;
      end;
  except
    on E: Exception do
    begin
      MainForm.mmo1.Lines.add('---FILE-------');
      MainForm.mmo1.Lines.Add(MainForm.FileListBox1.FileName);
      MainForm.mmo1.Lines.Add(E.ClassName + '|Ошибка ZIP ! : ' + E.Message);
      MainForm.mmo1.Lines.add('--------------');
      log('---FILE-------');
      log(MainForm.FileListBox1.FileName);
      log(E.ClassName + '|Ошибка ! : ' + E.Message);
      log('--------------');
      ADD_MYSQL('DELETE FROM `lims`.`isl` WHERE  `id_isl` =' + inttostr(R_Isl.ID_isl));
      Result := -1;
    end;
  end;

end;

function ofUser(): string;
var
  F: string;
  U:string;
begin
  F := '';
  U:='';
  with MainForm do
  begin

    if (FileExists(E_Ciros.Text)) then
    begin
      Memo2.Lines.Clear;
      Memo2.Lines.LoadFromFile(E_Ciros.Text);
      U:=Memo2.Lines.Strings[12];
      Delete(U,1,20);
      U:=Trim(U);
      Label_OP.Caption:=U;
      USER:=U;
    end;
  end;
  Result:=U;
end;

procedure TMainForm.BitBtn1Click(Sender: TObject);
var
  INode: IXMLNode;
  INode_Result: IXMLNode;
  INode_BIG: IXMLNode;
  INode_Measurements: IXMLNode;
  INode_Statistics: IXMLNode;
  Oneisl: ISl;
  i, j, k, z: Integer;
  temp: string;
  ID_isl: integer;
begin
  ID_isl := -1;
  if FileListBox1.ItemIndex = -1 then
    exit;
  log('---FILE-------');
  log(FileListBox1.FileName);
  log('--------------');
  XMLDocument1.LoadFromFile(FileListBox1.FileName);
  XMLDocument1.Options := XMLDocument1.Options - [doNodeAutoCreate, doAutoSave] + [doNodeAutoIndent, doAttrNull];
  XMLDocument1.NodeIndentStr := '  ';
  XMLDocument1.Active := True;
  if XMLDocument1.IsEmptyDoc then
  begin
    ShowMessage('Документ пуст. Действие отменено.');
    Exit;
  end;
  INode := XMLDocument1.DocumentElement;
  if INode.NodeName = 'SampleResults' then
  begin
    // алгоритм обработки аркоса
    log(INode.NodeName + ':' + inttostr(INode.ChildNodes.Count));

    for i := 0 to INode.ChildNodes.Count - 1 do
    begin
      INode_Result := INode.ChildNodes[i];
      log(inttostr(i) + ' из ' + inttostr(INode.ChildNodes.Count - 1));
      Application.ProcessMessages;
      for j := 0 to INode_Result.AttributeNodes.Count - 1 do
      begin
        temp := INode_Result.AttributeNodes[j].NodeName;
        if INode_Result.AttributeNodes[j].NodeName = 'Name' then
          Oneisl.name := INode_Result.AttributeNodes[j].NodeValue;
        if INode_Result.AttributeNodes[j].NodeName = 'Method' then
          Oneisl.Metod := INode_Result.AttributeNodes[j].NodeValue;
        if INode_Result.AttributeNodes[j].NodeName = 'Type' then
          Oneisl.Type_isl := INode_Result.AttributeNodes[j].NodeValue;
        if INode_Result.AttributeNodes[j].NodeName = 'Instrument' then
          Oneisl.Instrument := INode_Result.AttributeNodes[j].NodeValue;
        if INode_Result.AttributeNodes[j].NodeName = 'MeasureDateTime' then
          if INode_Result.AttributeNodes[j].NodeValue = null then
            Oneisl.date := ''
          else
            Oneisl.date := INode_Result.AttributeNodes[j].NodeValue;
        if INode_Result.AttributeNodes[j].NodeName = 'RecalcuationDateTime' then
          if INode_Result.AttributeNodes[j].NodeValue = null then
            Oneisl.date_rec := ''
          else
            Oneisl.date_rec := INode_Result.AttributeNodes[j].NodeValue;

        if INode_Result.AttributeNodes[j].NodeName = 'Info' then
          if INode_Result.AttributeNodes[j].NodeValue = null then
            Oneisl.info := ''
          else
            Oneisl.info := INode_Result.AttributeNodes[j].NodeValue;
        if INode_Result.AttributeNodes[j].NodeName = 'Origin' then
          if INode_Result.AttributeNodes[j].NodeValue = null then
            Oneisl.Origin := ''
          else
            Oneisl.Origin := INode_Result.AttributeNodes[j].NodeValue;
      end;
     // Label_1.Caption := Oneisl.name;
      for j := 0 to INode_Result.ChildNodes.Count - 1 do
      begin
        if INode_Result.ChildNodes[j].NodeName = 'Measurements' then
          INode_Measurements := INode_Result.ChildNodes[j];

        if INode_Result.ChildNodes[j].NodeName = 'Statistics' then
        begin
          INode_Statistics := INode_Result.ChildNodes[j];
          Oneisl.date := INode_Statistics.ChildNodes[0].Attributes['MeasureDateTime']
        end;
      end;
    end;
    if (Oneisl.name <> '') and (Oneisl.Metod <> '') and (Oneisl.Type_isl <> '') and (Oneisl.date <> '') and (Oneisl.Instrument <> '') then
      ID_isl := loaddata(Oneisl, INode_Measurements);
  end
  else
  begin
    temp := INode.NodeName;
    if INode.NodeName = 'Result' then
      z := 0
    else
    begin
      z := INode.ChildNodes.Count - 1;
      INode_BIG := INode;
    end;

    for k := 0 to z do
    begin
      if (INode.NodeName = 'Results') then
      begin
        INode := INode_BIG.ChildNodes[k]
      end;
      for i := 0 to INode.ChildNodes.Count - 1 do
      begin
        //LOG(INode.ChildNodes[i].NodeName);
        INode_Result := INode.ChildNodes[i];
        if (INode.ChildNodes[i].NodeName = 'SampleIDs') then
          for j := 0 to INode_Result.ChildNodes.Count - 1 do
          begin
            if (INode_Result.ChildNodes[j].Attributes['Name'] = 'R') then
              Oneisl.R := INode_Result.ChildNodes[j].Attributes['Value'];
                  //LOG(Oneisl.R);
          end;

        for j := 0 to INode_Result.AttributeNodes.Count - 1 do
        begin
          temp := INode_Result.AttributeNodes[j].NodeName;
          if INode_Result.AttributeNodes[j].NodeName = 'Name' then
            Oneisl.name := INode_Result.AttributeNodes[j].NodeValue;
          if INode_Result.AttributeNodes[j].NodeName = 'Method' then
            Oneisl.Metod := INode_Result.AttributeNodes[j].NodeValue;
          if INode_Result.AttributeNodes[j].NodeName = 'Type' then
            Oneisl.Type_isl := INode_Result.AttributeNodes[j].NodeValue;
          if INode_Result.AttributeNodes[j].NodeName = 'Instrument' then
            Oneisl.Instrument := INode_Result.AttributeNodes[j].NodeValue;
          if INode_Result.AttributeNodes[j].NodeName = 'Info' then
            if INode_Result.AttributeNodes[j].NodeValue = null then
              Oneisl.info := ''
            else
              Oneisl.info := INode_Result.AttributeNodes[j].NodeValue;
          if INode_Result.AttributeNodes[j].NodeName = 'Origin' then
            if INode_Result.AttributeNodes[j].NodeValue = null then
              Oneisl.Origin := ''
            else
              Oneisl.Origin := INode_Result.AttributeNodes[j].NodeValue;
        end;
        for j := 0 to INode_Result.ChildNodes.Count - 1 do
        begin
          if INode_Result.ChildNodes[j].NodeName = 'Measurements' then
            INode_Measurements := INode_Result.ChildNodes[j];
          if INode_Result.ChildNodes[j].NodeName = 'Measurement' then
          begin
            INode_Statistics := INode_Result.ChildNodes[j];
            Oneisl.date := INode_Statistics.{ChildNodes[0].}Attributes['Time']
          end;
        end;

      end;
    end;

    if (Oneisl.name <> '') and (Oneisl.Metod <> '') and (Oneisl.Type_isl <> '') and (Oneisl.date <> '') and (Oneisl.Instrument <> '') then
      ID_isl := loaddata(Oneisl, INode_Measurements);
  end;
  //Exit;
  log('TRY DOWNLOAD FILE ' + FileListBox1.FileName + ':ID:' + IntToStr(ID_isl));
  if (ID_isl < 0) then
  begin
    breack_MASS := true;
    exit;
  end;
  if (ID_isl > 0) and (FileExists(FileListBox1.FileName)) then
  begin
    try
     // if FileExists(FileListBox1.FileName) then
     // begin
      with ZipMaster1 do
      begin
        ZipFileName := IntToStr(ID_isl) + '.zip';
        DLL_Load := True;
        FSpecArgs.Clear;
        RootDir := FileListBox1.Directory;
        FSpecArgs.Add(FileListBox1.FileName);
        try
          Add;
        except
          ShowMessage('Error in Add; Fatal DLL Exception in mainunit');
        end;
        DLL_Load := false;
      end;
      ZQuery1.Active := False;
      ZQuery1.SQL.TEXT := 'SELECT id_isl,XML from XML_DATA where id_isl=' + IntToStr(ID_isl);
      ZQuery1.Active := true;
      if ZQuery1.RecordCount = 0 then
      begin
        ZQuery1.Insert;
        ZQuery1.FieldByName('id_isl').AsInteger := ID_isl;
        TBlobField(ZQuery1.FieldByName('XML')).LoadFromFile(IntToStr(ID_isl) + '.zip');
        ZQuery1.Post;
      end;
      log('DOWNLOAD FILE ' + FileListBox1.FileName + ' COMLITE:' + IntToStr(ID_isl));
      if CheckBox1.Checked then
      begin
        if not (DirectoryExists(FileListBox1.Directory + '\do\')) then
          MkDir(FileListBox1.Directory + '\do\');
        //MoveFile(Pchar(FileListBox1.FileName),Pchar(FileListBox1.Directory + '\do\' + IntToStr(ID_isl) + '.xml') )  ;
        MoveFile(Pchar(FileListBox1.Directory + '\' + IntToStr(ID_isl) + '.zip'), Pchar(FileListBox1.Directory + '\do\' + IntToStr(ID_isl) + '.zip'));
        DeleteFile(FileListBox1.FileName);
       // DeleteFile(FileListBox1.Directory + '\' + IntToStr(ID_isl) + '.zip');
      end;
     // end;

    except
      on E: Exception do
      begin
        mmo1.Lines.add('---FILE-------');
        mmo1.Lines.Add(FileListBox1.FileName);
        mmo1.Lines.Add(E.ClassName + '|Ошибка ZIP ! : ' + E.Message);
        mmo1.Lines.add('--------------');
        ADD_MYSQL('DELETE FROM `lims`.`isl` WHERE  `id_isl` =' + inttostr(ID_isl));
        ZConnection2.Reconnect;
      end;
    end;
  end;
end;

procedure add_mass(k: double);
begin
  SetLength(mass_ARR, length(mass_ARR) + 1);
  mass_ARR[length(mass_ARR) - 1] := k;
end;

function ABS_M(): double;
var
  I: Integer;
  S: double;
begin
  S := 0;
  for I := Low(mass_ARR) to High(mass_ARR) do
    S := S + mass_ARR[I];
  S := S / Length(mass_ARR);
  Result := S;
end;

procedure TMainForm.BitBtn6Click(Sender: TObject);
var
  I, ost: Integer;
  time_N, time_ost: TDateTime;
  T, T_ABS, ost_d: double;
  s: string;
begin
  TiM_Auto.Enabled := false;
  if FileListBox1.Count > 0 then
  begin
    log('Файлов = ' + inttostr(FileListBox1.Count));
    Gauge1.Visible := true;
    CB_AUTO.Checked := true;
    mmo1.Clear;
    SetLength(mass_ARR, 0);
    Gauge1.Progress := 0;
    breack_MASS := false;
    Gauge1.MaxValue := FileListBox1.Count - 1;
    for I := 0 to FileListBox1.Count - 1 do
    begin
      Application.ProcessMessages;
      if breack_MASS then
      begin
        log('ПРЕРВАНО1!');
        CB_AUTO.Checked := false;
        Break;
      end;
      time_N := Time();
      FileListBox1.ItemIndex := I;
      BitBtn1Click(BitBtn1);
    ///////////////////////////////
      Gauge1.Progress := Gauge1.Progress + 1;
      T := SecondSpan(time, time_N);
      add_mass(T);
      T_ABS := ABS_M;
      ost := round(T_ABS * (FileListBox1.Count - 1 - I));
      ost_d := ost;
      ost_d := ost_d / (24 * 60 * 60);
      time_ost := TDateTime(ost_d);
      Label7.Caption := inttostr(I) + ' из ' + inttostr(FileListBox1.Count - 1) + ' (' + FloatToStrF(T, ffFixed, 8, 3) + ' сек) (' + FloatToStrF(T_ABS, ffFixed, 8, 3) + ' сек) (' + timetostr(time_ost) + ')';
    //Ic(3, Application.Icon);
      Application.ProcessMessages;
      if breack_MASS then
      begin
        log('ПРЕРВАНО2!');
        CB_AUTO.Checked := false;
        Break;
      end;
    end;
    Label7.Caption := 'Готово!';
    Gauge1.Visible := false;
    FileListBox1.Update;
    s := DateTimeToStr(Now);
    s := StringReplace(s, ':', '-', [rfReplaceAll, rfIgnoreCase]);
    if mmo1.Lines.Count > 0 then
    begin
      mmo1.Lines.SaveToFile(s + '_ERROR.txt');
      mmo1.Clear;
    end;
  end;
  TiM_Auto.Enabled := CB_AUTO.Checked;

end;

procedure TMainForm.BitBtn7Click(Sender: TObject);
begin
  breack_MASS := true;
  TiM_Auto.Enabled := False;
  CB_AUTO.Checked := False;
end;

function linetostr(list: Tlistbox): string;
var
  I: Integer;
begin
  for I := 0 to list.Items.Count - 1 do
  begin
    if (I = (list.Items.Count - 1)) then
      result := result + '"' + list.Items.Strings[I] + '"'
    else
      result := result + '"' + list.Items.Strings[I] + '",'
  end;

end;

procedure TMainForm.BTN_1Click(Sender: TObject);
var
  index: string;
begin
  index := '';
  zQ_temp.Active := false;
  zQ_temp.SQL.Clear;
  zQ_temp.SQL.Add('select  DISTINCT `EXP`.`id_exp`');
  zQ_temp.SQL.Add('from `isl`,   `EXP`');
  zQ_temp.SQL.Add('where  (`isl`.`id_isl` = `EXP`.`id_isl`)');
  zQ_temp.SQL.Add('and (`isl`.`Instrument`  = "' + ComboBox_inst.Text + '")');
  zQ_temp.SQL.Add('and (`isl`.`Date` like  "' + FormatDateTime('yyyy-MM-dd', DTP_1.Date) + '%" ) ');
  zQ_temp.SQL.Add('and (`isl`.`Metod`  = "' + ComboBox_metod.Text + '")');
  zQ_temp.SQL.Add('order by  `EXP`.`id_exp`');
  zQ_temp.Active := true;
  zQ_temp.First;
  while not (zQ_temp.eof) do
  begin
    index := index + zQ_temp.FieldByName('id_exp').AsString + ',';
    zQ_temp.Next;
  end;
  SetLength(index, length(index) - 1);
  if lst3.Items.Count > 0 then
  begin
    zQ_temp.Active := false;
    zQ_temp.SQL.Clear;
    zQ_temp.SQL.Add('UPDATE  `exp_date`   ');
    zQ_temp.SQL.Add('SET `exp_date`.`DELETE` = 0 ');
    zQ_temp.SQL.Add('where (`exp_date`.`ElementP`  in (' + linetostr(lst3) + ')) ');
    zQ_temp.SQL.Add('and (`exp_date`.`id_exp`  in (' + index + ')) ');
    zQ_temp.ExecSQL;
    log(zQ_temp.SQL.Text);
  end;
  if lst4.Items.Count > 0 then
  begin
    zQ_temp.Active := false;
    zQ_temp.SQL.Clear;
    zQ_temp.SQL.Add('UPDATE  `exp_date`   ');
    zQ_temp.SQL.Add('SET `exp_date`.`DELETE` = 1 ');
    zQ_temp.SQL.Add('where (`exp_date`.`ElementP`  in (' + linetostr(lst4) + ')) ');
    zQ_temp.SQL.Add('and (`exp_date`.`id_exp`  in (' + index + ')) ');
    zQ_temp.ExecSQL;
    log(zQ_temp.SQL.Text);
  end;
  showmessage('Готово!')
end;

procedure TMainForm.BTN_CH_PATHClick(Sender: TObject);
const
  SELDIRHELP = 1000;
var
  S: string;
begin
  S := E_PATH_XLS.Text;
  if S = '' then
    S := ExtractFilePath(ParamStr(0));
  //Диалог выбора папки.
  if SelectDirectory(S, [sdAllowCreate, sdPerformCreate, sdPrompt], 0) then
  begin
    E_PATH_XLS.Text := S;
    FileListBox1.ApplyFilePath(E_PATH_XLS.Text);
    FileListBox1.Update;
  end;
end;

procedure TMainForm.Btn_ConectClick(Sender: TObject);
var
  s: string;
begin
  with ZConnection2 do
  try
    Connected := false;
    HostName := E_IP.Text;
    Database := E_DB.Text;
    User := E_USER.Text;
    Password := E_PASS.Text;
    Port := strtoint(E_Port.Text);

    Connected := true;
    Btn_Conect.Caption := 'СОЕДЕНЕНО';
    Btn_Conect.Font.Color := clGreen;
    Btn_Conect.Font.Style := [fsBold];
  except
    on E: Exception do
    begin
      s := E.ClassName + #13 + #13 + 'Ошибка ! : ' + #13 + E.Message + #13 + #13 + 'IP=' + E_IP.Text + ':' + E_Port.Text + 'BASE=' + E_DB.Text + 'USER=' + E_USER.Text;
      MessageBox(0, PChar(s), 'ОШИБКА', MB_OK + MB_ICONERROR + MB_APPLMODAL);
      Btn_Conect.Caption := 'СОЕДЕНИТСЯ';
      Btn_Conect.Font.Color := clRed;
      Btn_Conect.Font.Style := [];
    end;
  end;

end;

procedure moveLine(one: tlistbox; two: tlistbox);
begin
  if one.ItemIndex = -1 then
    exit;
  two.Items.Add(one.Items.Strings[one.ItemIndex]);
  one.Items.Delete(one.ItemIndex);
  two.Sorted := false;
  two.Sorted := true;
end;

procedure TMainForm.BTN_leftClick(Sender: TObject);
var
  name: string;
begin
  name := (Sender as tcomponent).name;
  if (name = 'BTN_p2') or (name = 'lst4') then
    moveLine(lst4, lst3)
  else if (name = 'BTN_left') or (name = 'lst2') then
    moveLine(lst2, lst1);
end;

procedure TMainForm.BTN_rigthClick(Sender: TObject);
var
  name: string;
begin
  name := (Sender as tcomponent).name;
  if (name = 'BTN_p3') or (name = 'lst3') then
    moveLine(lst3, lst4)
  else if (name = 'BTN_rigth') or (name = 'lst1') then
    moveLine(lst1, lst2);
end;

procedure TMainForm.BTN_SAVELOGClick(Sender: TObject);
begin
  Memo1.Lines.SaveToFile('log ' + StringReplace(DateTimeToStr(Now), ':', '-', [rfReplaceAll, rfIgnoreCase]) + '.txt');
end;

procedure TMainForm.btn_updatefolderClick(Sender: TObject);
begin
  FileListBox1.Update;
end;

procedure TMainForm.CB_AUTOClick(Sender: TObject);
begin
  TiM_Auto.Enabled := CB_AUTO.Checked;
end;

procedure TMainForm.ComboBox_instClick(Sender: TObject);
var
  bool: Boolean;
begin
  bool := false;
  if (Sender is TComboBox) then
    if ((Sender as TComboBox).name <> 'ComboBox_metod') then
      bool := true;
  if (Sender is TDateTimePicker) then
    bool := true;
  if bool then
  begin
    zQ_temp.Active := false;
    zQ_temp.SQL.Clear;
    zQ_temp.SQL.Add('SELECT distinct `isl`.`Metod` as Name ');
    zQ_temp.SQL.Add('FROM `isl` where                        ');
    zQ_temp.SQL.Add('(`isl`.`Instrument`  = "' + ComboBox_inst.Text + '") ');
    zQ_temp.SQL.Add(' and (`isl`.`Date` like  "' + FormatDateTime('yyyy-MM-dd', DTP_1.Date) + '%" ) ');
    zQ_temp.Active := true;

    ComboBox_metod.Clear;
    if zQ_temp.RecordCount > 0 then
    begin
      zQ_temp.First;
      while not (zQ_temp.Eof) do
      begin
        ComboBox_metod.Items.Add(zQ_temp.FieldByName('Name').AsString);
        zQ_temp.Next;
      end;
      ComboBox_metod.ItemIndex := 0;
    end
    else
    begin
      lst3.Clear;
      lst4.Clear;
    end;

  end;

  if ComboBox_metod.Items.Count > 0 then
  begin
    lst3.Clear;
    lst4.Clear;
    zQ_temp.Active := false;
    zQ_temp.SQL.Clear;
    zQ_temp.SQL.Add('SELECT distinct `exp_date`.`ElementP` as Name ');
    zQ_temp.SQL.Add('FROM `isl`, `exp_date` , `EXP` where  (`isl`.`id_isl` = `EXP`.`id_isl`) and (`EXP`.`id_EXP`= `exp_date`.`id_exp`)  ');
    zQ_temp.SQL.Add('and (`isl`.`Instrument`  = "' + ComboBox_inst.Text + '") ');
    zQ_temp.SQL.Add('and (`isl`.`Date` like  "' + FormatDateTime('yyyy-MM-dd', DTP_1.Date) + '%" ) ');
    zQ_temp.SQL.Add('and (`isl`.`Metod`  = "' + ComboBox_metod.Text + '") ');
    zQ_temp.SQL.Add('and (`exp_date`.`DELETE` = 0) ');
    zQ_temp.SQL.Add('order by `exp_date`.`ElementP` ');
    zQ_temp.Active := true;
    if zQ_temp.RecordCount > 0 then
    begin
      zQ_temp.First;
      while not (zQ_temp.Eof) do
      begin
        lst3.Items.Add(zQ_temp.FieldByName('Name').AsString);
        zQ_temp.Next;
      end;
      //ComboBox_metod.ItemIndex := 0;
    end;
    zQ_temp.Active := false;
    zQ_temp.SQL.Clear;
    zQ_temp.SQL.Add('SELECT distinct `exp_date`.`ElementP` as Name ');
    zQ_temp.SQL.Add('FROM `isl`, `exp_date` , `EXP` where  (`isl`.`id_isl` = `EXP`.`id_isl`) and (`EXP`.`id_EXP`= `exp_date`.`id_exp`)  ');
    zQ_temp.SQL.Add('and (`isl`.`Instrument`  = "' + ComboBox_inst.Text + '") ');
    zQ_temp.SQL.Add('and (`isl`.`Date` like  "' + FormatDateTime('yyyy-MM-dd', DTP_1.Date) + '%" ) ');
    zQ_temp.SQL.Add('and (`isl`.`Metod`  = "' + ComboBox_metod.Text + '") ');
    zQ_temp.SQL.Add('and (`exp_date`.`DELETE` = 1) ');
    zQ_temp.SQL.Add('order by `exp_date`.`ElementP` ');
    zQ_temp.Active := true;
    if zQ_temp.RecordCount > 0 then
    begin
      zQ_temp.First;
      while not (zQ_temp.Eof) do
      begin
        lst4.Items.Add(zQ_temp.FieldByName('Name').AsString);
        zQ_temp.Next;
      end;
      //ComboBox_metod.ItemIndex := 0;
    end;
  end;

end;

procedure TMainForm.FormClose(Sender: TObject; var Action: TCloseAction);
var
  INI: TiniFile;
begin
  INI := TIniFile.Create(Path + 'config.ini'); // полный путь к программе и имя ini файла
  try
    INI.WriteString('MAIN', 'PATH_XLS', E_PATH_XLS.Text);
    INI.WriteBool('MAIN', 'AUTO', CB_AUTO.Checked);
    INI.WriteBool('MAIN', 'IGNOR', CheckBox_1.Checked);
    INI.WriteBool('MAIN', 'DEL_UPPLOAD', CheckBox1.Checked);
    // Пути

    INI.WriteString('MAIN', 'PATH_LOG', E_Ciros.Text);
  //  INI.WriteString('MAIN', 'PATH_Arcos', E_Arcos.Text);

    //INI.WriteBool('MAIN', 'DEL_DUBL', CheckBox2.Checked);
    INI.WriteString('SQL', 'IP', E_IP.Text);
    INI.WriteString('SQL', 'USER', E_USER.Text);
    INI.WriteString('SQL', 'PASS', E_PASS.Text);
    INI.WriteString('SQL', 'PORT', E_Port.Text);
    INI.WriteString('SQL', 'Base', E_DB.Text);
    ZConnection2.Connected := false;
  finally
    INI.Free;
  end;

end;

procedure TMainForm.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  if CB_AUTO.Checked then
    case MessageBoxW(Handle, PWideChar('Выйти из загрузчика?' + #13#10 + 'ЗАГРУЗКА НОВЫХ ЗНАЧЕНИЙ ПРЕКРАТИТСЯ!'), PWideChar('Предупреждение'), MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON2 + MB_TOPMOST) of
      IDYES:
        begin
          CanClose := True;
          BTN_SAVELOGClick(BTN_SAVELOG);
        end;
      IDNO:
        begin
          CanClose := False;
        end;
    end;
end;

procedure TMainForm.FormCreate(Sender: TObject);
var
  INI: TiniFile;
  FileHandle: THandle;
  s,u: string;
begin
  ZConnection2.LibraryLocation := '';
  //Label_1.Caption := '';
  BTN_1.Caption := '';
  Path := Application.ExeName;
  Metod := '-1';
  DTP_1.DateTime := Now;
  Path := ExtractFileDir(Path); // отбрасываем название программы. Остается путь.
  if Path[Length(Path)] <> '\' then
    Path := Path + '\'; // если последний символ не \ то добавить его
  INI := TIniFile.Create(Path + 'config.ini'); // полный путь к программе и имя ini файла
  if FileExists('config.ini') then
  begin
    E_PATH_XLS.Text := INI.readstring('MAIN', 'PATH_XLS', '\\172.19.3.3\public\xml');
    CB_AUTO.Checked := INI.ReadBool('MAIN', 'AUTO', CB_AUTO.Checked);
    CheckBox_1.Checked := INI.ReadBool('MAIN', 'IGNOR', CheckBox_1.Checked);
    CheckBox1.Checked := INI.ReadBool('MAIN', 'DEL_UPPLOAD', CheckBox1.Checked);
    //CheckBox2.Checked := INI.ReadBool('MAIN', 'DEL_DUBL', CheckBox2.Checked);
    FileListBox1.ApplyFilePath(E_PATH_XLS.Text);
    //пути
    E_Ciros.Text := INI.readstring('MAIN', 'PATH_LOG','');

    //
    E_IP.Text := INI.readstring('SQL', 'IP', E_IP.Text);
    E_USER.Text := INI.readstring('SQL', 'USER', E_USER.Text);
    E_PASS.Text := INI.readstring('SQL', 'PASS', E_PASS.Text);
    E_Port.Text := INI.readstring('SQL', 'PORT', E_Port.Text);
    E_DB.Text := INI.readstring('SQL', 'Base', E_DB.Text);
    Btn_ConectClick(Btn_Conect);
    INI.Free;
    U:=ofUser();
  end
  else
  begin
    FileHandle := CreateFile(PChar(Path + 'config.ini'), GENERIC_READ or GENERIC_WRITE, FILE_SHARE_WRITE or FILE_SHARE_READ, nil, CREATE_NEW, FILE_ATTRIBUTE_NORMAL or FILE_FLAG_OVERLAPPED, 0);
    CloseHandle(FileHandle);
    INI.WriteString('MAIN', 'PATH_XLS', E_PATH_XLS.Text);
    INI.WriteBool('MAIN', 'AUTO', CB_AUTO.Checked);
    INI.WriteBool('MAIN', 'IGNOR', CheckBox_1.Checked);
    INI.WriteBool('MAIN', 'DEL_UPPLOAD', CheckBox1.Checked);
    //INI.WriteBool('MAIN', 'DEL_DUBL', CheckBox2.Checked);
    FileListBox1.ApplyFilePath(E_PATH_XLS.Text);
    INI.WriteString('SQL', 'IP', E_IP.Text);
    INI.WriteString('SQL', 'USER', E_USER.Text);
    INI.WriteString('SQL', 'PASS', E_PASS.Text);
    INI.WriteString('SQL', 'PORT', E_Port.Text);
    INI.WriteString('SQL', 'Base', E_DB.Text);
    Btn_ConectClick(Btn_Conect);
    INI.Free;
  end;
end;

procedure TMainForm.N4Click(Sender: TObject);
var
  s: string;
begin
  s := InputBox('Password', #1'Please Enter a Password', '');
  if ((s = 'ёлки') or (s = '`krb')) then
  begin
    mass.Mass_FM.Visible := False;
    mass.Mass_FM.Visible := true;
  end;
end;

procedure TMainForm.N5Click(Sender: TObject);
var
  s: string;
begin
  s := InputBox('Password', #1'Please Enter a Password', '');
  if ((s = 'ёлки') or (s = '`krb')) then
  begin
    Metod_FM.Visible := False;
    Metod_FM.Visible := true;
   // R_FM.FM_Rastvor.rg1Click(R_FM.FM_Rastvor.rg1);
  end;
end;

procedure TMainForm.N6Click(Sender: TObject);
begin
  panel1.Visible := not (panel1.Visible);

end;

end.

