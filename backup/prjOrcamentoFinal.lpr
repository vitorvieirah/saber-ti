program prjOrcamentoFinal;

{$mode objfpc}{$H+}

uses
  {$IFDEF UNIX}
  cthreads,
  {$ENDIF}
  {$IFDEF HASAMIGA}
  athreads,
  {$ENDIF}
  Interfaces, // this includes the LCL widgetset
  Forms, zcomponent, untModelo, untConnection, untMenuPrincipal,
  untCadCategoria, untCadCliente, untCadProduto, untCadUsuarios, untSobre,
  untCadOrcamentos, untPesqClientes, untPesqProduto, untAddItem, relClientes,
  untLogin, untRelProdutos
  { you can add units after this };

{$R *.res}

begin
  RequireDerivedFormResource:=True;
  Application.Scaled:=True;
  Application.Initialize;
  Application.CreateForm(TDataModule1, DataModule1);
  Application.CreateForm(TloginF, loginF);
  Application.CreateForm(TmenuPrincipalF, menuPrincipalF);
  Application.CreateForm(TmodeloCadF, modeloCadF);
  Application.CreateForm(TrelProdutos, relProdutos);
  Application.Run;
end.

