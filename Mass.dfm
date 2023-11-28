object Mass_FM: TMass_FM
  Left = 0
  Top = 0
  BorderStyle = bsSingle
  Caption = 'Mass_FM'
  ClientHeight = 513
  ClientWidth = 766
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Label_4: TLabel
    Left = 277
    Top = 8
    Width = 227
    Height = 25
    Caption = #1047#1072#1084#1077#1085#1080#1090#1100' '#1053#1072#1079#1074#1072#1085#1080#1077' '#1085#1072':'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -21
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object pnl1: TPanel
    Left = 0
    Top = -1
    Width = 256
    Height = 153
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    object Label_1: TLabel
      Left = 16
      Top = 1
      Width = 53
      Height = 16
      Caption = #1059#1089#1083#1086#1074#1080#1103':'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsUnderline]
      ParentFont = False
    end
    object Label_2: TLabel
      Left = 13
      Top = 21
      Width = 60
      Height = 13
      Caption = #1048#1085#1089#1090#1088#1091#1084#1077#1085#1090
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label_3: TLabel
      Left = 14
      Top = 85
      Width = 75
      Height = 13
      Caption = #1048#1084#1103' '#1080#1079#1084#1077#1088#1077#1085#1080#1103
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label1: TLabel
      Left = 13
      Top = 45
      Width = 74
      Height = 13
      Caption = #1058#1080#1087' '#1080#1079#1084#1077#1088#1077#1085#1080#1103
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label_5: TLabel
      Left = 13
      Top = 66
      Width = 37
      Height = 13
      Caption = #1052#1077#1090#1086#1076':'
    end
    object chk1: TCheckBox
      Left = 126
      Top = 126
      Width = 130
      Height = 17
      Caption = #1057#1090#1088#1086#1075#1086#1077' '#1088#1072#1074#1077#1085#1089#1090#1088#1074#1086
      Checked = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      State = cbChecked
      TabOrder = 0
    end
    object E_2: TEdit
      Left = 14
      Top = 99
      Width = 121
      Height = 21
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
    end
    object ComboBox_1: TComboBox
      Left = 95
      Top = 18
      Width = 145
      Height = 21
      Style = csDropDownList
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ItemIndex = 0
      ParentFont = False
      TabOrder = 2
      Text = 'Ciros'
      OnChange = ComboBox_1Change
      Items.Strings = (
        'Ciros'
        'ARCOS_EOP')
    end
    object ComboBox1: TComboBox
      Left = 95
      Top = 42
      Width = 145
      Height = 21
      Style = csDropDownList
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ItemIndex = 0
      ParentFont = False
      TabOrder = 3
      Text = 'Unknown'
      Items.Strings = (
        'Unknown'
        'Calibration'
        'Control')
    end
    object BTN_1: TBitBtn
      Left = 14
      Top = 122
      Width = 75
      Height = 25
      Caption = #1042#1099#1074#1077#1089#1090#1080
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 4
      OnClick = BTN_1Click
    end
    object ComboBox_2: TComboBox
      Left = 95
      Top = 63
      Width = 145
      Height = 21
      Style = csDropDownList
      TabOrder = 5
    end
    object CheckBox_1: TCheckBox
      Left = 62
      Top = 65
      Width = 27
      Height = 17
      TabOrder = 6
    end
  end
  object E_1: TEdit
    Left = 277
    Top = 33
    Width = 227
    Height = 21
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
  end
  object BTN_2: TBitBtn
    Left = 429
    Top = 54
    Width = 75
    Height = 25
    Caption = #1047#1072#1084#1077#1085#1080#1090#1100
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
    OnClick = BTN_2Click
  end
  object DBGrid_1: TJvDBGrid
    Left = 0
    Top = 152
    Width = 766
    Height = 361
    Align = alBottom
    DataSource = DS_1
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 3
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    OnDrawColumnCell = DBGrid_1DrawColumnCell
    OnTitleClick = DBGrid_1TitleClick
    SelectColumnsDialogStrings.Caption = 'Select columns'
    SelectColumnsDialogStrings.OK = '&OK'
    SelectColumnsDialogStrings.NoSelectionWarning = 'At least one column must be visible!'
    EditControls = <>
    RowsHeight = 17
    TitleRowHeight = 17
    Columns = <
      item
        Expanded = False
        FieldName = 'Name'
        Width = 170
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Metod'
        ReadOnly = True
        Width = 150
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'Instrument'
        ReadOnly = True
        Width = 70
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'Type_Isl'
        ReadOnly = True
        Width = 70
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Date'
        ReadOnly = True
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'info_isl'
        ReadOnly = True
        Width = 70
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'origin_isl'
        ReadOnly = True
        Width = 70
        Visible = True
      end>
  end
  object zQ_1: TZQuery
    Connection = MainForm.ZConnection2
    SQL.Strings = (
      
        'SELECT `Name`,`Metod`,`Instrument`, `Type_Isl`,`Date`,`info_isl`' +
        ',`origin_isl` FROM lims.isl')
    Params = <>
    Left = 86
    Top = 300
  end
  object DS_1: TDataSource
    DataSet = zQ_1
    Left = 143
    Top = 309
  end
  object zQ_11: TZQuery
    Connection = MainForm.ZConnection2
    SQL.Strings = (
      'SELECT  distinct `Metod`'
      'FROM lims.isl')
    Params = <>
    Left = 212
    Top = 258
  end
  object DS_11: TDataSource
    DataSet = zQ_11
    Left = 269
    Top = 267
  end
end
