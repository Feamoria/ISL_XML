object Metod_FM: TMetod_FM
  Left = 0
  Top = 0
  Caption = #1052#1077#1090#1086#1076#1099
  ClientHeight = 444
  ClientWidth = 703
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object pnl1: TPanel
    Left = 0
    Top = 0
    Width = 137
    Height = 444
    Align = alLeft
    Caption = 'pnl1'
    TabOrder = 0
    object JvDBLookupList_Metod: TJvDBLookupList
      Left = 1
      Top = 26
      Width = 133
      Height = 407
      Align = alLeft
      LookupField = 'id'
      LookupDisplay = 'Name'
      LookupSource = DS_1
      TabOrder = 0
      OnClick = JvDBLookupList_MetodClick
      OnDblClick = JvDBLookupList_MetodDblClick
    end
    object dbnvgr2: TDBNavigator
      Left = 1
      Top = 1
      Width = 135
      Height = 25
      DataSource = DS_1
      VisibleButtons = [nbInsert, nbDelete, nbRefresh]
      Align = alTop
      TabOrder = 1
      OnClick = dbnvgr2Click
    end
  end
  object DB_ED_Name: TDBEdit
    Left = 8
    Top = 404
    Width = 121
    Height = 21
    DataField = 'Name'
    DataSource = DS_1
    TabOrder = 1
    Visible = False
  end
  object pnl2: TPanel
    Left = 137
    Top = 0
    Width = 566
    Height = 444
    Align = alClient
    TabOrder = 2
    object jvpgcntrl1: TJvPageControl
      Left = 1
      Top = 1
      Width = 564
      Height = 442
      ActivePage = ts1
      Align = alClient
      MultiLine = True
      TabOrder = 0
      object ts1: TTabSheet
        Caption = #1055#1086#1075#1088#1077#1096#1085#1086#1089#1090#1080' '#1084#1077#1090#1086#1076#1080#1082#1080
        object JvDBGrid1: TJvDBGrid
          Left = 0
          Top = 0
          Width = 556
          Height = 389
          Align = alClient
          DataSource = DS_pogr
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'Tahoma'
          TitleFont.Style = []
          AutoAppend = False
          SelectColumnsDialogStrings.Caption = 'Select columns'
          SelectColumnsDialogStrings.OK = '&OK'
          SelectColumnsDialogStrings.NoSelectionWarning = 'At least one column must be visible!'
          EditControls = <>
          RowsHeight = 17
          TitleRowHeight = 17
          Columns = <
            item
              Expanded = False
              FieldName = 'id'
              Visible = False
            end
            item
              Expanded = False
              FieldName = 'Element'
              Title.Alignment = taCenter
              Width = 60
              Visible = True
            end
            item
              Alignment = taCenter
              Expanded = False
              FieldName = 'DiaN_A'
              PickList.Strings = (
                '0'
                '1')
              Title.Alignment = taCenter
              Title.Caption = #1057#1090#1088#1086#1075#1086#1077
              Width = 50
              Visible = True
            end
            item
              Alignment = taCenter
              Expanded = False
              FieldName = 'DiaN'
              Title.Alignment = taCenter
              Title.Caption = #1053#1072#1095#1072#1083#1086
              Width = 60
              Visible = True
            end
            item
              Alignment = taCenter
              Expanded = False
              FieldName = 'DiaK'
              Title.Alignment = taCenter
              Title.Caption = #1050#1086#1085#1077#1094
              Width = 60
              Visible = True
            end
            item
              Alignment = taCenter
              Expanded = False
              FieldName = 'Sigma'
              Title.Alignment = taCenter
              Width = 50
              Visible = True
            end
            item
              Alignment = taCenter
              Expanded = False
              FieldName = 'Delta'
              Title.Alignment = taCenter
              Width = 50
              Visible = True
            end
            item
              Alignment = taCenter
              Expanded = False
              FieldName = 'KS'
              Title.Alignment = taCenter
              Width = 50
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'instr'
              PickList.Strings = (
                'Ciros'
                'ARCOS_EOP')
              Title.Alignment = taCenter
              Title.Caption = #1048#1085#1089#1090#1088#1091#1084#1077#1085#1090
              Width = 70
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'ED'
              PickList.Strings = (
                #1084#1075'/'#1076#1084'3'
                #1084#1082#1075'/'#1076#1084'3'
                #1084#1075'/'#1082#1075
                #1084#1082#1075'/'#1082#1075)
              Title.Alignment = taCenter
              Title.Caption = #1045#1076'.'#1080#1079#1084
              Width = 60
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'ED_int'
              Title.Alignment = taCenter
              Visible = False
            end
            item
              Expanded = False
              FieldName = 'PNDF'
              Title.Alignment = taCenter
              Visible = False
            end>
        end
        object JvDBNavigator1: TJvDBNavigator
          Left = 0
          Top = 389
          Width = 556
          Height = 25
          DataSource = DS_pogr
          VisibleButtons = [nbFirst, nbLast, nbInsert, nbDelete, nbPost, nbCancel, nbRefresh, nbApplyUpdates, nbCancelUpdates]
          Align = alBottom
          TabOrder = 1
        end
      end
      object ts2: TTabSheet
        Caption = #1052#1077#1090#1086#1076#1099' ICP'
        ImageIndex = 1
        object JvDBLookupList_metods: TJvDBLookupList
          Left = 0
          Top = 0
          Width = 225
          Height = 407
          Align = alLeft
          LookupField = 'id'
          LookupDisplay = 'Name'
          LookupSource = DS_metod
          TabOrder = 0
        end
        object pnl3: TPanel
          Left = 225
          Top = 0
          Width = 36
          Height = 414
          Align = alLeft
          TabOrder = 1
          object BTN_1: TBitBtn
            Left = 5
            Top = 1
            Width = 25
            Height = 25
            Caption = '+'
            TabOrder = 0
          end
          object BTN_2: TBitBtn
            Left = 5
            Top = 25
            Width = 25
            Height = 25
            Caption = '-'
            TabOrder = 1
          end
          object Panel1: TPanel
            Left = 1
            Top = 1
            Width = 36
            Height = 412
            Align = alLeft
            TabOrder = 2
            object BitBtn1: TBitBtn
              Left = 4
              Top = 118
              Width = 25
              Height = 25
              Caption = '<<'
              TabOrder = 0
              OnClick = BitBtn1Click
            end
            object BitBtn2: TBitBtn
              Left = 4
              Top = 142
              Width = 25
              Height = 25
              Caption = '>>'
              TabOrder = 1
              OnClick = BitBtn2Click
            end
          end
        end
        object pnl4: TPanel
          Left = 261
          Top = 0
          Width = 295
          Height = 414
          Align = alClient
          TabOrder = 2
          object JvDBLookupList_metodICP: TJvDBLookupList
            Left = 1
            Top = 22
            Width = 293
            Height = 381
            Align = alClient
            LookupField = 'Metod'
            LookupDisplay = 'Metod'
            LookupSource = DS_metodICP
            TabOrder = 0
          end
          object ComboBox_1: TComboBox
            Left = 1
            Top = 1
            Width = 293
            Height = 21
            Align = alTop
            Style = csDropDownList
            ItemIndex = 0
            TabOrder = 1
            Text = 'Ciros'
            TextHint = #1048#1085#1089#1090#1088#1091#1084#1077#1085#1090
            OnChange = ComboBox_1Change
            Items.Strings = (
              'Ciros'
              'ARCOS_EOP')
          end
        end
        object DB_ED_Name1: TDBEdit
          Left = 99
          Top = 352
          Width = 121
          Height = 21
          DataField = 'Name'
          DataSource = DS_metod
          TabOrder = 3
          Visible = False
        end
        object DB_ED_id1: TDBEdit
          Left = 98
          Top = 379
          Width = 121
          Height = 21
          DataField = 'id_m'
          DataSource = DS_metod
          TabOrder = 4
          Visible = False
        end
      end
    end
  end
  object DB_ED_id: TDBEdit
    Left = 8
    Top = 377
    Width = 121
    Height = 21
    DataField = 'id'
    DataSource = DS_1
    TabOrder = 3
    Visible = False
  end
  object zQ_temp: TZQuery
    Connection = MainForm.ZConnection2
    SQL.Strings = (
      'SELECT * from `obraz_KP_date`')
    Params = <>
    Left = 89
    Top = 232
  end
  object DS_temp: TDataSource
    DataSet = zQ_temp
    Left = 90
    Top = 282
  end
  object zQ_1: TZQuery
    Connection = MainForm.ZConnection2
    Active = True
    SQL.Strings = (
      'SELECT * FROM Metodics'
      'order by Name')
    Params = <>
    Left = 20
    Top = 79
  end
  object DS_1: TDataSource
    DataSet = zQ_1
    Left = 20
    Top = 127
  end
  object DS_pogr: TDataSource
    DataSet = zQ_pogr
    Left = 186
    Top = 383
  end
  object zQ_pogr: TZQuery
    Connection = MainForm.ZConnection2
    BeforePost = zQ_pogrBeforePost
    Active = True
    SQL.Strings = (
      'SELECT * FROM lims.control;')
    Params = <>
    Properties.Strings = (
      'SELECT * FROM lims.control')
    Left = 183
    Top = 333
  end
  object zQ_metod: TZQuery
    Connection = MainForm.ZConnection2
    Active = True
    SQL.Strings = (
      'SELECT * FROM lims.Metodic_ICP;')
    Params = <>
    Properties.Strings = (
      'SELECT * FROM lims.Metodic_ICP;')
    Left = 183
    Top = 231
  end
  object DS_metod: TDataSource
    DataSet = zQ_metod
    Left = 185
    Top = 275
  end
  object DS_metodICP: TDataSource
    DataSet = zQ_metodICP
    Left = 561
    Top = 360
  end
  object zQ_metodICP: TZQuery
    Connection = MainForm.ZConnection2
    Active = True
    SQL.Strings = (
      'select distinct `Metod` FROM `isl`'
      'order by `Metod`')
    Params = <>
    Properties.Strings = (
      'SELECT * FROM lims.Metodic_ICP;')
    Left = 560
    Top = 315
  end
end
