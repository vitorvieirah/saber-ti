unit untPesqProduto;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, DB, Forms, Controls, Graphics, Dialogs, DBGrids, StdCtrls,
  Buttons, untConnection;

type
  
  { TpesqProdutoF }

  TpesqProdutoF = class(TForm)
    bitBtnInserir: TBitBtn;
    bitBtnCancelar: TBitBtn;
    dsPesqProd: TDataSource;
    DBGrid1: TDBGrid;
    edtPesq: TEdit;
    Label1: TLabel;
    SpeedButton1: TSpeedButton;
    procedure bitBtnCancelarClick(Sender: TObject);
    procedure bitBtnInserirClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);
    procedure SpeedButton1Click(Sender: TObject);
  private

  public

  end;

var
  pesqProdutoF: TpesqProdutoF;

implementation

{$R *.lfm}

{ TpesqProdutoF }

procedure TpesqProdutoF.SpeedButton1Click(Sender: TObject);
begin
  DataModule1.qryPesqProds.Close;
  DataModule1.qryPesqProds.SQL.Clear;
  DataModule1.qryPesqProds.SQL.Add('select produtoid, ds_produto, vl_venda_produto from produto' +
                                           'where produtoid = ' + edtPesq.Text);
  DataModule1.qryPesqProds.Open;
end;

procedure TpesqProdutoF.bitBtnInserirClick(Sender: TObject);
begin
  Close;
end;

procedure TpesqProdutoF.FormClose(Sender: TObject; var CloseAction: TCloseAction
  );
begin
  CloseAction:= caFree;
end;

procedure TpesqProdutoF.bitBtnCancelarClick(Sender: TObject);
begin
  Close;
end;

end.

