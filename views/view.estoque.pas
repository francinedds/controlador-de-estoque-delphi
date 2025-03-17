unit view.estoque;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Data.DB,
  Vcl.Grids, Vcl.DBGrids, Vcl.Buttons, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.FB,
  FireDAC.Phys.FBDef, FireDAC.VCLUI.Wait, FireDAC.Stan.Param, FireDAC.DatS,
  FireDAC.DApt.Intf, FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  Vcl.Menus;

type
  TViewControleEstoque = class(TForm)
    pnlHeader: TPanel;
    pnlFooter: TPanel;
    pnlContent: TPanel;
    lblProduto: TLabel;
    lblTitle: TLabel;
    lblEstoque: TLabel;
    lblEstoqueMin: TLabel;
    edtProduto: TEdit;
    edtEstoque: TEdit;
    edtEstoqueMin: TEdit;
    pnlTable: TPanel;
    pnlButtons: TPanel;
    pnlBtnSalvar: TPanel;
    pnlBtnAlterar: TPanel;
    pnlBtnExcluir: TPanel;
    btnSalvar: TSpeedButton;
    btnAlterar: TSpeedButton;
    btnExcluir: TSpeedButton;
    pnlCoresEstoque: TPanel;
    pnlCorEstoqueMin: TPanel;
    lblAbaixoMinimo: TLabel;
    Panel1: TPanel;
    lblCorEstoqueReg: TLabel;
    DBGrid: TDBGrid;
    FDConnection: TFDConnection;
    DataSource: TDataSource;
    FDQuery: TFDQuery;
    FDQueryEST_CODIGO: TIntegerField;
    FDQueryEST_PRODUTO: TStringField;
    FDQueryEST_ESTOQUE: TIntegerField;
    FDQueryEST_ESTOQUEMIN: TIntegerField;
    PopupMenu: TPopupMenu;
    Deletar: TMenuItem;
    procedure DimensionarGrid(dbg: TDBGrid);
    procedure FormResize(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure DBGridDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure DeletarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  ViewControleEstoque: TViewControleEstoque;

implementation

{$R *.dfm}

{ TViewControleEstoque }

procedure TViewControleEstoque.btnAlterarClick(Sender: TObject);
begin // alterar
  FDQuery.Close;
  FDQuery.Open();
  DataSource.DataSet.Edit;
  edtProduto.Text    := FDQuery.FieldByName('est_produto').AsString;
  edtEstoque.Text    := FDQuery.FieldByName('est_estoque').AsString;
  edtEstoqueMin.Text := FDQuery.FieldByName('est_estoquemin').AsString;
end;

procedure TViewControleEstoque.btnExcluirClick(Sender: TObject);
begin // deletar
  FDQuery.Close;
  FDQuery.Open();
  DataSource.DataSet.Delete;
  FDQuery.FieldByName('est_produto').AsString;
  FDQuery.FieldByName('est_estoque').AsString;
  FDQuery.FieldByName('est_estoquemin').AsString;

  ShowMessage('Deletado com sucesso');
end;

procedure TViewControleEstoque.btnSalvarClick(Sender: TObject);
begin // salvar
  if DataSource.DataSet.State in [dsEdit, dsInsert] then
  begin
    FDQuery.Insert;
    FDQuery.FieldByName('est_produto').AsString    := edtProduto.Text;
    FDQuery.FieldByName('est_estoque').AsString    := edtEstoque.Text;
    FDQuery.FieldByName('est_estoquemin').AsString := edtEstoqueMin.Text;
    FDQuery.Post;

    ShowMessage('Salvo com sucesso!');
  end;
end;

procedure TViewControleEstoque.DBGridDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin // confere os estoques e trocam a cor da celula de acordo com o valor
    if (FDQueryEST_ESTOQUE.Value = 0) and (FDQueryEST_ESTOQUEMIN.Value = 0) then
    begin
      DBGrid.Canvas.Brush.Color := clWhite;
    end

    else if FDQueryEST_ESTOQUE.Value < FDQueryEST_ESTOQUEMIN.Value then
    begin
      DBGrid.Canvas.Brush.Color := $008080FF;
    end
    
    else if FDQueryEST_ESTOQUE.Value >= FDQueryEST_ESTOQUEMIN.Value then
    begin
      DBGrid.Canvas.Brush.Color := clMoneyGreen;
    end;

    DBGrid.DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;

procedure TViewControleEstoque.DeletarClick(Sender: TObject);
begin // deletar com popup
  FDQuery.Close;
  FDQuery.Open();
  DataSource.DataSet.Delete;
  FDQuery.FieldByName('est_produto').AsString;
  FDQuery.FieldByName('est_estoque').AsString;
  FDQuery.FieldByName('est_estoquemin').AsString;

  ShowMessage('Deletado com sucesso');
end;

procedure TViewControleEstoque.DimensionarGrid(dbg: TDBGrid);
type // dimensionar a grid automaticamente
  TArray = Array of Integer;
    procedure AjustarColumns(Swidth, TSize: Integer; Asize: TArray);
  var
  idx: Integer;
  begin
    if TSize = 0 then
    begin
      TSize := dbg.Columns.count;
      for idx := 0 to dbg.Columns.count - 1 do
      dbg.Columns[idx].Width := (dbg.Width - dbg.Canvas.TextWidth('AAAAAA')
      ) div TSize
    end
  else
    for idx := 0 to dbg.Columns.count - 1 do
    dbg.Columns[idx].Width := dbg.Columns[idx].Width +
    (Swidth * Asize[idx] div TSize);
  end;

  var
  idx, Twidth, TSize, Swidth: Integer;
  AWidth: TArray;
  Asize: TArray;
  NomeColuna: String;

  begin
    SetLength(AWidth, dbg.Columns.count);
    SetLength(Asize, dbg.Columns.count);
    Twidth := 0;
    TSize := 0;
    for idx := 0 to dbg.Columns.count - 1 do
      begin
      NomeColuna := dbg.Columns[idx].Title.Caption;
      dbg.Columns[idx].Width := dbg.Canvas.TextWidth
      (dbg.Columns[idx].Title.Caption + 'A');
      AWidth[idx] := dbg.Columns[idx].Width;
      Twidth := Twidth + AWidth[idx];

      if Assigned(dbg.Columns[idx].Field) then
      Asize[idx] := dbg.Columns[idx].Field.Size
      else
      Asize[idx] := 1;

      TSize := TSize + Asize[idx];
    end;

  if TDBGridOption.dgColLines in dbg.Options then
  Twidth := Twidth + dbg.Columns.count;

  // adiciona a largura da coluna indicada do cursor
  if TDBGridOption.dgIndicator in dbg.Options then
  Twidth := Twidth + IndicatorWidth;

  Swidth := dbg.ClientWidth - Twidth;
  AjustarColumns(Swidth, TSize, Asize);
  end;

procedure TViewControleEstoque.FormResize(Sender: TObject);
begin
  DimensionarGrid(DBGrid);
end;

end.
