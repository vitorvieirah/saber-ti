unit Unit1;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, Buttons, LR_Class,
  LR_DBSet, ZDataset;

type
  
  { TrelOrcamentosF }

  TrelOrcamentosF = class(TForm)
    BitBtn1: TBitBtn;
    frDBDataSet1: TfrDBDataSet;
    frReport1: TfrReport;
    qryRelOrcamentos: TZQuery;
    procedure BitBtn1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private

  public

  end;

var
  relOrcamentosF: TrelOrcamentosF;

implementation

{$R *.lfm}

{ TrelOrcamentosF }

procedure TrelOrcamentosF.FormCreate(Sender: TObject);
begin

end;

procedure TrelOrcamentosF.BitBtn1Click(Sender: TObject);
begin
  frReport1.LoadFromFile('relProdutos.lrf');
  frReport1.PrepareReport;
  frReport1.ShowReport;  
end;

end.

