object ViewControleEstoque: TViewControleEstoque
  Left = 0
  Top = 0
  Caption = 'ViewControleEstoque'
  ClientHeight = 514
  ClientWidth = 624
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poDesktopCenter
  OnResize = FormResize
  TextHeight = 15
  object pnlHeader: TPanel
    Left = 0
    Top = 0
    Width = 624
    Height = 41
    Align = alTop
    BevelOuter = bvNone
    Color = clActiveCaption
    ParentBackground = False
    TabOrder = 0
    object lblTitle: TLabel
      Left = 24
      Top = 14
      Width = 182
      Height = 15
      Caption = 'Controle de Produtos no Estoque'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
    end
  end
  object pnlFooter: TPanel
    Left = 0
    Top = 494
    Width = 624
    Height = 20
    Align = alBottom
    BevelOuter = bvNone
    Color = clActiveCaption
    ParentBackground = False
    TabOrder = 1
  end
  object pnlContent: TPanel
    Left = 0
    Top = 41
    Width = 624
    Height = 72
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 2
    object lblProduto: TLabel
      Left = 24
      Top = 16
      Width = 43
      Height = 15
      Caption = 'Produto'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
    end
    object lblEstoque: TLabel
      Left = 424
      Top = 16
      Width = 42
      Height = 15
      Caption = 'Estoque'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
    end
    object lblEstoqueMin: TLabel
      Left = 512
      Top = 16
      Width = 87
      Height = 15
      Caption = 'Estoque M'#237'nimo'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
    end
    object edtProduto: TEdit
      Left = 24
      Top = 32
      Width = 385
      Height = 23
      CharCase = ecUpperCase
      TabOrder = 0
    end
    object edtEstoque: TEdit
      Left = 424
      Top = 32
      Width = 73
      Height = 23
      TabOrder = 1
    end
    object edtEstoqueMin: TEdit
      Left = 512
      Top = 32
      Width = 87
      Height = 23
      TabOrder = 2
    end
  end
  object pnlTable: TPanel
    Left = 0
    Top = 113
    Width = 624
    Height = 309
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 3
    object DBGrid: TDBGrid
      Left = 0
      Top = 0
      Width = 624
      Height = 309
      Cursor = crHandPoint
      Align = alClient
      BorderStyle = bsNone
      DataSource = DataSource
      Options = [dgEditing, dgTitles, dgColumnResize, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
      PopupMenu = PopupMenu
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -12
      TitleFont.Name = 'Segoe UI'
      TitleFont.Style = []
      OnDrawColumnCell = DBGridDrawColumnCell
      Columns = <
        item
          Expanded = False
          FieldName = 'EST_CODIGO'
          Title.Caption = 'C'#211'DIGO'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'EST_PRODUTO'
          Title.Caption = 'PRODUTO'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'EST_ESTOQUE'
          Title.Caption = 'ESTOQUE'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'EST_ESTOQUEMIN'
          Title.Caption = 'ESTOQUE M'#205'NIMO'
          Visible = True
        end>
    end
  end
  object pnlButtons: TPanel
    Left = 0
    Top = 422
    Width = 624
    Height = 72
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 4
    object pnlBtnSalvar: TPanel
      Left = 14
      Top = 22
      Width = 107
      Height = 33
      BevelOuter = bvNone
      Color = clActiveCaption
      ParentBackground = False
      TabOrder = 0
      object btnSalvar: TSpeedButton
        Left = 0
        Top = 0
        Width = 107
        Height = 33
        Cursor = crHandPoint
        Align = alClient
        Caption = 'Salvar'
        Flat = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
        OnClick = btnSalvarClick
        ExplicitLeft = 32
        ExplicitTop = 8
        ExplicitWidth = 23
        ExplicitHeight = 22
      end
    end
    object pnlBtnAlterar: TPanel
      Left = 127
      Top = 22
      Width = 107
      Height = 33
      BevelOuter = bvNone
      Color = clActiveCaption
      ParentBackground = False
      TabOrder = 1
      object btnAlterar: TSpeedButton
        Left = 0
        Top = 0
        Width = 107
        Height = 33
        Cursor = crHandPoint
        Align = alClient
        Caption = 'Alterar'
        Flat = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
        OnClick = btnAlterarClick
        ExplicitLeft = 40
        ExplicitTop = 11
        ExplicitWidth = 23
        ExplicitHeight = 22
      end
    end
    object pnlBtnExcluir: TPanel
      Left = 240
      Top = 22
      Width = 107
      Height = 33
      BevelOuter = bvNone
      Color = clActiveCaption
      ParentBackground = False
      TabOrder = 2
      object btnExcluir: TSpeedButton
        Left = 0
        Top = 0
        Width = 107
        Height = 33
        Cursor = crHandPoint
        Align = alClient
        Caption = 'Excluir'
        Flat = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
        OnClick = btnExcluirClick
        ExplicitLeft = 48
        ExplicitTop = 11
        ExplicitWidth = 23
        ExplicitHeight = 22
      end
    end
    object pnlCoresEstoque: TPanel
      Left = 439
      Top = 0
      Width = 185
      Height = 72
      Align = alRight
      BevelOuter = bvNone
      TabOrder = 3
      object lblAbaixoMinimo: TLabel
        Left = 68
        Top = 18
        Width = 99
        Height = 15
        Caption = 'Abaixo do M'#237'nimo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
      end
      object lblCorEstoqueReg: TLabel
        Left = 68
        Top = 39
        Width = 85
        Height = 15
        Caption = 'Estoque Regular'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
      end
      object pnlCorEstoqueMin: TPanel
        Left = 45
        Top = 16
        Width = 17
        Height = 17
        BevelOuter = bvNone
        Color = 8421631
        ParentBackground = False
        TabOrder = 0
      end
      object Panel1: TPanel
        Left = 45
        Top = 39
        Width = 17
        Height = 17
        BevelOuter = bvNone
        Color = clMoneyGreen
        ParentBackground = False
        TabOrder = 1
      end
    end
  end
  object FDConnection: TFDConnection
    Params.Strings = (
      'Database=C:\Users\EMANUEL\Desktop\banco\BANCOGOV.FDB'
      'User_Name=SYSDBA'
      'Password=masterkey'
      'DriverID=FB')
    Connected = True
    Left = 544
    Top = 185
  end
  object DataSource: TDataSource
    DataSet = FDQuery
    Left = 543
    Top = 246
  end
  object FDQuery: TFDQuery
    Active = True
    Connection = FDConnection
    SQL.Strings = (
      'select * from estoque')
    Left = 544
    Top = 305
    object FDQueryEST_CODIGO: TIntegerField
      AutoGenerateValue = arAutoInc
      FieldName = 'EST_CODIGO'
      Origin = 'EST_CODIGO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object FDQueryEST_PRODUTO: TStringField
      FieldName = 'EST_PRODUTO'
      Origin = 'EST_PRODUTO'
      Size = 10
    end
    object FDQueryEST_ESTOQUE: TIntegerField
      FieldName = 'EST_ESTOQUE'
      Origin = 'EST_ESTOQUE'
    end
    object FDQueryEST_ESTOQUEMIN: TIntegerField
      FieldName = 'EST_ESTOQUEMIN'
      Origin = 'EST_ESTOQUEMIN'
    end
  end
  object PopupMenu: TPopupMenu
    Left = 544
    Top = 369
    object Deletar: TMenuItem
      Caption = 'Deletar'
      OnClick = DeletarClick
    end
  end
end
