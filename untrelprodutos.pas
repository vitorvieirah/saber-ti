unit untRelProdutos;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, Buttons,
  ZDataset, LR_Class, LR_DBSet;

type
  
  { TrelProdutos }

  TrelProdutos = class(TForm)
    BitBtn1: TBitBtn;
    frDBDataSet1: TfrDBDataSet;
    frReport1: TfrReport;
    qryRelProdutos: TZQuery;
    procedure BitBtn1Click(Sender: TObject);
  private

  public

  end;

var
  relProdutos: TrelProdutos;

implementation

{$R *.lfm}

{ TrelProdutos }

procedure TrelProdutos.BitBtn1Click(Sender: TObject);
begin
  frReport1.LoadFromFile('relProdutos.lrf');
  frReport1.PrepareReport;
  frReport1.ShowReport;
end;

end.

