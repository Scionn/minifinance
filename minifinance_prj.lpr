program minifinance_prj;

{$mode objfpc}{$H+}

uses
  {$IFDEF UNIX}{$IFDEF UseCThreads}
  cthreads,
  {$ENDIF}{$ENDIF}
  Interfaces, // this includes the LCL widgetset
<<<<<<< HEAD
  Forms, mainform_frm, zcomponent, CONTI_FRM, estrattoconto_frm,
  datetimectrls, affidamenti_frm, tipiaffidamento_frm, fidi_frm
=======
  Forms, mainform_frm, zcomponent, datamodule_frm, CONTI_FRM, estrattoconto_frm,
  datetimectrls, affidamenti_frm, tipiaffidamento_frm
>>>>>>> 2ac5b01efa4eeec6039ea3efba2a8455d156af84
  { you can add units after this };

{$R *.res}

begin
  RequireDerivedFormResource := True;
  Application.Initialize;
  Application.CreateForm(Tmainform, mainform);
<<<<<<< HEAD
=======
  Application.CreateForm(TDataModule1, DataModule1);
  Application.CreateForm(TAffidamenti, Affidamenti);
  Application.CreateForm(Ttipiaffidamento, tipiaffidamento);
>>>>>>> 2ac5b01efa4eeec6039ea3efba2a8455d156af84
  Application.Run;
end.

