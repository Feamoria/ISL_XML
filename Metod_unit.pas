unit Metod_unit;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, JvExControls, JvDBLookup,
  Vcl.StdCtrls, Vcl.Mask, Vcl.DBCtrls, Vcl.ExtCtrls, Data.DB, ZAbstractRODataset,
  ZAbstractDataset, ZDataset, Vcl.Grids, Vcl.DBGrids, JvExDBGrids, JvDBGrid, Vcl.ComCtrls,
  JvExComCtrls, JvComCtrls, Vcl.Buttons, JvDBControls;

type
  TMetod_FM = class(TForm)
    JvDBLookupList_Metod: TJvDBLookupList;
    zQ_temp: TZQuery;
    DS_temp: TDataSource;
    zQ_1: TZQuery;
    DS_1: TDataSource;
    pnl1: TPanel;
    dbnvgr2: TDBNavigator;
    DB_ED_Name: TDBEdit;
    pnl2: TPanel;
    JvDBGrid1: TJvDBGrid;
    DS_pogr: TDataSource;
    zQ_pogr: TZQuery;
    DB_ED_id: TDBEdit;
    jvpgcntrl1: TJvPageControl;
    ts1: TTabSheet;
    ts2: TTabSheet;
    zQ_metod: TZQuery;
    DS_metod: TDataSource;
    JvDBLookupList_metodICP: TJvDBLookupList;
    DS_metodICP: TDataSource;
    zQ_metodICP: TZQuery;
    JvDBLookupList_metods: TJvDBLookupList;
    pnl3: TPanel;
    BTN_1: TBitBtn;
    BTN_2: TBitBtn;
    Panel1: TPanel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    pnl4: TPanel;
    ComboBox_1: TComboBox;
    DB_ED_Name1: TDBEdit;
    DB_ED_id1: TDBEdit;
    JvDBNavigator1: TJvDBNavigator;
    procedure dbnvgr2Click(Sender: TObject; Button: TNavigateBtn);
    procedure JvDBLookupList_MetodDblClick(Sender: TObject);
    procedure JvDBLookupList_MetodClick(Sender: TObject);
    procedure ComboBox_1Change(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure zQ_pogrBeforePost(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Metod_FM: TMetod_FM;

implementation

uses
  Main;
{$R *.dfm}

procedure select_sql(ZQ: TZQuery; SQL: string);
begin
  ZQ.Active := false;
  ZQ.SQL.Text := SQL;
  ZQ.Active := true;
end;

procedure TMetod_FM.BitBtn1Click(Sender: TObject);
begin
  if (JvDBLookupList_Metod.Value <> '') and (JvDBLookupList_metodICP.Value <> '') then
  begin
    zQ_metod.Insert;
    zQ_metod.Edit;
    DB_ED_Name1.Text := JvDBLookupList_metodICP.Value;
    DB_ED_id1.Text := DB_ED_id.Text;
    zQ_metod.Post;
    zQ_metod.Refresh;
  end;
  ComboBox_1Change(ComboBox_1) ;
//ShowMessage( JvDBLookupList_metodICP.Value);
end;

procedure TMetod_FM.BitBtn2Click(Sender: TObject);
begin
  case MessageBoxW(Handle, Pchar('Удалить запись?' + #13 + DB_ED_Name1.Text), 'Предупреждение', MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON2 + MB_TOPMOST) of
    IDYES:
      begin
        zQ_metod.Delete;
        ComboBox_1Change(ComboBox_1);
      end;
  end;
end;

procedure TMetod_FM.ComboBox_1Change(Sender: TObject);
var
  sql: string;
begin
  sql := 'select distinct `Metod` FROM `isl` ';
  sql := sql + ' where `Instrument` = "' + ComboBox_1.Text + '" ';
  sql := sql + ' and `Metod` not in (';
  zQ_metod.First;
  repeat
    sql := sql + '"' + zQ_metod.FieldByName('Name').AsString + '"';
    zQ_metod.Next;
    if not(zQ_metod.Eof) then
      sql := sql + ','
    else
      sql := sql + ')';
  until (zQ_metod.Eof);
  sql := sql + ' order by `Metod`';

  //ShowMessage(sql);
  select_sql(zQ_metodICP, sql)
end;

procedure TMetod_FM.dbnvgr2Click(Sender: TObject; Button: TNavigateBtn);
var
  s: string;
begin
  if Button = nbInsert then
  begin
    s := '';
    s := InputBox('Название методики', 'Введите название', '');
    if (s <> '') then
    begin
      zQ_1.Edit;
      DB_ED_Name.Text := s;
      zQ_1.Post;
    end
    else
      zQ_1.Cancel;
  end;
end;

procedure TMetod_FM.JvDBLookupList_MetodClick(Sender: TObject);
begin
  select_sql(zQ_pogr, 'SELECT * FROM `control` where PNDF =' + DB_ED_id.Text + ' order by Element,id ');
  select_sql(zQ_metod, 'SELECT * FROM `Metodic_ICP` where id_m =' + DB_ED_id.Text + ' order by Name ');
  ComboBox_1Change(ComboBox_1);
end;

procedure TMetod_FM.JvDBLookupList_MetodDblClick(Sender: TObject);
var
  s: string;
begin
  s := '';
  s := InputBox('Название методики', 'Введите название', DB_ED_Name.Text);
  if (s <> '') then
  begin
    zQ_1.Edit;
    DB_ED_Name.Text := s;
    zQ_1.Post;
  end
  else
    zQ_1.Cancel;
end;

procedure TMetod_FM.zQ_pogrBeforePost(DataSet: TDataSet);
begin
  if DataSet.FieldByName('ED').AsString = '' then
    DataSet.FieldByName('ED').AsString := 'мг/дм3'  ;
  if DataSet.FieldByName('ED').AsString = 'мг/дм3' then
    DataSet.FieldByName('ED_int').AsString := '1000000'
  else if DataSet.FieldByName('ED').AsString = 'мг/кг' then
    DataSet.FieldByName('ED_int').AsString := '1000000'
  else if DataSet.FieldByName('ED').AsString = 'мкг/дм3' then
    DataSet.FieldByName('ED_int').AsString := '1000'
  else if DataSet.FieldByName('ED').AsString = 'мкг/кг' then
    DataSet.FieldByName('ED_int').AsString := '1000' ;
  DataSet.FieldByName('PNDF').AsString:=DB_ED_id.Text;
end;

end.

