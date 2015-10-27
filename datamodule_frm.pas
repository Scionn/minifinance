unit datamodule_frm;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, db, FileUtil, ZConnection, ZDataset, ZSqlUpdate, ZAbstractDataset;

type

  { TDataModule1 }

  TDataModule1 = class(TDataModule)
    zc1: TZConnection;
    zq1: TZQuery;
    zup1: TZUpdateSQL;
    procedure zq1AfterPost(DataSet: TDataSet);
  private
    { private declarations }
  public
    { public declarations }
  end;

var
  DataModule1: TDataModule1;

implementation

{$R *.lfm}

{ TDataModule1 }


procedure TDataModule1.zq1AfterPost(DataSet: TDataSet);
begin
  zq1.Refresh;
end;



end.

