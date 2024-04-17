unit untPesqClientes;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, DB, Forms, Controls, Graphics, Dialogs, DBGrids, StdCtrls,
  Buttons, ExtCtrls, untConnection;

type
  
  { TpesqClientesF }

  TpesqClientesF = class(TForm)
    bitBtnInserir: TBitBtn;
    bitBtnCancelar: TBitBtn;
    dsPesq: TDataSource;
    DBGrid1: TDBGrid;
    edtPesq: TEdit;
    Label1: TLabel;
    SpeedButton1: TSpeedButton;
    procedure bitBtnCancelarClick(Sender: TObject);
    procedure bitBtnInserirClick(Sender: TObject);
    procedure btnInserirClick(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);
    procedure SpeedButton1Click(Sender: TObject);
  private

  public

  end;

var
  pesqClientesF: TpesqClientesF;

implementation
uses
  untCadOrcamentos;

{$R *.lfm}

{ TpesqClientesF }

procedure TpesqClientesF.SpeedButton1Click(Sender: TObject);
begin
  DataModule1.qryPesqClienteOrc.Close;
  DataModule1.qryPesqClienteOrc.SQL.Clear;
  DataModule1.qryPesqClienteOrc.SQL.Add('select clienteid, cpf_cnpj_cliente, nome_cliente from cliente ' +  
                                                'where clienteid = ' + edtPesq.Text);
  DataModule1.qryPesqClienteOrc.Open;
end;

procedure TpesqClientesF.btnInserirClick(Sender: TObject);
begin

end;

procedure TpesqClientesF.bitBtnInserirClick(Sender: TObject);
begin
  Close;
end;

procedure TpesqClientesF.bitBtnCancelarClick(Sender: TObject);
begin
  Close;
end;

procedure TpesqClientesF.DBGrid1DblClick(Sender: TObject);
begin
  cadOrcamentosF.qryCadOrcamentosclienteid.AsInteger:= DataModule1.qryPesqClienteOrcclienteid.AsInteger;
  Close;
end;

procedure TpesqClientesF.FormClose(Sender: TObject; 
  var CloseAction: TCloseAction);
begin
  CloseAction:= caFree;
end;

end.

