{**************************************************************************}
{ TAdvSmoothExpanderButtonPanel DESIGN TIME EDITOR                                       }
{ for Delphi & C++Builder                                                  }
{                                                                          }
{ written by TMS Software                                                  }
{            copyright � 2009                                              }
{            Email : info@tmssoftware.com                                  }
{            Web : http://www.tmssoftware.com                              }
{                                                                          }
{ The source code is given as is. The author is not responsible            }
{ for any possible damage done due to the use of this code.                }
{ The component can be freely used in any application. The complete        }
{ source code remains property of the author and may not be distributed,   }
{ published, given or sold in any form as such. No parts of the source     }
{ code can be included in any other component or application without       }
{ written authorization of the author.                                     }
{**************************************************************************}

unit AdvSmoothExpanderButtonPanelDE;

interface

{$I TMSDEFS.INC}

uses
  Classes, AdvSmoothFillPreview, AdvSmoothExpanderButtonPanel, AdvSmoothFillEditor, GDIPFill,
  {$IFDEF DELPHI6_LVL}
  DesignIntf, DesignEditors
  {$ELSE}
  DsgnIntf
  {$ENDIF}
  ;

type
  TAdvSmoothExpanderButtonPanelEditor = class(TDefaultEditor)
  protected
    {$IFNDEF DELPHI6_LVL}
    procedure EditProperty(PropertyEditor: TPropertyEditor;
                           var Continue, FreeEditor: Boolean); override;
    {$ELSE}
    procedure EditProperty(const PropertyEditor: IProperty; var Continue: Boolean); override;
    {$ENDIF}
  public
    function GetVerb(index:integer):string; override;
    function GetVerbCount:integer; override;
    procedure ExecuteVerb(Index:integer); override;
  end;


implementation

uses
  SysUtils, Forms, AdvSmoothStyles, Dialogs, Controls, AdvStyleIF;

{$IFDEF DELPHI6_LVL}
procedure TAdvSmoothExpanderButtonPanelEditor.EditProperty(const PropertyEditor: IProperty; var Continue: Boolean);
{$ELSE}
procedure TAdvSmoothExpanderButtonPanelEditor.EditProperty(PropertyEditor: TPropertyEditor;
  var Continue, FreeEditor: Boolean);
{$ENDIF}
var
  PropName: string;
begin
  PropName := PropertyEditor.GetName;
  if (CompareText(PropName, 'FILL') = 0) then
    begin
      PropertyEditor.Edit;
      Continue := False;
    end;
end;

procedure TAdvSmoothExpanderButtonPanelEditor.ExecuteVerb(Index: integer);
var
  psf: TAdvSmoothStyleForm;
  style: TTMSStyle;
begin
  inherited;
  if (Index = 0) then
  begin
    psf := TAdvSmoothStyleForm.Create(Application);
    if psf.ShowModal = mrOK then
    begin
      //ShowMessage(inttostr(psf.RadioGroup1.ItemIndex));
      style := tsOffice2003Blue;
      case psf.RadioGroup1.ItemIndex of
        1: style := tsOffice2003Olive;
        2: style := tsOffice2003Silver;
        3: style := tsOffice2003Classic;
        4: style := tsOffice2007Luna;
        5: style := tsOffice2007Obsidian;
        6: style := tsOffice2007Silver;
        7: style := tsOffice2010Blue;
        8: style := tsOffice2010Silver;
        9: style := tsOffice2010Black;
        10: style := tsWindowsXP;
        11: style := tsWindowsVista;
        12: style := tsWindows7;
        13: style := tsTerminal;
      end;
      if (Component is TAdvSmoothExpanderButtonPanel) then
         (Component as TAdvSmoothExpanderButtonPanel).SetComponentStyle(style);
         Designer.Modified;
    end;
    psf.Free;
  end;
end;

function TAdvSmoothExpanderButtonPanelEditor.GetVerb(index: integer): string;
begin
  if index = 0 then
    Result := 'Styles';
end;

function TAdvSmoothExpanderButtonPanelEditor.GetVerbCount: integer;
begin
  Result := 1;
end;



end.







