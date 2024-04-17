unit untmenuprincipal;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, Menus, untCadCategoria, untCadCliente,
  untCadProduto, untCadUsuarios, untSobre, untCadOrcamentos, relClientes, untRelProdutos;

type
  
  { TmenuPrincipalF }

  TmenuPrincipalF = class(TForm)
    subMnuVndOrcamentos: TMenuItem;
    subMnuRlClientes: TMenuItem;
    subMnuRlProdutos: TMenuItem;
    subMnuRlOrcamentos: TMenuItem;
    subMnuRlUsuarios: TMenuItem;
    mnuPrincipal: TMainMenu;
    mnuCadastros: TMenuItem;
    mnuVendas: TMenuItem;
    mnuRelatorios: TMenuItem;
    mnuSobre: TMenuItem;
    mnuSair: TMenuItem;
    subMnuCadCategoria: TMenuItem;
    subMnuCadCliente: TMenuItem;
    subMnuCadProduto: TMenuItem;
    subMnuCadUsuarios: TMenuItem;
    procedure mnuSairClick(Sender: TObject);
    procedure mnuSobreClick(Sender: TObject);
    procedure subMnuCadClienteClick(Sender: TObject);
    procedure subMnuCadUsuariosClick(Sender: TObject);
    procedure subMnuCadProdutoClick(Sender: TObject);
    procedure subMnuCadCategoriaClick(Sender: TObject);
    procedure subMnuRlClientesClick(Sender: TObject);
    procedure subMnuRlProdutosClick(Sender: TObject);
    procedure subMnuVndOrcamentosClick(Sender: TObject);
  private

  public

  end;

var
  menuPrincipalF: TmenuPrincipalF;

implementation

{$R *.lfm}

{ TmenuPrincipalF }

procedure TmenuPrincipalF.subMnuCadCategoriaClick(Sender: TObject);
begin
   cadCategoriaF := TcadCategoriaF.Create(Self);
   cadCategoriaF.ShowModal;
end;

procedure TmenuPrincipalF.subMnuRlClientesClick(Sender: TObject);
begin
   relClientesF :=  TrelClientesF.Create(Self);
   relClientesF.ShowModal;
end;

procedure TmenuPrincipalF.subMnuRlProdutosClick(Sender: TObject);
begin
  relProdutos := TrelProdutos.Create(Self);
  relProdutos.ShowModal;
end;

procedure TmenuPrincipalF.subMnuVndOrcamentosClick(Sender: TObject);
begin
   cadOrcamentosF := TcadOrcamentosF.Create(Self);
   cadOrcamentosF.ShowModal;
end;

procedure TmenuPrincipalF.subMnuCadProdutoClick(Sender: TObject);
begin
   cadProdutoF := TcadProdutoF.Create(Self);
   cadProdutoF.ShowModal;
end;

procedure TmenuPrincipalF.subMnuCadUsuariosClick(Sender: TObject);
begin
   cadUsuarioF := TcadUsuarioF.Create(Self);
   cadUsuarioF.ShowModal;
end;

procedure TmenuPrincipalF.subMnuCadClienteClick(Sender: TObject);
begin
   cadClienteF := TcadClienteF.Create(Self);
   cadClienteF.ShowModal;
end;

procedure TmenuPrincipalF.mnuSobreClick(Sender: TObject);
begin
   sobreF := TsobreF.Create(Self);
   sobreF.ShowModal;
end;

procedure TmenuPrincipalF.mnuSairClick(Sender: TObject);
begin
  if MessageDlg('Deseja sair ?', mtWarning, [mbYes, mbNo], 0) = mrYes then
     Application.Terminate;
end;

end.

