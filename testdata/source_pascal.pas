unit unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, ValEdit,
  ExtCtrls, Grids;

type

  { tform1 }

  tform1 = class(TForm)
     button1: TButton;
     groupbox1: tgroupbox;
     labelededit1: tlabelededit;
     labelededit2: tlabelededit;
     labelededit3: tlabelededit;
         stringgrid1: tstringgrid;
     procedure button1click(Sender: TObject);
  private

  public

  end;

var
  form1: tform1;
implementation

{$R *.lfm}
{ tform1 }

procedure tform1.button1click(Sender: TObject);
  var
     j, e, a, t, i: integer;
     tmp: array[0..3] of string;
  begin
     j := strtoint(labelededit1.Text);
     e := strtoint(labelededit2.Text);
     a := strtoint(labelededit3.Text);
     for i := 0 to 5 do
       begin
         tmp[0] := inttostr(i);
         tmp[1] := inttostr(j);
         tmp[2] := inttostr(e);
         tmp[3] := inttostr(a);
         stringgrid1.InsertRowWithValues(i + 1, tmp);
         t := e * 4 + a * 2;
         a := e;
         e := j;
         j := t;
       end;
  end;
end.
