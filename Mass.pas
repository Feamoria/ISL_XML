unit Mass;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB,
  ZAbstractRODataset, ZAbstractDataset, ZDataset, Vcl.Grids, Vcl.DBGrids, Vcl.StdCtrls,
  Vcl.ExtCtrls, Vcl.Buttons, JvExDBGrids, JvDBGrid, Vcl.DBCtrls, JvExControls,
  JvDBLookup;

type
  TMass_FM = class(TForm)
    zQ_1: TZQuery;
    DS_1: TDataSource;
    pnl1: TPanel;
    Label_1: TLabel;
    Label_2: TLabel;
    chk1: TCheckBox;
    Label_3: TLabel;
    E_2: TEdit;
    ComboBox_1: TComboBox;
    Label1: TLabel;
    ComboBox1: TComboBox;
    BTN_1: TBitBtn;
    E_1: TEdit;
    Label_4: TLabel;
    BTN_2: TBitBtn;
    DBGrid_1: TJvDBGrid;
    Label_5: TLabel;
    zQ_11: TZQuery;
    DS_11: TDataSource;
    ComboBox_2: TComboBox;
    CheckBox_1: TCheckBox;
    procedure BTN_1Click(Sender: TObject);
    procedure BTN_2Click(Sender: TObject);
    procedure DBGrid_1DrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure DBGrid_1TitleClick(Column: TColumn);
    procedure ComboBox_1Change(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Mass_FM: TMass_FM;
  N: Integer;

implementation

uses
  R_FM, Main;

{$R *.dfm}

function WHERESQL(): string;
var
  sql: string;
begin
  sql := '';
  Result:='';
  with Mass_FM do
  begin
    if chk1.Checked then
      sql := sql + ' WHERE `name` like "' + trim(E_2.Text) + '" '
    else
      sql := sql + ' WHERE `name` like "%' + trim(E_2.Text) + '%" ';
    sql := sql + ' and `Instrument` = "' + ComboBox_1.Text + '" and `Type_Isl` ="' + ComboBox1.Text + '" ';
    if (ComboBox_2.Text <> '') and (CheckBox_1.Checked) then
      sql := sql + ' and `Metod` ="' + ComboBox_2.Text + '"  ';
  end;
  Result := sql;
end;

procedure TMass_FM.BTN_1Click(Sender: TObject);
var
  sql: string;
begin
  if WHERESQL <> '' then
  sql := 'SELECT `Name`,`Metod`,`Instrument`, `Type_Isl`,`Date`,`info_isl`,`origin_isl` FROM lims.isl ' + WHERESQL();
  zQ_1.Active := false;
  zQ_1.SQL.Text := sql;
  zQ_1.Active := true;
  N := zQ_1.RecordCount;
end;

procedure TMass_FM.BTN_2Click(Sender: TObject);
var
  sql, s: string;
  //W: WideChar;
begin
  BTN_1Click(BTN_1);
  s := 'Изменить ' + inttostr(N) + ' записей?';
  case MessageDlg(s, mtConfirmation, [mbYes, mbNo], 0) of
    mrYes:
      begin
        if WHERESQL <> '' then
          sql := 'UPDATE `lims`.`isl` SET `Name` = "' + trim(E_1.Text) + '" ' + WHERESQL();

        zQ_1.Active := false;
        zQ_1.SQL.Text := sql;
        zQ_1.ExecSQL;
      end;

  end;

end;

procedure TMass_FM.ComboBox_1Change(Sender: TObject);
begin
  zQ_11.Active := false;
  zQ_11.sql.Text := 'SELECT  distinct `Metod` FROM lims.isl where `Instrument` = "' + ComboBox_1.Text + '" order by `Metod` ';
  zQ_11.Active := true;
  ComboBox_2.Clear;
  zQ_11.First;
  while not (zQ_11.Eof) do
  begin
    ComboBox_2.Items.Add(zQ_11.FieldByName('Metod').AsString);
    zQ_11.Next;
  end;
  ComboBox_2.ItemIndex := 0;
end;

procedure TMass_FM.DBGrid_1DrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  DBGrid_1.Canvas.Brush.Style := bsClear;
  DBGrid_1.Canvas.Pen.Color := clGray;
  DBGrid_1.Canvas.Rectangle(Rect);
end;

procedure TMass_FM.DBGrid_1TitleClick(Column: TColumn);
var
  ss: string;
begin
  with zQ_1 do
  begin
    if FieldByName(Column.FieldName).Tag = 0 then
    begin
      ss := ' ASC';
      FieldByName(Column.FieldName).Tag := 1;
    end
    else
    begin
      ss := ' DESC';
      FieldByName(Column.FieldName).Tag := 0;
    end;
    SortedFields := Column.FieldName + ss;
  end;
end;

end.

