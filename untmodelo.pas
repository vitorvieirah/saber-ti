unit untModelo;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, DB, Forms, Controls, Graphics, Dialogs, ComCtrls, StdCtrls,
  Buttons, ExtCtrls, DBGrids;

type
  
  { TmodeloCadF }

  TmodeloCadF = class(TForm)
    bitBtnCancelar: TBitBtn;
    bitBtnExcluir: TBitBtn;
    bitBtnGravar: TBitBtn;
    bitBtnNovo: TBitBtn;
    bitBtnSair: TBitBtn;
    dsPrincipal: TDataSource;
    DBGrid1: TDBGrid;
    edtPesquisa1: TEdit;
    pnlPesquiaTop: TPanel;
    pnlPesquiaBot: TPanel;
    pnlCadastroBot: TPanel;
    pgcModelo: TPageControl;
    spBtnPesquisar: TSpeedButton;
    tbsPesquisa: TTabSheet;
    tbsCadastro: TTabSheet;
    procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);
  private

  public

  end;

var
  modeloCadF: TmodeloCadF;

implementation

{$R *.lfm}

{ TmodeloCadF }

procedure TmodeloCadF.FormClose(Sender: TObject; var CloseAction: TCloseAction);
begin
  CloseAction:= caFree;
end;

end.

