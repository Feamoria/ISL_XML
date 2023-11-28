object FM_Rastvor: TFM_Rastvor
  Left = 265
  Top = 0
  BorderIcons = [biSystemMenu]
  Caption = #1050#1055
  ClientHeight = 482
  ClientWidth = 503
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesigned
  PixelsPerInch = 96
  TextHeight = 13
  object spl1: TSplitter
    Left = 138
    Top = 0
    Height = 482
    ExplicitLeft = 1
    ExplicitTop = 52
    ExplicitHeight = 402
  end
  object pnl2: TPanel
    Left = 0
    Top = 0
    Width = 138
    Height = 482
    Align = alLeft
    Caption = 'pnl2'
    TabOrder = 0
    object rg1: TRadioGroup
      Left = 1
      Top = 1
      Width = 136
      Height = 30
      Align = alTop
      Columns = 3
      ItemIndex = 0
      Items.Strings = (
        #1050#1055
        #1050#1057
        #1050#1058)
      TabOrder = 0
      OnClick = rg1Click
    end
    object Panel1: TPanel
      Left = 1
      Top = 454
      Width = 136
      Height = 27
      Align = alBottom
      TabOrder = 2
      object BTN_1: TBitBtn
        Left = 0
        Top = 0
        Width = 48
        Height = 25
        Caption = 'COPY'
        TabOrder = 0
        OnClick = BTN_1Click
      end
      object CheckBox_1: TCheckBox
        Left = 54
        Top = 3
        Width = 65
        Height = 17
        Caption = 'with conc'
        Checked = True
        State = cbChecked
        TabOrder = 1
      end
    end
    object E_1: TEdit
      Left = 1
      Top = 31
      Width = 136
      Height = 21
      Align = alTop
      TabOrder = 1
      TextHint = #1055#1086#1080#1089#1082
      OnChange = rg1Click
    end
    object JvDBLookupList1: TJvDBLookupList
      Left = -1
      Top = 58
      Width = 133
      Height = 381
      LookupField = 'id_kp'
      LookupDisplay = 'Name'
      LookupSource = DS_osn
      TabOrder = 3
      OnClick = dblklst1Click
    end
  end
  object pnl4: TPanel
    Left = 141
    Top = 0
    Width = 362
    Height = 482
    Align = alClient
    Caption = 'pnl4'
    TabOrder = 1
    object pnl3: TPanel
      Left = 1
      Top = 1
      Width = 360
      Height = 132
      Align = alTop
      TabOrder = 0
      object lbl1: TLabel
        Left = 2
        Top = 26
        Width = 48
        Height = 13
        Caption = #1053#1072#1079#1074#1072#1085#1080#1077
      end
      object lbl2: TLabel
        Left = 128
        Top = 60
        Width = 75
        Height = 13
        Caption = #1057#1088#1086#1082' '#1075#1086#1076#1085#1086#1089#1090#1080
      end
      object lbl3: TLabel
        Left = 128
        Top = 94
        Width = 159
        Height = 13
        Caption = #1057#1088#1086#1082' '#1075#1086#1076#1085#1086#1089#1090#1080' '#1087#1086#1089#1083#1077' '#1074#1089#1082#1088#1099#1090#1080#1103
      end
      object lbl4: TLabel
        Left = 2
        Top = 60
        Width = 99
        Height = 13
        Caption = #1044#1072#1090#1072' '#1080#1079#1075#1086#1090#1086#1074#1083#1077#1085#1080#1103
      end
      object lbl5: TLabel
        Left = 2
        Top = 94
        Width = 79
        Height = 13
        Caption = #1044#1072#1090#1072' '#1086#1090#1082#1088#1099#1090#1080#1103
      end
      object lbl6: TLabel
        Left = 254
        Top = 26
        Width = 99
        Height = 13
        Caption = #1045#1076#1077#1085#1080#1094#1072' '#1080#1079#1084#1077#1088#1077#1085#1080#1103
      end
      object Label_1: TLabel
        Left = 332
        Top = 113
        Width = 3
        Height = 13
      end
      object Label_2: TLabel
        Left = 254
        Top = 113
        Width = 76
        Height = 13
        Caption = #1059#1085#1080#1082#1072#1083#1100#1085#1086#1089#1090#1100':'
      end
      object BD_CB_ED: TDBComboBox
        Left = 254
        Top = 39
        Width = 99
        Height = 21
        Style = csDropDownList
        DataField = 'ED'
        DataSource = DS_osn
        Items.Strings = (
          #1084#1075'/'#1076#1084'3'
          #1084#1082#1075'/'#1076#1084'3')
        TabOrder = 0
        OnChange = BD_CB_EDChange
      end
      object DB_DateTimeED_izg: TRzDBDateTimeEdit
        Left = 2
        Top = 73
        Width = 121
        Height = 21
        DataSource = DS_osn
        DataField = 'date_izg'
        TabOrder = 1
        EditType = etDate
      end
      object DB_DateTimeED_otkr: TRzDBDateTimeEdit
        Left = 2
        Top = 107
        Width = 121
        Height = 21
        DataSource = DS_osn
        DataField = 'date_vskr'
        TabOrder = 2
        EditType = etDate
      end
      object DB_ED_Name: TDBEdit
        Left = 2
        Top = 39
        Width = 246
        Height = 21
        DataField = 'Name'
        DataSource = DS_osn
        TabOrder = 3
      end
      object DB_DateTimeED_god: TRzDBDateTimeEdit
        Left = 128
        Top = 73
        Width = 121
        Height = 21
        DataSource = DS_osn
        DataField = 'srok_god'
        TabOrder = 4
        EditType = etDate
      end
      object DB_DateTimeED_god_vskr: TRzDBDateTimeEdit
        Left = 128
        Top = 107
        Width = 121
        Height = 21
        DataSource = DS_osn
        DataField = 'srok_god_vskr'
        TabOrder = 5
        EditType = etDate
      end
      object DB_ED_INT: TDBEdit
        Left = 255
        Top = 67
        Width = 102
        Height = 21
        DataField = 'ED_INT'
        DataSource = DS_osn
        TabOrder = 6
        Visible = False
      end
      object dbnvgr2: TDBNavigator
        Left = 1
        Top = 1
        Width = 358
        Height = 25
        DataSource = DS_osn
        VisibleButtons = [nbInsert, nbDelete, nbPost, nbRefresh]
        Align = alTop
        TabOrder = 7
        OnClick = dbnvgr2Click
      end
    end
    object pnl1: TPanel
      Left = 1
      Top = 133
      Width = 360
      Height = 348
      Align = alClient
      Caption = 'pnl1'
      TabOrder = 1
      object dbnvgr1: TDBNavigator
        Left = 1
        Top = 1
        Width = 358
        Height = 25
        DataSource = DS_det
        VisibleButtons = [nbInsert, nbDelete, nbEdit, nbPost, nbCancel, nbRefresh, nbApplyUpdates, nbCancelUpdates]
        Align = alTop
        TabOrder = 0
        OnClick = dbnvgr1Click
      end
      object dbgrd_det: TDBGrid
        Left = 1
        Top = 26
        Width = 358
        Height = 321
        Align = alClient
        DataSource = DS_det
        TabOrder = 1
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
        Columns = <
          item
            Expanded = False
            FieldName = 'id_kp_date'
            Visible = False
          end
          item
            Expanded = False
            FieldName = 'id_kp'
            Visible = False
          end
          item
            Expanded = False
            FieldName = 'Element'
            Title.Caption = #1069#1083#1077#1084#1077#1085#1090
            Width = 150
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Cons'
            Title.Caption = #1050#1086#1085#1094#1077#1085#1090#1088#1072#1094#1080#1103
            Width = 80
            Visible = True
          end>
      end
    end
  end
  object zQ_osn: TZQuery
    Connection = MainForm.ZConnection2
    SQL.Strings = (
      'SELECT * FROM `obraz_KP` WHERE `type`=1;')
    Params = <>
    Left = 85
    Top = 162
  end
  object zQ_det: TZQuery
    Connection = MainForm.ZConnection2
    AfterInsert = zQ_detAfterInsert
    SQL.Strings = (
      'SELECT * from `obraz_KP_date`')
    Params = <>
    Left = 36
    Top = 166
  end
  object DS_osn: TDataSource
    DataSet = zQ_osn
    Left = 87
    Top = 211
  end
  object DS_det: TDataSource
    DataSet = zQ_det
    Left = 37
    Top = 216
  end
  object zQ_temp: TZQuery
    Connection = MainForm.ZConnection2
    AfterInsert = zQ_detAfterInsert
    SQL.Strings = (
      'SELECT * from `obraz_KP_date`')
    Params = <>
    Left = 54
    Top = 280
  end
  object DS_temp: TDataSource
    DataSet = zQ_temp
    Left = 55
    Top = 330
  end
end
