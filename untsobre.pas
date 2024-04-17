unit untSobre;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, Buttons;

type
  
  { TsobreF }

  TsobreF = class(TForm)
    bitBtnSair: TBitBtn;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    procedure bitBtnSairClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure Label1Click(Sender: TObject);
  private

  public

  end;

var
  sobreF: TsobreF;

implementation

{$R *.lfm}

{ TsobreF }

procedure TsobreF.Label1Click(Sender: TObject);
begin

end;

procedure TsobreF.FormCreate(Sender: TObject);
begin

end;

procedure TsobreF.bitBtnSairClick(Sender: TObject);
begin
  Close;
end;

procedure TsobreF.FormClose(Sender: TObject; var CloseAction: TCloseAction);
begin
  CloseAction := caFree;
end;

end.

