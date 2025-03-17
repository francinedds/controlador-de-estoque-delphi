program ProjetoControleEstoque;

uses
  Vcl.Forms,
  view.estoque in 'views\view.estoque.pas' {ViewControleEstoque};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TViewControleEstoque, ViewControleEstoque);
  Application.Run;
end.
