unit datamodule_frm;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, db, FileUtil, ZConnection, ZDataset, ZSqlUpdate;

type

  { TDataModule1 }

  TDataModule1 = class(TDataModule)
    dsfiditipofido: TDataSource;
    ds1: TDataSource;
    dsanagaff: TDataSource;
    dsanagconti: TDataSource;
    dsanagfidi: TDataSource;
    dsanagtipoaff: TDataSource;
    zc1: TZConnection;
    zq1: TZQuery;
    zqanagaff: TZQuery;
    zqanagconti: TZQuery;
    zqanagfidi: TZQuery;
    zqanagtipoaff: TZQuery;
    zqfiditipofido: TZQuery;
    zup1: TZUpdateSQL;
    zupanagaff: TZUpdateSQL;
    zupanagconti: TZUpdateSQL;
    zupfiditipofido: TZUpdateSQL;
    zupanagfidi: TZUpdateSQL;
    zupanagtipoaff: TZUpdateSQL;
    procedure zq1AfterRefresh(DataSet: TDataSet);
  private
    { private declarations }
  public
    { public declarations }
  end;

var
  DataModule1: TDataModule1;

implementation

{$R *.lfm}


procedure Tdatamodule1.zq1AfterRefresh(DataSet: TDataSet);
begin
   zq1.Refresh;
end;



end.

