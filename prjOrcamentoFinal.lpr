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
  untLogin, untRelProdutos, untRelUsuarios, 
untRelOrcamentos, untUsuarios, Unit4, Unit1
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
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TForm2, Form2);
  Application.CreateForm(TForm3, Form3);
  Application.CreateForm(TrelUsuariosF, relUsuariosF);
  Application.CreateForm(TrelOrcamentosF, relOrcamentosF);
  Application.Run;
end.

