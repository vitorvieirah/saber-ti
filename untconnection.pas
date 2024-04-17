unit untConnection;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, DB, ZConnection, ZDataset;

type
  
  { TDataModule1 }

  TDataModule1 = class(TDataModule)
    qryOrcItensorcamentoid: TLongintField;
    qryOrcItensorcamentoitemid: TLongintField;
    qryOrcItensprodutodesc: TStringField;
    qryOrcItensprodutoid: TLongintField;
    qryOrcItensqt_produto: TFloatField;
    qryOrcItensvl_total: TFloatField;
    qryOrcItensvl_unitario: TFloatField;
    qryPesqClienteOrcclienteid: TLongintField;
    qryPesqClienteOrccpf_cnpj_cliente: TStringField;
    qryPesqClienteOrcnome_cliente: TStringField;
    qryPesqProdscategoriaprodutoid: TLongintField;
    qryPesqProdsds_produto: TStringField;
    qryPesqProdsdt_cadastro_produto: TDateTimeField;
    qryPesqProdsobs_produto: TStringField;
    qryPesqProdsprodutoid: TLongintField;
    qryPesqProdsstatus_produto: TStringField;
    qryPesqProdsvl_venda_produto: TFloatField;
    ZConnection1: TZConnection;
    qryGenericNextValue: TZQuery;
    qryPesqClienteOrc: TZQuery;
    qryPesqProds: TZQuery;
    qryOrcItens: TZQuery;
    procedure DataModuleCreate(Sender: TObject);
    procedure qryOrcItensNewRecord(DataSet: TDataSet);
    procedure ZConnection1AfterConnect(Sender: TObject);
  private

  public

  end;

var
  DataModule1: TDataModule1;

implementation

{$R *.lfm}

{ TDataModule1 }

procedure TDataModule1.DataModuleCreate(Sender: TObject);
begin
  ZConnection1.HostName := 'localhost';
  ZConnection1.DataBase := 'postgres';
  ZConnection1.User     := 'postgres';
  ZConnection1.Password := '1234';
  ZConnection1.Port     := 5432;
  ZConnection1.Protocol := 'postgresql';
  ZConnection1.Connected := True;  
end;

procedure TDataModule1.qryOrcItensNewRecord(DataSet: TDataSet);
begin
  qryGenericNextValue.Close;
  qryGenericNextValue.SQL.Clear;
  qryGenericNextValue.SQL.Add('select nextval('+QuotedStr('orcamento_item_seq')+')as CODIGO');
  qryGenericNextValue.Open;
  
  qryOrcItensorcamentoitemid.AsInteger:= qryGenericNextValue.FieldByName('CODIGO').AsInteger;
end;

procedure TDataModule1.ZConnection1AfterConnect(Sender: TObject);
begin

end;

end.
