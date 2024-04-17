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
  private

  public

  end;

var
  relProdutos: TrelProdutos;

implementation

{$R *.lfm}

end.

