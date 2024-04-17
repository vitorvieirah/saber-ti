unit untAddItem;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, DB, Forms, Controls, Graphics, Dialogs, DBCtrls, StdCtrls, untPesqProduto, untConnection;

type
  
  { TaddItemF }

  TaddItemF = class(TForm)
    btnInserir: TButton;
    btnCancelar: TButton;
    btnPesqProd: TButton;
    dsAddItemOrc: TDataSource;
    dsPesqProd: TDataSource;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    DBEdit4: TDBEdit;
    dbEdtValorProd: TDBEdit;
    DBEdit6: TDBEdit;
    edtValorF: TEdit;
    edtQnt: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    procedure btnCancelarClick(Sender: TObject);
    procedure btnInserirClick(Sender: TObject);
    procedure btnPesqProdClick(Sender: TObject);
    procedure dsPesqProdDataChange(Sender: TObject; Field: TField);
    procedure edtQntExit(Sender: TObject);
    procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);
  private
  public

  end;

var
  addItemF: TaddItemF;

implementation
uses
untCadOrcamentos;
{$R *.lfm}

{ TaddItemF }

procedure TaddItemF.btnPesqProdClick(Sender: TObject);
begin
   pesqProdutoF := TpesqProdutoF.Create(Self);
   pesqProdutoF.ShowModal;
end;

procedure TaddItemF.dsPesqProdDataChange(Sender: TObject; Field: TField);
begin

end;

procedure TaddItemF.edtQntExit(Sender: TObject);
begin
     edtValorF.Text:= FloatToStr(StrToInt(edtQnt.Text) * StrToFloat(dbEdtValorProd.Text)); 
end;

procedure TaddItemF.FormClose(Sender: TObject; var CloseAction: TCloseAction);
begin 
  CloseAction:= caFree;
  if(cadOrcamentosF.dbEdtValorTotal.Text = '') then
  begin
    cadOrcamentosF.dbEdtValorTotal.Text := edtValorF.Text; 
  end
  else
      cadOrcamentosF.dbEdtValorTotal.Text:= FloatToStr(StrToFloat(cadOrcamentosF.dbEdtValorTotal.Text) + 
                                            StrToFloat(edtValorF.Text));
end;

procedure TaddItemF.btnInserirClick(Sender: TObject);
begin
  if StrToInt(edtQnt.Text) < 0 then
  begin
     ShowMessage('Quantidade insuficiente para adicionar produto !!');
     Exit;
  end;
  DataModule1.qryOrcItens.FieldByName('orcamentoid').AsString:= cadOrcamentosF.dbEdtId.Text;
  DataModule1.qryOrcItens.FieldByName('produtoid').AsString:= dsPesqProd.DataSet.FieldByName('produtoid').AsString;
  DataModule1.qryOrcItens.FieldByName('produtodesc').AsString:= dsPesqProd.DataSet.FieldByName('ds_produto').AsString;
  DataModule1.qryOrcItens.FieldByName('qt_produto').AsString:= edtQnt.Text;
  DataModule1.qryOrcItens.FieldByName('vl_unitario').AsString:= dsPesqProd.DataSet.FieldByName('vl_venda_produto').AsString;
  DataModule1.qryOrcItens.FieldByName('vl_total').AsString:= edtValorF.Text;
  
  DataModule1.qryOrcItens.Post;
  Close;
end;

procedure TaddItemF.btnCancelarClick(Sender: TObject);
begin
  dsPesqProd.DataSet.Cancel;
  Close;
end;
end.

