unit fidi_frm;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, ExtCtrls,
  DbCtrls, StdCtrls;

type

  { TFidi }

  TFidi = class(TForm)
    dbcbaffidamentofiltro: TDBLookupComboBox;
    Label1: TLabel;
    Label10: TLabel;
    Label2: TLabel;
    Panel1: TPanel;
    procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);
  private
    { private declarations }
  public
    { public declarations }
  end;

var
  Fidi: TFidi;

implementation

{$R *.lfm}

{ TFidi }

procedure TFidi.FormClose(Sender: TObject; var CloseAction: TCloseAction);
begin
  CloseAction:=caFree;
end;

end.

