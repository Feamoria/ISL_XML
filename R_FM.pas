unit R_FM;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB,
  ZAbstractRODataset, ZAbstractDataset, ZDataset, Vcl.StdCtrls, Vcl.Mask, Vcl.DBCtrls,
  Vcl.Buttons, Vcl.ExtCtrls, Vcl.Grids, Vcl.DBGrids, RzEdit, RzDBEdit,
  JvExControls, JvDBLookup, RzLstBox, RzDBList;

type
  TFM_Rastvor = class(TForm)
    zQ_osn: TZQuery;
    zQ_det: TZQuery;
    DS_osn: TDataSource;
    DS_det: TDataSource;
    DB_ED_Name: TDBEdit;
    lbl1: TLabel;
    lbl2: TLabel;
    lbl3: TLabel;
    dbgrd_det: TDBGrid;
    dbnvgr1: TDBNavigator;
    pnl1: TPanel;
    DB_DateTimeED_izg: TRzDBDateTimeEdit;
    DB_DateTimeED_otkr: TRzDBDateTimeEdit;
    lbl4: TLabel;
    lbl5: TLabel;
    BD_CB_ED: TDBComboBox;
    lbl6: TLabel;
    dbnvgr2: TDBNavigator;
    pnl2: TPanel;
    pnl3: TPanel;
    spl1: TSplitter;
    pnl4: TPanel;
    DB_DateTimeED_god: TRzDBDateTimeEdit;
    DB_DateTimeED_god_vskr: TRzDBDateTimeEdit;
    rg1: TRadioGroup;
    DB_ED_INT: TDBEdit;
    //JvDBLookupList1: TJvDBLookupList;
    Label_1: TLabel;
    zQ_temp: TZQuery;
    DS_temp: TDataSource;
    Label_2: TLabel;
    Panel1: TPanel;
    BTN_1: TBitBtn;
    CheckBox_1: TCheckBox;
    E_1: TEdit;
    JvDBLookupList1: TJvDBLookupList;
    procedure dblklst1Click(Sender: TObject);
    procedure dbnvgr1Click(Sender: TObject; Button: TNavigateBtn);
    procedure zQ_detAfterInsert(DataSet: TDataSet);
    procedure rg1Click(Sender: TObject);
    procedure dbnvgr2Click(Sender: TObject; Button: TNavigateBtn);
    procedure BD_CB_EDChange(Sender: TObject);
    procedure BTN_1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FM_Rastvor: TFM_Rastvor;

implementation

uses
  Main;
{$R *.dfm}

procedure TFM_Rastvor.BD_CB_EDChange(Sender: TObject);
begin
  case BD_CB_ED.ItemIndex of
    0:
      DB_ED_INT.Text := '1000000';
    1:
      DB_ED_INT.Text := '1000';
  end;

end;

procedure TFM_Rastvor.BTN_1Click(Sender: TObject);
var
  id: string;
begin
  id := zQ_osn.FieldByName('id_kp').AsString;
  zQ_temp.Active := false;
  with zQ_temp.SQL do
  begin
    Clear;
    Add('INSERT INTO `lims`.`obraz_KP`');
    Add('select a.N,CONCAT(`Name`,"_copy"),`date_izg`,`srok_god`,`date_vskr`,`srok_god_vskr`,`ED`,`ED_INT`,`type`');
    Add('from `obraz_KP` , (select max(`id_kp`)+1 as N from `obraz_KP` ) a where `id_kp` = ' + id );
    zQ_temp.ExecSQL;
    Clear;
    Add('INSERT INTO `lims`.`obraz_KP_date` (`id_kp`,`Element`,`Cons`)');
    Add('select (select max(`id_kp`) as N from `obraz_KP` ) as `id_kp` ,`Element`,');
    if CheckBox_1.Checked then
      Add('`Cons`')
    else
      Add('0');
    Add('from `obraz_KP_date` where `id_kp` = '+id);
    zQ_temp.ExecSQL;
  end;
  zQ_osn.Refresh;

end;

procedure TFM_Rastvor.dblklst1Click(Sender: TObject);
begin
  if zQ_osn.Active = false then
    zQ_osn.Active := True;
  zQ_det.Active := False;
  zQ_det.SQL.Text := 'SELECT * from `obraz_KP_date` where `id_kp` = ' + inttostr(JvDBLookupList1.KeyValue) + ' order by element';
  zQ_det.Active := True;
  zQ_temp.Active := False;
  zQ_temp.SQL.Text := 'SELECT `Name` from `obraz_KP` where `type`=' + inttostr(rg1.ItemIndex + 1) + ' and `Name` like "%' + JvDBLookupList1.DisplayValue + '%"';
 // ShowMessage(zQ_temp.SQL.Text);
  zQ_temp.Active := True;
  if zQ_temp.RecordCount > 1 then
    Label_1.Font.Color := clRed
  else
    Label_1.Font.Color := clWindowText;
  Label_1.Caption := IntToStr(zQ_temp.RecordCount);
end;

procedure TFM_Rastvor.dbnvgr1Click(Sender: TObject; Button: TNavigateBtn);
begin
  if Button = nbInsert then
  begin
    zQ_det.FieldByName('id_kp').AsInteger := zQ_osn.FieldByName('id_kp').AsInteger;
  end;
end;

procedure TFM_Rastvor.dbnvgr2Click(Sender: TObject; Button: TNavigateBtn);
begin
  if Button = nbPost then
  begin
    if BD_CB_ED.ItemIndex = -1 then
      ShowMessage('Õ≈ «¿¡€“‹ ≈ƒ≈Õ»÷€ »«Ã≈–≈Õ»ﬂ!');
  end;
  if Button = nbInsert then
  begin
    zQ_osn.FieldByName('type').AsInteger := rg1.ItemIndex + 1;
  end;
  zQ_det.Active := False;
end;

procedure TFM_Rastvor.rg1Click(Sender: TObject);
begin
  zQ_osn.Active := false;
  zQ_osn.SQL.Clear;
  zQ_osn.SQL.Add('SELECT * FROM `obraz_KP` WHERE')  ;
  zQ_osn.SQL.Add('`type`=' + inttostr(rg1.ItemIndex + 1))  ;
  if E_1.Text <> '' then
  zQ_osn.SQL.Add('and `Name` like "%'+E_1.Text+'%" ')  ;
  zQ_osn.SQL.Add('order by `Name`')  ;

  zQ_osn.Active := True;
end;

procedure TFM_Rastvor.zQ_detAfterInsert(DataSet: TDataSet);
begin
  zQ_det.FieldByName('id_kp').AsInteger := zQ_osn.FieldByName('id_kp').AsInteger;
end;

end.

