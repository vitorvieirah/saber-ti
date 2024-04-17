unit Unit4;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, Buttons, LR_Class,
  LR_DBSet, ZDataset;

type
  
  { TrelUsuariosF }

  TrelUsuariosF = class(TForm)
    BitBtn1: TBitBtn;
    frDBDataSet1: TfrDBDataSet;
    frReport1: TfrReport;
    qryRelUsuarios: TZQuery;
    procedure BitBtn1Click(Sender: TObject);
  private

  public

  end;

var
  relUsuariosF: TrelUsuariosF;

implementation

{$R *.lfm}

{ TrelUsuariosF }

procedure TrelUsuariosF.BitBtn1Click(Sender: TObject);
begin
  frReport1.LoadFromFile('relUsuarios.lrf');
  frReport1.PrepareReport;
  frReport1.ShowReport;
end;

end.

