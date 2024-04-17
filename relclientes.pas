unit relClientes;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, ZDataset,
  LR_DBSet, LR_Class, untConnection, DB;

type
  
  { TrelClientesF }

  TrelClientesF = class(TForm)
    Button1: TButton;
    frDBDataSet1: TfrDBDataSet;
    frReport1: TfrReport;
    qryRelClientes: TZQuery;
    qryRelClientesclienteid: TLongintField;
    qryRelClientescpf_cnpj_cliente: TStringField;
    qryRelClientesnome_cliente: TStringField;
    qryRelClientestipo_cliente: TStringField;
    procedure Button1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private

  public

  end;

var
  relClientesF: TrelClientesF;

implementation

{$R *.lfm}

{ TrelClientesF }

procedure TrelClientesF.FormShow(Sender: TObject);
begin
  qryRelClientes.Open;
end;

procedure TrelClientesF.Button1Click(Sender: TObject);
begin
   frReport1.LoadFromFile('relClientes.lrf');
   frReport1.PrepareReport;
   frReport1.ShowReport; 
end;

end.

